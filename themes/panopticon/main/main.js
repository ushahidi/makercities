function drawWindow(){
	//console.log('drawing big-maps to '+(window.innerHeight-$('#header_nav').outerHeight()))
	$('#middle, .big-map, #panel-wrapper, .panel, .panel iframe').css('height', window.innerHeight-$('#header_nav').outerHeight());
	$('.big-map.panel-open').css('width', window.innerWidth-400);
	updateMapsSize();
}

function updateMapsSize(){
	map.resize();
	if(frames[0].map) frames[0].map.updateSize();
}

function managePanelControls(panelName){
	switch(panelName) {
		case 'submit':
			$('#map').hide();
			$('#reportMap, #addingFuture').show();
			$('#mapFilters, #mapControls').hide();
			break;
		case 'pins':
			var pinsFrame = $('iframe[name="pins"]');
			if (pinsFrame.length) {
				if (pinsFrame[0].contentWindow.fetchReports) pinsFrame[0].contentWindow.fetchReports();
			}
		default:
			$('#map').show();
			$('#reportMap, #addingFuture').hide();
			$('#mapFilters, #mapControls').show();
			break;
	}
}

function syncMapLocations(){

}

function refreshLeaderboard() {
	$.ajax({
		url: '/reports/city_leaderboard',
		success: function(res) {
			$('#leaderboard .cities').html(res);
		},
		dataType: 'html'
	});
}

jQuery(document).ready(function($) {
	var hash = document.location.hash.substr(1),
			searchHash;

	if(!$('#panel-wrapper').hasClass('closed')) $('body, .big-map, #leaderboard').addClass('panel-open');

	// Draw map on page load
	drawWindow();

	// Redraw map on resize
	$(window).resize(function(){ drawWindow(); });

	// Panels
	// ==========

	$('#mapStatus, #mapControls').addClass('panel-open');

	// Hide all panels
	$('#panel-wrapper .panel').hide();

	// Show active/first panel
	var activePanel = $('#panel-tabs li.active:first')
			panelHash   = ( !hash.match(/=/) ) ? hash : 'nope',
			hashPanel   = $('#panel-tabs li.panel-' + panelHash);

	if (!activePanel.length) activePanel = $('#panel-tabs li.panel-pins');
	if (hashPanel.length)    activePanel = hashPanel;

	if (activePanel.length) {
		activePanel.addClass('active');
		var panelName = activePanel.attr('class').match(/panel-(\w+)/);
		$('#' + panelName[1] + '-panel').show(); // Show active
		managePanelControls(panelName[1]);
	}

	// Hide panel if #panel-closed
	if (hash == 'panel-closed') {
		closePanel();
	} else if (hash == 'how-to-play') { // Display How To Play
		helpModal('work');
	}

	// Show about panel on click

	$('#about-link').click(function() {
		$('#panel-tabs li.active').removeClass('active');
		$('#panel-wrapper .panel').hide();
		$("#about-panel").show();
	});



	// Show panel on tab click
	$('#panel-tabs li a').click(function() {
		var li      = $(this).parent('li'),
			wrapper = $('#panel-wrapper'),
			panelName,
			lastPanel;

		$(this).blur(); // shh

		if (wrapper.hasClass('closed')) { // Open panel
			wrapper.removeClass('closed').addClass('open');
			$('#mapStatus, #mapControls, .big-map, #leaderboard, #tweets').addClass('panel-open');
			setTimeout(function() {
				drawWindow();
				$('body').addClass('panel-open');
			}, 200);
		} else if (li.hasClass('active')) { // Close panel
			closePanel();
			return;
		}

		// Hide all
		$('#panel-wrapper .panel').hide();

		lastPanel = $('#panel-tabs li.active').removeClass('active');
		if (lastPanel.length) lastPanel = lastPanel.attr('class').match(/panel-(\w+)/);
		panelName = $(this).attr('href').replace('#', '');

		if (panelName == 'submit') {
			if (map && window.reports.map) {
				window.reports.map.setCenter([map._olMap.center.lon, map._olMap.center.lat], map._olMap.zoom);
				window.setTimeout(function() { window.reports.map.baseLayer.redraw(); }, 500);
			}
		} else if (lastPanel == 'submit') {
			if (window.reports.map) map._olMap.setCenter([window.reports.map.center.lon, window.reports.map.center.lat], window.reports.map.zoom);
		}

		$('#' + panelName + '-panel').show(); // Show clicked
		managePanelControls(panelName);
		$('#panel-tabs li.panel-' + panelName).addClass('active');

	});

	$('#info-x').click(function() {
		var panelInfo = $('#panel-tabs .panel-info');

		panelInfo.removeClass('open').find('a').attr('href', '#').css({ display: 'none' }).click();
		$('#info-panel').hide();
		$('#info-panel iframe').attr('src', 'about:blank');
		$('#panel-tabs .panel-pins a').click();
			document.location.hash = 'pins';
	});

	$('#map')
		.observe('childlist', '#chicken', function(record) {
			$('#chicken .infowindow_meta a:first, #chicken, .infowindow_list a:first').click(reportClick);
		});

	$(window).bind('hashchange', reportHashClick);
	reportHashClick();

	$('#submitted_futures a.report_link').click(reportClick);
	// Leaderboard Marquee
	// setTimeout("$('#leaderboard .cities').marquee({count:1});", 3000);

	// Intro modal
	$('#intro').hide();
	$('#intro #modal-x').click(function() {
		$('#intro').fadeOut('fast');
		$('#intro').hide();
		$.cookie('hide_intro', '1', { expires: 1000 });
		document.location.hash = '';
	});

	$('#introTourLink').click(function() {
		$('#intro').fadeOut('fast');
	});

	$(".introModaInstructionsLink").click(function(){
		$('#intro').fadeOut('fast');
	});

	// $.removeCookie('hide_intro');

	$('#intro-video .placeholder').click(function() {
		var vid = $('#intro-video .vid');
		$(this).hide();
		vid.show().attr({
			src: vid.attr('data-videoUrl')
		});

		return false;
	});

	$('#intro .modal, #modal .modal').click(function(e) {
		e.stopPropagation();
	});

	$('#modal, #modal .modal-x, #modal .close').click(function() {
		$('#modal').fadeOut('fast');
		$(this).blur();
	});

	if (hash.match(/^(intro|register|forgot)$/)) {
		console.log('intro');
		$('#intro').show();
		if (hash != 'intro') {
			$('#intro').addClass('reg');
			$('#register-forgot').show().find('> div').hide();
			$('#register-forgot .' + hash).show();
		}
	} else if (searchHash = hash.match(/^(search|city)=(.*)/)) {
		// Search city if city hash is available
		var searchTerm = decodeURIComponent(searchHash[2].replace(/\+/g,  ' '));
		$('#search-bar')
			.val(searchTerm)
			.focus();
		geoCode();
	}

	// Hide it if we've got a Close cookie or hash to load
	if ( $.cookie('hide_intro') == undefined && document.location.hash == '' ) $('#intro').show();

	$('a[href="#tutorial"]').click(showTutorial);

	$('a[href="#intro"]').click(function() {
		$(this).blur();
		$('.tutorial').removeClass('active').addClass('closed');
		$('#mapFilters').removeClass('active');
		$('#intro').show();
	});

	// #intro register/forgot
	$('#register-button, #forgot-password-link').click(function() {
		var register = $(this).attr('id').match(/register/),
			hide     = (register) ? 'forgot' : 'register',
			show     = (register) ? 'register' : 'forgot';

		document.location.hash = show;
		$(this).blur();
		$('#intro').addClass('reg');
		$('#register-forgot .' + hide).hide();
		$('#register-forgot .' + show).show();
		$('#register-forgot').show();
		// $('#register-forgot').delay(200).slideDown('fast');

		$('#intro').animate({ scrollTop: $('#register-forgot').position().top + 10 }, 100);
	});

	$('#register-forgot').on('submit', function() {
		$.cookie('hide_intro', '1', { expires: 1000 });
	});

	$('.tutorial .btn.next').click(function(){
		$(this).parent().removeClass('active').addClass('closed');
		var tut = $('.tutorial').not('.closed').first().addClass('active');
		switch(tut.attr('id')){
			case 'tutorial-mapfilter':
						$('#panel-tabs .panel-pins:not(.active) a').click();
						$('#mapFilters').addClass('active');
						break;
			case 'tutorial-leaderboard':
				$('#mapFilters').removeClass('active');
				$('#panel-tabs .panel-scoreboard:not(.active) a').click();
				break;
			case 'tutorial-latest':
				$('#panel-tabs .panel-pins:not(.active) a').click();
				break;
			case 'tutorial-submit':
				$('#panel-tabs .panel-submit:not(.active) a').click();
				$.cookie('hide_tutorial', '1', { expires: 1000 });
				break;
		}
	});

	$('#search-bar')
		.autoGrowInput({
			comfortZone: 20,
			minWidth: 213,
			maxWidth: 536
		})
		.bind('blur', function() {
			$(this).attr('style', '');
		});
	
	$('#search-form').bind('submit', function(e) {
			e.preventDefault();
			geoCodeWithZoom(4);
	});

	$('#leaderboard').on('click', 'a.city', function(e) {
		leaderboardSearch($(this).find('.city-name').text());
	});

	$('#myLocationZoom').click(function() {
		// Setup Geolocation failure
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(function(){}, noGeolocation);
		} else {
			noGeolocation();
		}

		var mapObj = ($('#map').is(':visible')) ? false : window.frames['reports'].map;
		map.zoomToCurrentLocation(mapObj);
	});

	setInterval("refreshLeaderboard()", 60000);

	$('a[href^="#help-"]').click(function() {
		var section = $(this).attr('href').replace(/^#help-/, '');
		helpModal(section);
	});

	$('a[href^="#how-to-play"]').click(function() {
		helpModal('work');
	});

	$('#modal .ball[title]').on('mouseenter mouseleave', function(e) {
		var tooltip;

		if (e.type == 'mouseleave') {
			tooltip = $(this).find('.arrow_box');
			if (tooltip) {
				$(this).attr('title', tooltip.text());
				tooltip.remove();
				return;
			}
		}

		tooltip = $('<div class="arrow_box top"/>').appendTo(this).text($(this).attr('title'));
		$(this).attr('title', '');
	}).click(function() {
		var section = $(this)[0].className.match(/modal-(\w+)/)[1];
		helpModal(section);
	});

	$('#helpModal-continue').click(function() {
		var balls = $('#modal .help .ball:not(.filled)');
		if (balls.length) {
			balls.eq(0).click();
		} else {
			$.removeCookie('just_registered');
			if ($('#intro').is(':visible')) $('#intro .modal.intro').show();

			$('#modal').fadeOut('fast');
			$(this).blur();
		}
	});

	// Show the Help modal for new users
	if ($.cookie('just_registered') != undefined) helpModal('work');

	zoomToLongLatZoom(map_config.center.longitude, map_config.center.latitude, map_config.zoom);

// end document.ready()
});

function reportClick(href) {
	var href     = (href && typeof href == 'object') ? $(this).attr('href') : href,
			panel    = (href.match(/\?/)) ? '&panel' : '?panel',
			iframe   = $('#info-panel iframe'),
			panelTab = $('#panel-tabs .panel-info');

	document.location.hash = href.replace(/^https?:\/\/.*?\//, '');

	$('#panel-tabs li.active').removeClass('active');
	$('#panel-wrapper .panel').hide();

	$('#info-x, #info-panel').addClass('loading');
	panelTab.addClass('open')
		.find('a').attr('href', document.location.hash);
	$('#panel-tabs .panel-info:not(.active) a')
		.css({ display: 'block' })
		.click();

	$('#info-panel').css({ display: 'block' });

	iframe[0].contentWindow.document.body.innerHTML = '';
	iframe.attr('src', href + panel);

	$('#header_nav_right .header_nav_dropdown').hide();

	return false;
}

function reportHashClick() {
	var hash = document.location.hash.substr(1);
	if ( !hash.match(/^reports\//) ) return;
	reportClick(siteRoot + hash);
}

function closePanel() {
	//
	// not needed in redesign
	//
	//$('#panel-wrapper').removeClass('open').addClass('closed');
	//document.location.hash = 'panel-closed';
	//$('.big-map').css('width', '100%');
	//updateMapsSize();
	//$('body, #mapStatus, #mapControls, .big-map').removeClass('panel-open');
}

/**
 * Google GeoCoder
 */
function geoCode(){
	geoCodeWithZoom(4);
}

function geoCodeWithZoom(zoom) {

	var optionBox = $('#option-box').find(":selected").text();

	var searchBox = $('#search-bar'),
		address   = searchBox.val(),
			mainMap = $('#map').is(':visible');

	if (!mainMap && window.frames['reports'].geoCode) {
		window.frames['reports'].geoCode(searchBox);
		return;
	}

	if (optionBox == 'Location') {
		searchBox.addClass('loading');
		$.post(siteRoot + "/reports/geocode/", { address: address },
			function(data){
				if (data.status == 'success'){
					// create a new lat/lon object
					zoomToLongLatZoom(data.longitude, data.latitude, 9 /* zoom */);

					// Update form values
					searchBox.val(data.location_name).trigger('update');

					//reportClick(siteRoot + "/reports/?");
					var extent = map._olMap.getExtent().transform(new OpenLayers.Projection("EPSG:900913"), new OpenLayers.Projection("EPSG:4326"));
					reportClick(siteRoot + "/reports/?ne="+extent.right+","+extent.top+"&sw="+extent.left+","+extent.bottom);

					// Exit if this is a City click
					if (!document.location.hash.match(/^#city=/i))
						document.location.hash = 'search=' + encodeURIComponent(data.location_name).replace(/%20/g, '+');

				} else {
					// Alert message to be displayed
					var alertMessage = address + " not found!\n\n***************************\n" +
						"Enter more details like city, town, country\nor find a city or town " +
						"close by and zoom in\nto find your precise location";

					alert(alertMessage);
				}

				searchBox.removeClass('loading');
			}, "json");
		return false;
	}
	else if (optionBox == 'Keyword'){
		// Update futures as per location name
		reportClick(siteRoot + "/reports/?q=" + address);
		map.updateReportFilters({ q: address});
		
	}
}

function zoomToLongLat(longitude, latitude) {
	zoomToLongLatZoom(longitude, latitude, 9);
}

function zoomToLongLatZoom(longitude, latitude, zoom) {
	var mapObj    = map._olMap,
			proj_4326 = new OpenLayers.Projection('EPSG:4326'),
			myPoint   = new OpenLayers.LonLat(longitude, latitude);

	myPoint.transform(proj_4326, mapObj.getProjectionObject());

	// display the map centered on a latitude and longitude
	mapObj.setCenter(myPoint, zoom, true, true);
}

function noGeolocation() {
	alert("Geolocation has been disabled or is unavailable in your browser.");
	$('body').addClass('no-geolocation');
	$('#myLocationZoom').attr({ title: "Geolocation has been disabled or is unavailable in your browser." });
}

function showTutorial() {
	if (this) $(this).blur();
	if($('.tutorial.active').length > 0)
		return;
	$('#panel-tabs .panel-pins:not(.active) a').click();
	$('.tutorial').removeClass('closed');
	$('.tutorial').not('.closed').first().addClass('active');
}

function ordinal_suffix_of(i) {
	var j = i % 10;
	if (j == 1 && i != 11) {
		return i + "st";
	}
	if (j == 2 && i != 12) {
		return i + "nd";
	}
	if (j == 3 && i != 13) {
		return i + "rd";
	}
	return i + "th";
}

function submitModal(res) {
	if (!res.id) return;

	var modal = $('#modal'),
			num   = (res.postCount == 1) ? 'first' : ordinal_suffix_of(res.postCount);

	$('#modal .modal, #modal .help').hide();
	$('#modal, #modal .submit').show();

	modal.removeClass().addClass('submit');
	modal.find('.number').text(num);
	if (modal.find('.city').length) modal.find('.city').attr({ href: '/#city=' + escape(res.city) }).text(res.city);
	if (modal.find('.name').length) modal.find('.name').attr({ href: '/#reports/view/' + res.id }).html('&quot;' + res.name + '&quot;');
	modal.find('.share a').each(function() {
		$(this).attr({ href: $(this).attr('href').replace(/reports%2Fview%2F\d+/, 'reports%2Fview%2F' + res.id) });
	});
	modal.show();

	refreshLeaderboard();
}

function helpModal(section, stayOpen) {
	var modal = $('#modal'),
		nextBall;
	modal.removeClass().addClass('help');

	if ($('#intro').is(':visible')) $('#intro .modal.intro').hide();

	$('#modal .modal, #modal .help .section').hide();
	$('#modal, #modal .help, #modal .help .' + section).show();

	nextBall = $('#modal .help .ball.modal-' + section + ' ~ .ball:first');
	$('#helpModal-continue').text(nextBall.length ? nextBall.attr('title') : $('#helpModal-continue').data('continue') );

	$('#modal .help .balls .ball').removeClass('filled');
	$('#modal .help .balls .ball').each(function() {
		$(this).addClass('filled');
		if ($(this).hasClass('modal-' + section)) return false;
	});
}

function leaderboardSearch(city) {
	city = city.replace(/:$/, '');
	document.location.hash = 'city=' + city;

	$('#search-bar')
			.val(city)
			.trigger('update')
			.focus();
	geoCodeWithZoom(13);
}
