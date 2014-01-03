<?php
/**
 * Reports view js file.
 *
 * Handles javascript stuff related to reports view function.
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license 
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team <team@ushahidi.com> 
 * @package    Ushahidi - http://source.ushahididev.com
 * @module     Reports Controller
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL) 
 */
?>

// Set the base url
Ushahidi.baseURL = "<?php echo url::site(); ?>";

jQuery(window).load(function() {
	if (window != window.top && !document.location.href.match(/(\?|&)panel$/)) {
		$('<link rel="stylesheet" type="text/css" href="/themes/panopticon/_panel.css" >').appendTo('head');
	}

	<?php echo map::layers_js(FALSE); ?>
	var stamen_layer = new OpenLayers.Layer.Stamen("toner-lite");

	// Configuration for the map
	var mapConfig = {

		// Zoom level
		zoom: <?php echo ($incident_zoom) ? $incident_zoom : intval(Kohana::config('settings.default_zoom')); ?>,

		// Map center
		center: {
			latitude: <?php echo $latitude; ?>,
			longitude: <?php echo $longitude; ?>
		},

		// Map controls
		mapControls: [
			new OpenLayers.Control.Navigation({ dragPanOptions: { enableKinetic: true } }),
			new OpenLayers.Control.Zoom(),
			new OpenLayers.Control.MousePosition(),
			new OpenLayers.Control.ScaleLine(),
			new OpenLayers.Control.Scale('mapScale'),
			new OpenLayers.Control.LayerSwitcher(),
			new OpenLayers.Control.Attribution()
		],

		// Base layers
		// baseLayers: <?php echo map::layers_array(FALSE); ?>
		baseLayers: [stamen_layer]

	};

	// Set Feature Styles
	var style1 = new OpenLayers.Style({
		pointRadius: "8",
		fillColor: "${fillcolor}",
		fillOpacity: "0.7",
		strokeColor: "${strokecolor}",
		strokeOpacity: "0.7",
		strokeWidth: "${strokewidth}",
		graphicZIndex: 1,
		externalGraphic: "${graphic}",
		graphicOpacity: 1,
		graphicWidth: 21,
		graphicHeight: 25,
		graphicXOffset: -14,
		graphicYOffset: -27
	},
	{
		context: 
		{
			graphic: function(feature) {
				if (typeof(feature) != 'undefined' && 
					feature.data.id == <?php echo $incident_id; ?>)
				{
					return "<?php echo url::file_loc('img').'media/img/openlayers/marker.png' ;?>";
				}
				else
				{
					return "<?php echo url::file_loc('img').'media/img/openlayers/marker-gold.png' ;?>";
				}
			},
			fillcolor: function(feature) {
				if ( typeof(feature.attributes.color) != 'undefined' && 
					feature.attributes.color != '' )
				{
					return "#"+feature.attributes.color;
				}
				else
				{
					return "#ffcc66";
				}
			},
			strokecolor: function(feature) {
				if ( typeof(feature.attributes.strokecolor) != 'undefined' && 
					feature.attributes.strokecolor != '')
				{
					return "#"+feature.attributes.strokecolor;
				}
				else
				{
					return "#CC0000";
				}
			},					
			strokewidth: function(feature) {
				if ( typeof(feature.attributes.strokewidth) != 'undefined' && 
					feature.attributes.strokewidth != '')
				{
					return feature.attributes.strokewidth;
				}
				else
				{
					return "3";
				}
			}
		}
	});

	var style2 = new OpenLayers.Style({
		pointRadius: "8",
		fillColor: "#30E900",
		fillOpacity: "0.7",
		strokeColor: "#197700",
		strokeWidth: 3,
		graphicZIndex: 1
	});


	// Styles to use for rendering the markers
	var styleMap = new OpenLayers.StyleMap({
		'default': style1,
		'select': style1,
		'temporary': style2
	});


	// Initialize the map
	// var map = new Ushahidi.Map('map', mapConfig);
	// map.addLayer(Ushahidi.GEOJSON, {
	// 	name: "Single Report",
	// 	url: "<?php echo 'json/single/'.$incident_id; ?>",
	// 	styleMap: styleMap
	// });
	
	// Ajax Validation for the comments
	$("#commentForm").validate({
		rules: {
			comment_author: {
				required: true,
				minlength: 3
			},
			comment_email: {
				required: true,
				email: true
			},
			comment_description: {
				required: true,
				minlength: 3
			},
			captcha: {
				required: true
			}
		},
		messages: {
			comment_author: {
				required: "Please enter your Name",
				minlength: "Your Name must consist of at least 3 characters"
			},
			comment_email: {
				required: "Please enter an Email Address",
				email: "Please enter a valid Email Address"
			},
			comment_description: {
				required: "Please enter a Comment",
				minlength: "Your Comment must be at least 3 characters long"
			},
			captcha: {
				required: "Please enter the Security Code"
			}
		}
	});
	
	// Handles the functionality for changing the size of the map
	// TODO: make the CSS widths dynamic... instead of hardcoding, grab the width's
	// from the appropriate parent divs
	$('.map-toggles a').click(function() {
		var action = $(this).attr("class");
		$('ul.map-toggles li').hide();
		switch(action)
		{
			case "wider-map":
				$('.report-map').insertBefore($('.left-col'));
				$('.map-holder').css({"height":"350px", "width": "900px"});
				$('a[href=#report-map]').parent().hide();
				$('a.taller-map').parent().show();
				$('a.smaller-map').parent().show();
				break;
			case "taller-map":
				$('.map-holder').css("height","600px");
				$('a.shorter-map').parent().show();
				$('a.smaller-map').parent().show();
				break;
			case "shorter-map":
				$('.map-holder').css("height","350px");
				$('a.taller-map').parent().show();
				$('a.smaller-map').parent().show();
				break;
			case "smaller-map":
				$('.report-map').hide().prependTo($('.report-media-box-content'));
				$('.map-holder').css({"height":"350px", "width": "348px"});
				$('a.wider-map').parent().show();
				$('.report-map').show();
				break;
		};
		
		map.trigger("resize");
		return false;
	});

	commentPhaseTabs(); // Setup comment tabs

	$('#comments form').ajaxForm({
		success: function(res) {
			// console.log(res);
			var comment      = res.comment,
			    phases       = [ 'proposal', 'stakeholders', 'logistics', 'roadblocks' ],
			    commentClass = 'comment ',
			    commentHtml;

			commentClass = 'comment ';
			if (res.success == 'ok') {
				// Update comment count
				var countDiv = $('.comment.header.' + phases[comment.phase] + ' .count'),
				    commentCount = parseInt(countDiv.text().replace(/[^\d]/, '')) + 1;
				countDiv.text('( ' + commentCount + ' )');

				if (comment.phase > 0) { // Update Certification percentage
					var perc      = $('#certification-percentage'),
					    oldRating = perc.attr('data-text'),
					    newRating = parseInt(perc.attr('data-rating')) + 1,
					    newRatingText = newRating + ' / ' + perc.attr('data-needed'),
					    barPercent = Math.floor(newRating / perc.attr('data-needed') * 100);
					barPercent = (barPercent > 100) ? 100 : barPercent;

					perc.attr({
							'data-rating': newRating,
							'data-text': newRatingText,
							'title': perc.attr('title').replace(new RegExp(oldRating), newRating),
						});
					perc.find('.percentage-bar')
						.css({ width: barPercent + '%' });

				}

				// Add comment
				commentHtml = '<div class="meta"><div class="name">' + comment.author + '</div><div class="date">' + comment.br_date + '</div></div><div class="words">' + comment.description + '</div></div>';
				$('div.comment-phase-' + comment.phase + ' textarea').val('');
			} else if (res.errors) {
				commentHtml = '<div class="words">' + res.errors.join('<br />') + '</div>';
				commentClass += ' empty error ';
			}

			$('div.comment-phase-' + comment.phase).parent().find('.comment.empty').remove();
			$('<div />')
				.addClass(commentClass + phases[comment.phase])
				.html(commentHtml)
				.insertBefore('.comment-phase-' + comment.phase);

			if (!res.errors) { // If there aren't any errors, do this stuff.
				if (window.parent.refreshLeaderboard) window.parent.refreshLeaderboard();

				if (!$('.support-icon.voted').length && $.inArray($('.support-icon').data('id'), supportIgnore()) == -1) { // Remind them to Support
					var supportThis = "<?php echo Kohana::lang('makercities.comments.remember_to_support'); ?><div class=\"icon-x\"></div>";
					$('<div />')
						.addClass('empty support ' + commentClass + phases[comment.phase])
						.html('<div class="words">' + supportThis + '</div>')
						.insertBefore('.comment-phase-' + comment.phase);
				}
			}

			// Change this for Fanfare
			if (res.category && res.category != false)
				location.reload(true);
		}
	});
	$('#comments textarea')
		.autosize()
		.bind('keypress', function(e) {
			var code    = (e.keyCode ? e.keyCode : e.which),
			    isEnter = (code == 13);

			if (isEnter) $(this).parents('form').submit();

			return !isEnter;
		});

	$('.support-icon').click(supportFuture);

	$('#comments').on('click', '.comment.support .icon-x', function(e) {
		supportIgnore($('.support-icon').data('id'));
		$(this).parents('.support.comment').remove();
	});

	$('#comments').on('click', '.comment.support a[href="#support"]', function(e) {
		$('html, body').animate({ scrollTop: 0 }, 500, function() {
			$('.support-icon').click();
		});

		$(this).parents('.support.comment').remove();
		return false;
	});

	$('#builds-tutorial-link').hover(
		function(){
			$('.builds-tutorial.arrow_box').show();
		}, 
		function(){
			$('.builds-tutorial.arrow_box').hide();
		}
	);

	$('#phase-tooltips a.build, #progress .progress-circle.level2').click(function() {
		$('html, body').animate({ scrollTop: $('#comments').offset().top }, 500, function() {
			$('#comments textarea:visible:first').focus();
		});
	});

	$('#phase-tooltips .tooltip-x').click(function() {
		$('#phase-tooltips').animate({ height: 0 }, 200);
		$('#phase-tooltips .arrow_box').fadeOut(200);
		$.cookie('hide_phase_tooltips', 1, { expires: 1000 });
		$('#progress *[data-tooltip]').on('mouseenter mouseleave', dataTooltip);
	});

	$('#progress:not(.tooltips) *[data-tooltip]').off('mouseenter mouseleave', dataTooltip);

	$('#info-x, #info-panel', window.top.document).removeClass('loading');
}); // END jQuery(window).load();

jQuery(window).bind("load", function() {
	jQuery("div#slider1").codaSlider()
	// jQuery("div#slider2").codaSlider()
	// etc, etc. Beware of cross-linking difficulties if using multiple sliders on one page.
});


function supportFuture() {
	var id    = $(this).attr('data-id'),
		voted = $(this).hasClass('voted');
	if (!id || voted) return;

	$.post("<?php echo url::site().'reports/rating/' ?>" + id, { action: 'add', type: 'original' },
		function(data){
			if (data.status == 'saved'){
				var perc      = $('#support-percentage'),
				    oldRating = perc.attr('data-text'),
				    newRating = data.rating + ' / ' + perc.attr('data-needed'),
				    barPercent = Math.floor(data.rating / perc.attr('data-needed') * 100);
				barPercent = (barPercent > 100) ? 100 : barPercent;

				// To-do: Make a loader?

				$('.support-icon')
					.addClass('voted')
					.attr({ title: "You'ved already supported this Future!" });
				perc.attr({
						'data-rating': data.rating,
						'data-text': newRating,
						'title': perc.attr('title').replace(new RegExp(oldRating), newRating),
					});
				perc.find('.percentage-bar')
					.css({ width: barPercent + '%' });

				if (window.parent.refreshLeaderboard) window.parent.refreshLeaderboard();

				if (data.category != false)
					location.reload(true);
			} else {
				if(typeof(data.message) != 'undefined') {
					alert(data.message);
				}
			}
	  	}, "json");
}
		
/**
 * Setup comment phase tabs
 */
function commentPhaseTabs() {
	var comments = $('#comments'),
	    phases   = $('#comment-tabs'),
	    proposal = comments.hasClass('proposal-allowed'),
	    active   = comments.hasClass('active-allowed');
	if (!phases.length) return;

	phases.find('li').click(function() {
		var tab    = $(this).attr('id').replace(/tab-/, ''),
			tabIds = { proposal: 0, active: 1 };

		comments.addClass('animating')
			.css({ height: $('#' + tab + '-comments').outerHeight() + 100 });
		window.setTimeout(function() { comments.removeClass('animating').css({ height: 'auto' }); }, 250);

		phases.find('li').removeClass('active');
		$('#proposal-comments, #active-comments').removeClass('active');
		$('#tab-' + tab + ', #' + tab + '-comments').addClass('active');
	});

	$('#proposal-comments, #active-comments').removeClass('active');
	var activeId = (active) ? '#active-comments' : '#proposal-comments';
	$(activeId).addClass('active');
}

function supportIgnore(id) {
	var arr = $.cookie('support_ignore');
	if (!arr) {
		arr = [];
	} else {
		arr = JSON.parse(arr);
	}

	if (id) {
		arr[arr.length] = id;
		$.cookie('support_ignore', JSON.stringify(arr), { expires: 1000 });
	}

	return arr;
}