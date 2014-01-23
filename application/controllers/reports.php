<?php defined('SYSPATH') or die('No direct script access.');

/**
 * This controller is used to list/ view and edit reports
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author	   Ushahidi Team <team@ushahidi.com>
 * @package	   Ushahidi - http://source.ushahididev.com
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license	   http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL)
 */

class Reports_Controller extends Main_Controller {
	
	/**
	 * Whether an admin console user is logged in
	 * @var bool
	 */
	var $logged_in;

	public function __construct()
	{
		parent::__construct();
		$this->themes->validator_enabled = TRUE;

		// Is the Admin Logged In?
		$this->logged_in = Auth::instance()->logged_in();
	}

	/**
	 * Displays all reports.
	 */
	public function index()
	{
		// Cacheable Controller
		$this->is_cachable = TRUE;

		$this->template->header->this_page = 'reports';
		$this->template->content = new View('reports/main');
		$this->themes->js = new View('reports/reports_js');

		$this->template->header->page_title .= Kohana::lang('ui_main.showing_futures').Kohana::config('settings.title_delimiter');
		$this->template->content->page_title = Kohana::lang('ui_main.showing_futures');

		// Store any exisitng URL parameters
		$this->themes->js->url_params = json_encode($_GET);

		// Enable the map
		$this->themes->map_enabled = TRUE;

		// Set the latitude and longitude
		$this->themes->js->latitude = Kohana::config('settings.default_lat');
		$this->themes->js->longitude = Kohana::config('settings.default_lon');
		$this->themes->js->default_map = Kohana::config('settings.default_map');
		$this->themes->js->default_zoom = Kohana::config('settings.default_zoom');

		// Get Default Color
		$this->themes->js->default_map_all = $this->template->content->default_map_all = Kohana::config('settings.default_map_all');
		
		// Get default icon
		$this->themes->js->default_map_all_icon = $this->template->content->default_map_all_icon = '';
		if (Kohana::config('settings.default_map_all_icon_id'))
		{
			$icon_object = ORM::factory('media')->find(Kohana::config('settings.default_map_all_icon_id'));
			$this->themes->js->default_map_all_icon = $this->template->content->default_map_all_icon = Kohana::config('upload.relative_directory')."/".$icon_object->media_thumb;
		}

		// Load the alert radius view
		$alert_radius_view = new View('alerts/radius');
		$alert_radius_view->show_usage_info = FALSE;
		$alert_radius_view->enable_find_location = FALSE;
		$alert_radius_view->css_class = "rb_location-radius";

		$this->template->content->alert_radius_view = $alert_radius_view;

		// Get locale
		$l = Kohana::config('locale.language.0');

		// Get the report listing view
		$report_listing_view = $this->_get_report_listing_view($l);

		// Set the view
		$this->template->content->report_listing_view = $report_listing_view;

		// Load the category
		$category_id = (isset($_GET['c']) AND intval($_GET['c']) > 0)? intval($_GET['c']) : 0;
		$category = ORM::factory('category', $category_id);

		if ($category->loaded)
		{
			// Set the category title
			$this->template->content->category_title = Category_Lang_Model::category_title($category_id,$l);
		}
		else
		{
			$this->template->content->category_title = "";
		}

		// Collect report stats
		$this->template->content->report_stats = new View('reports/stats');
		
		// Total Reports
		$total_reports = Incident_Model::get_total_reports(TRUE);

		// Get the date of the oldest report
		if (isset($_GET['s']) AND !empty($_GET['s']) AND intval($_GET['s']) > 0)
		{
			$oldest_timestamp =  intval($_GET['s']);
		}
		else
		{
			$oldest_timestamp = Incident_Model::get_oldest_report_timestamp();
		}

		// Get the date of the latest report
		if (isset($_GET['e']) AND !empty($_GET['e']) AND intval($_GET['e']) > 0)
		{
			$latest_timestamp = intval($_GET['e']);
		}
		else
		{
			$latest_timestamp = Incident_Model::get_latest_report_timestamp();
		}

		// Round the number of days up to the nearest full day
		$days_since = ceil((time() - $oldest_timestamp) / 86400);
		$avg_reports_per_day = ($days_since < 1)? $total_reports : round(($total_reports / $days_since),2);

		// Percent Verified
		$total_verified = Incident_Model::get_total_reports_by_verified(TRUE);
		$percent_verified = ($total_reports == 0) ? '-' : round((($total_verified / $total_reports) * 100),2).'%';

		// Category tree view
		$this->template->content->category_tree_view = category::get_category_tree_view();

		// Additional view content
		$this->template->content->custom_forms_filter = new View('reports/submit_custom_forms');
		$this->template->content->custom_forms_filter->disp_custom_fields = customforms::get_custom_form_fields();
		$this->template->content->custom_forms_filter->search_form = TRUE;
		$this->template->content->oldest_timestamp = $oldest_timestamp;
		$this->template->content->latest_timestamp = $latest_timestamp;
		$this->template->content->report_stats->total_reports = $total_reports;
		$this->template->content->report_stats->avg_reports_per_day = $avg_reports_per_day;
		$this->template->content->report_stats->percent_verified = $percent_verified;
		$this->template->content->services = Service_Model::get_array();
		$this->template->content->total_reports = reports::$pagination->total_items;

		$this->template->header->header_block = $this->themes->header_block();
		$this->template->footer->footer_block = $this->themes->footer_block();
	}

	/**
	 * Helper method to load the report listing view
	 */
	private function _get_report_listing_view($locale = '')
	{
		// Check if the local is empty
		if (empty($locale))
		{
			$locale = Kohana::config('locale.language.0');
		}

		// Load the report listing view
		$report_listing = new View('reports/list');

		// Fetch all incidents
		$incidents = reports::fetch_incidents(TRUE);
		$incidents_html = reports::list_incidents_html($incidents);

		// Pagination
		$pagination = reports::$pagination;

		// For compatibility with older custom themes:
		// Generate array of category titles with their proper localizations using an array
		// DO NOT use this in new code, call Category_Lang_Model::category_title() directly
		foreach(Category_Model::categories() as $category)
		{
			$localized_categories[$category['category_title']] = Category_Lang_Model::category_title($category['category_id']);
		}

		// Set the view content
		$report_listing->incidents = $incidents;
		$report_listing->incidents_html = $incidents_html;
		$report_listing->localized_categories = $localized_categories;

		//Set default as not showing pagination. Will change below if necessary.
		$report_listing->pagination = "";

		// Pagination and Total Num of Report Stats
		$plural = ($pagination->total_items == 1)? "" : "s";

		// Set the next and previous page numbers
		$report_listing->next_page = $pagination->next_page;
		$report_listing->previous_page = $pagination->previous_page;

		if ($pagination->total_items > 0)
		{
			$current_page = ($pagination->sql_offset / $pagination->items_per_page) + 1;
			$total_pages = ceil($pagination->total_items / $pagination->items_per_page);

			if ($total_pages >= 1)
			{
				$report_listing->pagination = $pagination;

				// Show the total of report
				// @todo This is only specific to the frontend reports theme
				$report_listing->stats_breadcrumb = $pagination->current_first_item.'-'
											. $pagination->current_last_item.' of '.$pagination->total_items.' '
											. Kohana::lang('ui_main.reports');
			}
			else
			{ 
				// If we don't want to show pagination
				$report_listing->stats_breadcrumb = $pagination->total_items.' '.Kohana::lang('ui_admin.reports');
			}
		}
		else
		{
			$report_listing->stats_breadcrumb = '('.$pagination->total_items.' report'.$plural.')';
		}

		// Return
		return $report_listing;
	}


	private function _get_futures_listing_view($locale = '', $incidents = FALSE, $pagination)
	{
		// Check if the local is empty
		if (empty($locale))
		{
			$locale = Kohana::config('locale.language.0');
		}

		// Load the report listing view
		$report_listing = new View('reports/list');

		// Fetch all incidents
		//$incidents = reports::fetch_incidents(TRUE);
		$incidents_html = reports::list_incidents_html($incidents);

		// Pagination
		//$pagination = reports::$pagination;
					
		Event::run('ushahidi_filter.pagination',$pagination);		
				
		// For compatibility with older custom themes:
		// Generate array of category titles with their proper localizations using an array
		// DO NOT use this in new code, call Category_Lang_Model::category_title() directly
		foreach(Category_Model::categories() as $category)
		{
			$localized_categories[$category['category_title']] = Category_Lang_Model::category_title($category['category_id']);
		}

		// Set the view content
		$report_listing->incidents = $incidents;
		$report_listing->incidents_html = $incidents_html;
		$report_listing->localized_categories = $localized_categories;

		//Set default as not showing pagination. Will change below if necessary.
		$report_listing->pagination = "";

		// Pagination and Total Num of Report Stats
		$plural = ($pagination->total_items == 1)? "" : "s";

		// Set the next and previous page numbers
		$report_listing->next_page = $pagination->next_page;
		$report_listing->previous_page = $pagination->previous_page;

		if ($pagination->total_items > 0)
		{
			$current_page = ($pagination->sql_offset / $pagination->items_per_page) + 1;
			$total_pages = ceil($pagination->total_items / $pagination->items_per_page);

			if ($total_pages >= 1)
			{
				$report_listing->pagination = $pagination;

				// Show the total of report
				// @todo This is only specific to the frontend reports theme
				$report_listing->stats_breadcrumb = $pagination->current_first_item.'-'
											. $pagination->current_last_item.' of '.$pagination->total_items.' '
											. Kohana::lang('ui_main.reports');
			}
			else
			{ 
				// If we don't want to show pagination
				$report_listing->stats_breadcrumb = $pagination->total_items.' '.Kohana::lang('ui_admin.reports');
			}
		}
		else
		{
			$report_listing->stats_breadcrumb = '('.$pagination->total_items.' report'.$plural.')';
		}

		// Return
		return $report_listing;
	}

	public function fetch_reports()
	{
		$this->template = "";
		$this->auto_render = FALSE;
		
		$report_listing_view = $this->_get_report_listing_view();
		print $report_listing_view;
	}

	/**
	 * Submits a new report.
	 */
	public function submit($id = FALSE, $saved = FALSE)
	{
		$db = new Database();

		// First, are we allowed to submit new reports?
		if ( ! Kohana::config('settings.allow_reports'))
		{
			url::redirect(url::site().'main');
		}

		$this->template->header->this_page = 'reports_submit';
		$this->template->content = new View('reports/submit');

		$this->template->header->page_title .= Kohana::lang('ui_main.reports_submit_new')
											   .Kohana::config('settings.title_delimiter');

		//Retrieve API URL
		$this->template->api_url = Kohana::config('settings.api_url');

		// Setup and initialize form field names
		$form = array(
			'incident_title' => '',
			'incident_description' => '',
			'incident_date' => '',
			'incident_hour' => '',
			'incident_minute' => '',
			'incident_ampm' => '',
			'latitude' => '',
			'longitude' => '',
			'geometry' => array(),
			'location_name' => '',
			'country_id' => '',
			'country_name'=>'',
			'incident_category' => array(),
			'incident_news' => array(),
			'incident_video' => array(),
			'incident_photo' => array(),
			'incident_zoom' => '',
			'person_first' => '',
			'person_last' => '',
			'person_email' => '',
			'form_id'	  => '',
			'custom_field' => array()
		);

		// Copy the form as errors, so the errors will be stored with keys corresponding to the form field names
		$errors = $form;
		$form_error = FALSE;
		$form_saved = ($saved == 'saved');

		// Initialize Default Values
		$form['incident_date'] = date("m/d/Y",time());
		$form['incident_hour'] = date('g');
		$form['incident_minute'] = date('i');
		$form['incident_ampm'] = date('a');
		$form['country_id'] = Kohana::config('settings.default_country');

		// Initialize Default Value for Hidden Field Country Name, just incase Reverse Geo coding yields no result
		$country_name = ORM::factory('country',$form['country_id']);
		$form['country_name'] = $country_name->country;

		// Initialize custom field array
		$form['form_id'] = 1;
		$form_id = $form['form_id'];
		$form['custom_field'] = customforms::get_custom_form_fields($id,$form_id,true);

		// GET custom forms
		$forms = array();
		foreach (customforms::get_custom_forms() as $custom_forms)
		{
			$forms[$custom_forms->id] = $custom_forms->form_title;
		}
		$this->template->content->forms = $forms;


		// Check, has the form been submitted, if so, setup validation
		if ($_POST)
		{
			// Instantiate Validation, use $post, so we don't overwrite $_POST fields with our own things
			$post = array_merge($_POST, $_FILES);

			$closest_city = $this->_get_closest_city($_POST['latitude'], $_POST['longitude']);
			$post['city_id'] = $closest_city->id;
			
			// Adding event for endtime plugin to hook into
			Event::run('ushahidi_action.report_posted_frontend', $post);

			// Test to see if things passed the rule checks
			if (reports::validate($post))
			{

				// STEP 1: SAVE LOCATION
				$location = new Location_Model();
				reports::save_location($post, $location);

				// STEP 2: SAVE INCIDENT
				$incident = new Incident_Model();
				reports::save_report($post, $incident, $location->id);

				// STEP 2b: SAVE INCIDENT GEOMETRIES
				reports::save_report_geometry($post, $incident);

				// STEP 3: SAVE CATEGORIES
				reports::save_category($post, $incident);

				// STEP 4: SAVE MEDIA
				reports::save_media($post, $incident);

				// STEP 5: SAVE CUSTOM FORM FIELDS
				reports::save_custom_fields($post, $incident);

				// STEP 6: SAVE PERSONAL INFORMATION
				reports::save_personal_info($post, $incident);

				// Run events
				Event::run('ushahidi_action.report_submit', $post);
				Event::run('ushahidi_action.report_add', $incident);

				if (!request::is_ajax())
					url::redirect('reports/thanks');
			}

			// No! We have validation errors, we need to show the form again, with the errors
			else
			{
				// Repopulate the form fields
				$form = arr::overwrite($form, $post->as_array());

				// Populate the error fields, if any
				$errors = arr::merge($errors, $post->errors('report'));
				$form_error = TRUE;
			}
		}

		// Return JSON if AJAX
		if (request::is_ajax()) {
			$this->auto_render = FALSE;
			header('content-type: application/json');
			$json = Array();
			if ($form_error) {
				$errors = array_slice(array_filter(array_values($errors)), 0);
				$json['errors'] = $errors;
			} else {
				$json['success'] = 'ok';
				$json['id'] = $incident->id;
				// Figure out lat/long too and return that for zooming
				$json['city'] = $closest_city->city;
				$json['name'] = $post['incident_title'];
				$json['postCount'] = ORM::factory('incident')
							->where('user_id',$this->user->id)
							->where('incident_active',1)
							->count_all();
			}
			echo json_encode($json);
			die();
		}

		// Retrieve Country Cities
		$default_country = Kohana::config('settings.default_country');
		$this->template->content->cities = $this->_get_cities($default_country);
		$this->template->content->multi_country = Kohana::config('settings.multi_country');

		$this->template->content->id = $id;
		$this->template->content->form = $form;
		$this->template->content->errors = $errors;
		$this->template->content->form_error = $form_error;
		$this->template->content->logged_in = $this->logged_in;
		$this->template->content->disabled = ($this->logged_in) ? '' : ' disabled="disabled"';
		
		 // Populate this for backwards compat
		$this->template->content->categories = array();

		// Pass timezone
		$this->template->content->site_timezone = Kohana::config('settings.site_timezone');

		// Pass the submit report message
		$this->template->content->site_submit_report_message = Kohana::config('settings.site_submit_report_message');

		// Retrieve Custom Form Fields Structure
		$this->template->content->custom_forms = new View('reports/submit_custom_forms');
		$disp_custom_fields = customforms::get_custom_form_fields($id, $form_id, FALSE);
		$this->template->content->disp_custom_fields = $disp_custom_fields;
		$this->template->content->stroke_width_array = $this->_stroke_width_array();
		$this->template->content->custom_forms->disp_custom_fields = $disp_custom_fields;
		$this->template->content->custom_forms->form = $form;

		// Javascript Header
		$this->themes->map_enabled = TRUE;
		$this->themes->treeview_enabled = TRUE;
		$this->themes->colorpicker_enabled = TRUE;

		$this->themes->js = new View('reports/submit_edit_js');
		$this->themes->js->edit_mode = FALSE;
		$this->themes->js->incident_zoom = FALSE;
		$this->themes->js->default_map = Kohana::config('settings.default_map');
		$this->themes->js->default_zoom = Kohana::config('settings.default_zoom');
		if ( ! $form['latitude'] OR ! $form['latitude'])
		{
			$this->themes->js->latitude = Kohana::config('settings.default_lat');
			$this->themes->js->longitude = Kohana::config('settings.default_lon');
		}
		else
		{
			$this->themes->js->latitude = $form['latitude'];
			$this->themes->js->longitude = $form['longitude'];
		}
		$this->themes->js->geometries = $form['geometry'];


		// Rebuild Header Block
		$this->template->header->header_block = $this->themes->header_block();
		$this->template->footer->footer_block = $this->themes->footer_block();
	}


	/**
	 * Output HTML for leaderboard bar
	 */
	public function city_leaderboard($count = 10, $asVar = false) {
		$cities = Database::instance()->query("SELECT c.id, city, COUNT(DISTINCT i.id) AS points FROM incident i RIGHT JOIN city c ON (c.id = i.city_id) GROUP BY i.city_id ORDER BY points DESC");

		//$cities = ORM::Factory('city')->orderby('points DESC, city', 'ASC');
		//$cities = (is_numeric($count)) ? $cities->find_all($count) : $cities->find_all();
		$i = 0;

		if ($asVar) ob_start();

		foreach ($cities as $city) {
			$i++;

			// Skip cities with 0 points
			if ($city->points == 0) continue;

			?>
      <a class="city" href="<?php echo url::site();?>#city=<?php echo urlencode($city->city); ?>" title="#<?php echo $i; ?>"><span class="place">#<?php echo $i; ?> </span><span class="city-name"><?php echo $city->city; ?>:</span> <span class="points"><?php echo $city->points; ?></span></a>
    	<?php
    	}

    	if ($asVar) {
			return ob_get_clean();
		} else {
			$this->auto_render = FALSE;
			return;
		}
	}

	 /**
	 * Displays a report.
	 * @param boolean $id If id is supplied, a report with that id will be
	 * retrieved.
	 */
	public function view($id = FALSE)
	{
		$this->template->header->this_page = 'reports';
		$this->template->content = new View('reports/detail');

		// Load Akismet API Key (Spam Blocker)
		$api_akismet = Kohana::config('settings.api_akismet');

		// Sanitize the report id before proceeding
		$id = intval($id);

		if ($id > 0 AND Incident_Model::is_valid_incident($id,TRUE))
		{
			$incident = ORM::factory('incident')
				->where('id',$id)
				->where('incident_active',1)
				->find();
				
			// Not Found
			if ( ! $incident->loaded) 
			{
				url::redirect('reports/view/');
			}

			// Incident rating
			$rating = $this->_get_rating($incident->id, 'original');

			// Phase permissions
			list($proposal_allowed, $active_allowed) = $this->comment_phase_perms($incident->incident_dateadd, $rating);

			// Comment Post?
			// Setup and initialize form field names

			$form = array(
				'comment_author' => '',
				'comment_description' => '',
				'comment_email' => '',
				'comment_phase' => '0',
				'comment_ip' => '',
			);

			$errors = $form;
			$form_error = FALSE;

			// Check, has the form been submitted, if so, setup validation

			// if (isset($_POST))
			if ($_POST AND Kohana::config('settings.allow_comments') )
			{
				// Instantiate Validation, use $post, so we don't overwrite $_POST fields with our own things
				$post = Validation::factory($_POST);

				// Add some filters
				$post->pre_filter('trim', TRUE);

				// Add some rules, the input field, followed by a list of checks, carried out in order
				if ( ! $this->user)
				{
					$post->add_rules('comment_author', 'required', 'length[3,100]');
					$post->add_rules('comment_email', 'required','email', 'length[4,100]');
				}
				$post->add_rules('comment_description', 'required');

                // Check if the selected phase is valid (Proposal comments are open, etc)
                $comment_phase = isset($post->comment_phase) ? intval($post->comment_phase) : 0;

                if ($comment_phase > 3 ) $comment_phase = 0;

                $post->comment_phase = $comment_phase;
                $post->proposal_allowed = $proposal_allowed;
                $post->active_allowed = $active_allowed;
                $post->max_comment_type = false;
                if ($active_allowed) {
					$comments = ORM::factory('comment')
						->where('incident_id',$id)
						->where('user_id',$this->user->id)
						->where('comment_active',1)
						->where('comment_phase',$comment_phase)
						->find_all();
					if (count($comments) > 0)
	                	$post->max_comment_type = true;
                }
                $post->add_callbacks('comment_phase', array($this, 'phase_check'));

				// Test to see if things passed the rule checks
				if ($post->validate())
				{
					// Yes! everything is valid
					if ($api_akismet != "")
					{
						// Run Akismet Spam Checker
						$akismet = new Akismet();

						// Comment data
						$comment = array(
							'website' => "",
							'body' => $post->comment_description,
							'user_ip' => $_SERVER['REMOTE_ADDR']
						);

						if ($this->user)
						{
							$comment['author'] = $this->user->name;
							$comment['email'] = $this->user->email;
						}
						else
						{
							$comment['author'] = $post->comment_author;
							$comment['email'] = $post->comment_email;
						}

						$config = array(
							'blog_url' => url::site(),
							'api_key' => $api_akismet,
							'comment' => $comment
						);

						$akismet->init($config);

						if ($akismet->errors_exist())
						{
							if ($akismet->is_error('AKISMET_INVALID_KEY'))
							{
								// throw new Kohana_Exception('akismet.api_key');
							}
							elseif ($akismet->is_error('AKISMET_RESPONSE_FAILED'))
							{
								// throw new Kohana_Exception('akismet.server_failed');
							}
							elseif ($akismet->is_error('AKISMET_SERVER_NOT_FOUND'))
							{
								// throw new Kohana_Exception('akismet.server_not_found');
							}

							$comment_spam = 0;
						}
						else
						{
							$comment_spam = ($akismet->is_spam()) ? 1 : 0;
						}
					}
					else
					{
						// No API Key!!
						$comment_spam = 0;
					}

					$comment = new Comment_Model();
					$comment->incident_id = $id;
					if ($this->user)
					{
						$comment->user_id = $this->user->id;
						$comment->comment_author = $this->user->name;
						$comment->comment_email = $this->user->email;
					}
					else
					{
						$comment->comment_author = strip_tags($post->comment_author);
						$comment->comment_email = strip_tags($post->comment_email);
					}
					$comment->comment_description = strip_tags($post->comment_description);
					$comment->comment_ip = $_SERVER['REMOTE_ADDR'];
					$comment->comment_phase = $post->comment_phase;
					$comment->comment_date = date("Y-m-d H:i:s",time());

					// Activate comment for now
					if ($comment_spam == 1)
					{
						$comment->comment_spam = 1;
						$comment->comment_active = 0;
					}
					else
					{
						$comment->comment_spam = 0;
						$comment->comment_active = (Kohana::config('settings.allow_comments') == 1)? 1 : 0;
					}
					$comment->save();
          
          // Manage points for appropriate comment phase
          switch($post->comment_phase) {
            case 0:
              $this->update_city_score($id, Kohana::config('settings.proposal_comment_value'));
              break;
            case 1:
              $this->update_city_score($id, Kohana::config('settings.active_future_comment_value'));
            default:
              break;
          }
          
					// Call for Future Upgrade if we're in Active phase
					$cat_upgrade = ($post->comment_phase > 0) ? $this->upgrade_future($id, false) : false;

					// Event::comment_add - Added a New Comment
					Event::run('ushahidi_action.comment_add', $comment);

					// Notify Admin Of New Comment
					$send = notifications::notify_admins(
						"[".Kohana::config('settings.site_name')."] ".
							Kohana::lang('notifications.admin_new_comment.subject'),
							Kohana::lang('notifications.admin_new_comment.message')
							."\n\n'".utf8::strtoupper($incident->incident_title)."'"
							."\n".url::base().'reports/view/'.$id
						);

					// Redirect
					if ( !request::is_ajax() )
						url::redirect('reports/view/'.$id);

				}
				else
				{
					// No! We have validation errors, we need to show the form again, with the errors
					// Repopulate the form fields
					$form = arr::overwrite($form, $post->as_array());

					// Populate the error fields, if any
					$errors = arr::overwrite($errors, $post->errors('comments'));
					$form_error = TRUE;
				}

			} // end if _POST

			if (request::is_ajax()) {
				$this->auto_render = FALSE;
				header('content-type: application/json');
				$json = Array();
				if ($form_error) {
					$errors = array_slice(array_filter(array_values($errors)), 0);
					$json['errors'] = $errors;
					$json['comment'] = Array(
							'phase'       => $post->comment_phase
						);
				} else {
					$json['success'] = 'ok';
					$json['category'] = $cat_upgrade;
					if ( isset($comment) ) {
						$json['comment'] = Array(
							'author'      => $comment->comment_author,
							'email'       => $comment->comment_email,
							'description' => $comment->comment_description,
							'phase'       => $comment->comment_phase,
							'date'        => $comment->comment_date,
							'br_date'     => date('M j Y') . '<br />' . date('g:i A'),
						);
					}
				}
				echo json_encode($json);
				die();
			}

			// Future posted by...
			$user = User_Model::get_user_by_id($incident->user_id);

			// Filters
			$incident_title = $incident->incident_title;
			$incident_description = $incident->incident_description;
			Event::run('ushahidi_filter.report_title', $incident_title);
			Event::run('ushahidi_filter.report_description', $incident_description);

			$this->template->header->page_title .= $incident_title.Kohana::config('settings.title_delimiter');

			// SUCKS
			$is_own_future = false;
			$logged_in = $this->logged_in;
			$my_rating = Array();
			//  what
			if ($logged_in) {
				$current_user = Auth::instance()->get_user();

				$my_rating = ORM::factory('rating')
								->where('incident_id',$incident->id)
								->where('user_id',$current_user->id)
								->find_all();
	
				$is_own_future = ($current_user->id == $user->id);
			}

			$this->template->content->logged_in = $logged_in;
			$this->template->content->is_own_future = $is_own_future;
			$this->template->content->already_voted = (count($my_rating) >= 1);

			$required_rating = Kohana::config('settings.active_threshold');
			$rating_percent = floor($rating / $required_rating * 100);
			$rating_percent = ($rating_percent > 100) ? 100 : $rating_percent;
			$this->template->content->required_rating = $required_rating;
			$this->template->content->rating_percent = $rating_percent;
			$this->template->content->rating_text = $rating;
			if ($incident->incident_phase > 0) { // Not proposal
				$this->template->content->rating_title = $rating . ' / ' . $required_rating;
			} else {
				$this->template->content->rating_text .= ' / ' . $required_rating;

				$rating_title = preg_replace(
					Array(
						"/\{rating\}/",
						"/\{required_rating\}/",
						"/\{supporters\}/",
						"/\{active\}/",
						"/\{report\}/",
					),
					Array(
						$rating,
						$required_rating,
						Kohana::lang('makercities.supporters'),
						Kohana::lang('makercities.phases.active'),
						Kohana::lang('ui_main.report'),
					), Kohana::lang('makercities.rating_title'));

				$this->template->content->rating_title = $rating_title;
			}

			// Days left for Proposal
			$days_left = $supporters_needed = '';
			if ($incident->incident_phase == 0) { // is Proposal phase
				$start = strtotime($incident->incident_dateadd);
				$end = mktime() - (Kohana::config('settings.proposal_length') * 86400);
				$days_left = ceil(abs($end - $start) / 86400);
				$days_left = floor(abs($end - $start) / 86400);

				$days = ($days_left == 1) ? Kohana::lang('makercities.day') : Kohana::lang('makercities.days_plural');

				$supporter_count_left = $required_rating - $rating;
				$supporters = ($supporter_count_left == 1) ? Kohana::lang('makercities.supporter') : Kohana::lang('makercities.supporters');
				$supporters_needed = ($days_left == 0) ? Kohana::lang('makercities.supporters_needed_tomorrow') : Kohana::lang('makercities.supporters_needed');
				$supporters_needed = preg_replace(
					Array(
						"/\{supporter_count\}/",
						"/\{days_left\}/",
						"/\{supporters\}/",
						"/\{days\}/"),
					Array(
						$supporter_count_left,
						$days_left,
						$supporters,
						$days
					), $supporters_needed);
			}
			$this->template->content->days_left = $days_left;
			$this->template->content->supporters_needed = $supporters_needed;

			$share_link = preg_replace("/^.*(reports\/view\/\d+).*$/", url::site() . '#$1', url::current());

			$twitter_share_tweet = Kohana::lang('makercities.social.twitter.tweet');
			$twitter_share_url = 'https://twitter.com/intent/tweet?text=';
			$twitter_share_tweet = preg_replace("/\{url\}/", $share_link, $twitter_share_tweet);

			$twitter_share_link = $twitter_share_url . urlencode($twitter_share_tweet);
			$this->template->content->twitter_share_link = $twitter_share_link;

			$facebook_share_url = 'http://www.facebook.com/sharer.php?u=';
			$facebook_share_link = $facebook_share_url . urlencode($share_link);
			$this->template->content->facebook_share_link = $facebook_share_link;


			// Add Features
			//$this->template->content->incident = $incident;
			$this->template->content->user = $user;
			$this->template->content->username = $user->name;
			$this->template->content->user_avatar = members::gravatar($user->email);

			$this->template->content->features_count = $incident->geometry->count();
			$this->template->content->features = $incident->geometry;
			$this->template->content->incident_id = $incident->id;
			$this->template->content->incident_title = $incident_title;
			$this->template->content->incident_description = $incident_description;
			$this->template->content->incident_location = $incident->location->location_name;
			$this->template->content->incident_latitude = $incident->location->latitude;
			$this->template->content->incident_longitude = $incident->location->longitude;
			$this->template->content->incident_added_ts = $incident->incident_dateadd;
			$this->template->content->incident_dateadd = date('M j Y', strtotime($incident->incident_dateadd));
			$this->template->content->incident_timeadd = date('g:i A', strtotime($incident->incident_dateadd));
			$this->template->content->incident_added_on = $this->template->content->incident_dateadd . ' ' . $this->template->content->incident_timeadd;
			$this->template->content->incident_date = date('M j Y', strtotime($incident->incident_date));
			$this->template->content->incident_time = date('H:i', strtotime($incident->incident_date));
			$this->template->content->incident_category = $incident->incident_category;
			$this->template->content->phase_num = $incident->incident_phase;

			// Retrieve Media
			$incident_news = array();
			$incident_video = array();
			$incident_photo = array();

			foreach ($incident->media as $media)
			{
				if ($media->media_type == 4)
				{
					$incident_news[] = $media->media_link;
				}
				elseif ($media->media_type == 2)
				{
					$incident_video[] = $media->media_link;
				}
				elseif ($media->media_type == 1)
				{
					$incident_photo[] = array(
						'large' => url::convert_uploaded_to_abs($media->media_link),
						'thumb' => url::convert_uploaded_to_abs($media->media_thumb)
						);
				}
			}

			$this->template->content->city_name = reports::get_city_name($incident->city_id);

			$this->template->content->incident_rating = $rating;
			$this->template->content->proposal_allowed = $proposal_allowed;
			$this->template->content->active_allowed = $active_allowed;
			$this->template->content->incident_verified = $incident->incident_verified;

			// Retrieve Comments (Additional Information)
			$comment_count = Array(0,0,0,0);
			$this->template->content->comments = "";
			if (Kohana::config('settings.allow_comments'))
			{
				$this->template->content->comments = new View('reports/comments');
				$incident_comments = array();
				if ($id)
				{
					$incident_comments = Incident_Model::get_comments($id);
				}
				$this->template->content->comments->incident_comments = $incident_comments;
				$this->template->content->comments->proposal_allowed = $proposal_allowed;
				$this->template->content->comments->active_allowed = $active_allowed;
				$this->template->content->comments->forms = Array();

				// Are we allowed to submit comments?
				$this->template->content->comments->forms = Array('', '', '', '');

				$form_field_names = customforms::get_custom_form_fields($id, $incident->form_id, FALSE, "view");

				for ($i = 0; $i <= 3; $i++) {
					$form['comment_phase'] = $i;

					$this->template->content->comments->forms[$i] = new View('reports/comments_form');
					$this->template->content->comments->forms[$i]->user = $this->user;
					$this->template->content->comments->forms[$i]->form = $form;
					$this->template->content->comments->forms[$i]->form_field_names = $form_field_names;
					$this->template->content->comments->forms[$i]->errors = $errors;
					$this->template->content->comments->forms[$i]->form_error = $form_error;
					$this->template->content->comments->forms[$i]->proposal_allowed = $proposal_allowed;
					$this->template->content->comments->forms[$i]->active_allowed = $active_allowed;
				}

				foreach ($incident_comments as $com) {
					$comment_count[$com->comment_phase]++;
				}

				$this->template->content->comment_count = $comment_count;
				$this->template->content->comments->comment_count = $comment_count;
			}

			// Certification tab
			$certified_count = $comment_count[1] + $comment_count[2] + $comment_count[3];
			$certified_threshold = Kohana::config('settings.certified_threshold');
			$certified_percent = floor($certified_count / $certified_threshold * 100);
			$certified_percent = ($certified_percent > 100) ? 100 : $certified_percent;

			$this->template->content->certified_count = $certified_count;
			$this->template->content->certified_threshold = $certified_threshold;
			$this->template->content->certified_percent = $certified_percent;
			$this->template->content->certification_text = $certified_count;
			if ($incident->incident_phase > 1) { // Not Proposal or Active
				$this->template->content->certification_title = $certified_count . ' / ' . $certified_threshold;
			} else {
				$this->template->content->certification_text .= ' / ' . $certified_threshold;

				$cert_title = preg_replace(
					Array(
						"/\{certified_count\}/",
						"/\{certified_threshold\}/",
						"/\{active\}/",
						"/\{certified\}/",
						"/\{comments\}/",
						"/\{report\}/",
					),
					Array(
						$certified_count,
						$certified_threshold,
						Kohana::lang('makercities.phases.active'),
						Kohana::lang('makercities.phases.certified'),
						Kohana::lang('ui_main.comments'),
						Kohana::lang('ui_main.report'),
					), Kohana::lang('makercities.certification_title'));

				$this->template->content->certification_title = $cert_title;
			}

			if ($is_own_future) { // Update stats
				$stats = Array(
						'phase' => $incident->incident_phase,
						'rating' => $rating,
						'comments' => count($incident_comments),
					);
				Incident_Model::set_stats($incident->id, $stats);
			}
		}
		else
		{
			url::redirect('main');
		}

		// Add Neighbors
		$this->template->content->incident_neighbors = Incident_Model::get_neighbouring_incidents($id, TRUE, 0, 5);

		// News Source links
		$this->template->content->incident_news = $incident_news;


		// Video links
		$this->template->content->incident_videos = $incident_video;

		// Images
		$this->template->content->incident_photos = $incident_photo;

		// Create object of the video embed class
		$video_embed = new VideoEmbed();
		$this->template->content->videos_embed = $video_embed;

		// Javascript Header
		$this->themes->map_enabled = TRUE;
		$this->themes->photoslider_enabled = TRUE;
		$this->themes->videoslider_enabled = TRUE;
		$this->themes->js = new View('reports/view_js');
		$this->themes->js->incident_id = $incident->id;
		$this->themes->js->default_map = Kohana::config('settings.default_map');
		$this->themes->js->default_zoom = Kohana::config('settings.default_zoom');
		$this->themes->js->latitude = $incident->location->latitude;
		$this->themes->js->longitude = $incident->location->longitude;
		$this->themes->js->incident_zoom = $incident->incident_zoom;
		$this->themes->js->incident_photos = $incident_photo;

		// Initialize custom field array
		$this->template->content->custom_forms = new View('reports/detail_custom_forms');
		$form_field_names = customforms::get_custom_form_fields($id, $incident->form_id, FALSE, "view");
		$this->template->content->custom_forms->form_field_names = $form_field_names;

		// Are we allowed to submit comments?
		$this->template->content->comments_form = "";
		/*if ($this->template->content->comments != '') {
			$this->template->content->comments->forms = Array();

			if (Kohana::config('settings.allow_comments')) {
				if ($active_allowed) $form['comment_phase'] = 1; // Default to Active comment if open

				for ($i = 0; $i <= 3; $i++) {
					$this->template->content->comments->forms[$i] = new View('reports/comments_form');
					$this->template->content->comments->forms[$i]->user = $this->user;
					$this->template->content->comments->forms[$i]->form = $form;
					$this->template->content->comments->forms[$i]->form_field_names = $form_field_names;
					$this->template->content->comments->forms[$i]->errors = $errors;
					$this->template->content->comments->forms[$i]->form_error = $form_error;
					$this->template->content->comments->forms[$i]->proposal_allowed = $proposal_allowed;
					$this->template->content->comments->forms[$i]->active_allowed = $active_allowed;
				}
			} else {
				$this->template->content->comments_form[0] = '';
			}
		}*/

		// If the Admin is Logged in - Allow for an edit link
		$this->template->content->logged_in = $this->logged_in;

		// Rebuild Header Block
		$this->template->header->header_block = $this->themes->header_block();
		$this->template->footer->footer_block = $this->themes->footer_block();
	}


	/**
	 * Check if selected comment phase is valid
	 */
	public function phase_check(Validation $post)
	{
        /* if (!$post->proposal_allowed && !$post->active_allowed) {
	        $post->add_error( 'comment_phase', 'comments_closed');
        } elseif ($post->comment_phase == 0 && !$post->proposal_allowed) {
	        $post->add_error( 'comment_phase', 'proposal_closed');*/
        if ($post->comment_phase > 0 && !$post->active_allowed) {
	        $post->add_error( 'comment_phase', 'active_closed');
        } elseif ($post->comment_phase > 0 && $post->max_comment_type) {
	    	$post->add_error( 'comment_phase', 'comment_limit');
        }
	}

	/**
	 * Report Thanks Page
	 */
	public function thanks()
	{
		$this->template->header->this_page = 'reports_submit';
		$this->template->content = new View('reports/submit_thanks');

		// Rebuild Header Block
		$this->template->header->header_block = $this->themes->header_block();
		$this->template->footer->footer_block = $this->themes->footer_block();
	}

	/**
	 * Report Rating.
	 * @param boolean $id If id is supplied, a rating will be applied to selected report
	 */
	public function rating($id = false)
	{
		$this->template = "";
		$this->auto_render = FALSE;

		if (!$id)
		{
			echo json_encode(array("status"=>"error", "message"=>"ERROR!"));
		}
		else
		{
			if (!empty($_POST['action']) AND !empty($_POST['type']))
			{
				$action = $_POST['action'];
				$type = $_POST['type'];

				// Is this an ADD(+1) or SUBTRACT(-1)?
				if ($action == 'add')
				{
					$action = 1;
				}
				// Disable negative ratings for MakerCities
				/*elseif ($action == 'subtract')
				{
					$action = -1;
				}*/
				else
				{
					$action = 0;
				}

				if (!empty($action) AND ($type == 'original' OR $type == 'comment'))
				{
					// Has this User or IP Address rated this post before?
					if ($this->user)
					{
						$filter = "user_id = ".$this->user->id;
					}
					else
					{
						$filter = "rating_ip = '".$_SERVER['REMOTE_ADDR']."' ";
					}

					if ($type == 'original')
					{
						$previous = ORM::factory('rating')
							->where('incident_id',$id)
							->where($filter)
							->find();
					}
					elseif ($type == 'comment')
					{
						$previous = ORM::factory('rating')
							->where('comment_id',$id)
							->where($filter)
							->find();
					}

					// If previous exits... update previous vote
					$rating = new Rating_Model($previous->id);

					// Are we rating the original post or the comments?
					if ($type == 'original')
					{
						$rating->incident_id = $id;
					}
					elseif ($type == 'comment')
					{
						$rating->comment_id = $id;
					}

					// Is there a user?
					if ($this->user)
					{
						$rating->user_id = $this->user->id;

						// User can't rate their own stuff
						if ($type == 'original')
						{
							if ($rating->incident->user_id == $this->user->id)
							{
								echo json_encode(array("status"=>"error", "message"=>"Can't rate your own Reports!"));
								exit;
							}
						}
						elseif ($type == 'comment')
						{
							if ($rating->comment->user_id == $this->user->id)
							{
								echo json_encode(array("status"=>"error", "message"=>"Can't rate your own Comments!"));
								exit;
							}
						}
					}

					$rating->rating = $action;
					$rating->rating_ip = $_SERVER['REMOTE_ADDR'];
					$rating->rating_date = date("Y-m-d H:i:s",time());
					$rating->save();

					// Get total rating and send back to json
					$total_rating = $this->_get_rating($id, $type);
          
          $city_points = $this->update_city_score($rating->incident_id, Kohana::config('settings.supporter_value'));
          
					$cat_upgrade = $this->upgrade_future($id, $total_rating);

					$json = array(
						"status"=>"saved",
						"message"=>"SAVED!",
						"rating"=>$total_rating,
						"category"=>$cat_upgrade
					);

					echo json_encode($json);
				}
				else
				{
					echo json_encode(array("status"=>"error", "message"=>"Nothing To Do!"));
				}
			}
			else
			{
				echo json_encode(array("status"=>"error", "message"=>"Nothing To Do!"));
			}
		}
	}

	public function geocode()
	{
		$this->template = "";
		$this->auto_render = FALSE;

		if (isset($_POST['address']) AND ! empty($_POST['address']))
		{
			$geocode_result = map::geocode($_POST['address']);
			if ($geocode_result)
			{
				echo json_encode(array_merge(
					$geocode_result, 
					array('status' => 'success')
				));
			}
			else
			{
				echo json_encode(array(
					'status' => 'error',
					'message' =>'ERROR!'
				));
			}
		}
		else
		{
			echo json_encode(array(
				'status' => 'error',
				'message' => 'ERROR!'
			));
		}
	}

	/**
	 * Retrieves Cities
	 * @param int $country_id Id of the country whose cities are to be fetched
	 * @return array
	 */
	private function _get_cities($country_id)
	{
		// Get the cities
		$cities = (Kohana::config('settings.multi_country'))
		    ? City_Model::get_all()
		    : ORM::factory('country', $country_id)->get_cities();

		$city_select = array('' => Kohana::lang('ui_main.reports_select_city'));

		foreach ($cities as $city)
		{
			$city_select[$city->city_lon.",".$city->city_lat] = $city->city;
		}

		return $city_select;
	}

	/**
	 * Retrieves closest city to point
	 * @param lat and lon of point
	 * @return array
	 */
	private function _get_closest_city($lat, $lon)
	{
		// Get the cities
		$cities = (Kohana::config('settings.multi_country'))
		    ? City_Model::get_all()
		    : ORM::factory('country', $country_id)->get_cities();

		$default_city = ORM::factory('city')->where('city', 'Maker World')->find_all();
		$default_city = $default_city[0];

    $distance = null;
    $closest_city = null;
    $closest_distance = 1000000;

		foreach ($cities as $city)
		{
      $distance = sqrt( pow($city->city_lat-$lat, 2) + pow($city->city_lon-$lon, 2) );
      if($distance < $closest_distance){
        $closest_city = $city;
        $closest_distance = $distance;
      }
		}
    
    // TODO Closest distance stuff maps cities, get with it
    if($closest_distance > 0.5){
      return $default_city;
    }
      
		return $closest_city;
	}

	/**
	 * Retrieves Total Rating For Specific Post
	 * Also Updates The Incident & Comment Tables (Ratings Column)
	 */
	public function _get_rating($id = FALSE, $type = NULL)
	{
		if (!empty($id) AND ($type == 'original' OR $type == 'comment'))
		{
			if ($type == 'original')
			{
				$which_count = 'incident_id';
			}
			elseif ($type == 'comment')
			{
				$which_count = 'comment_id';
			}
			else
			{
				return 0;
			}

			$total_rating = 0;

			// Get All Ratings and Sum them up
			foreach (ORM::factory('rating')
							->where($which_count,$id)
							->find_all() as $rating)
			{
				$total_rating += $rating->rating;
			}
			
			return $total_rating;
		}
		else
		{
			return 0;
		}
	}

	/**
	 * Validates a numeric array. All items contained in the array must be numbers or numeric strings
	 *
	 * @param array $nuemric_array Array to be verified
	 */
	private function _is_numeric_array($numeric_array=array())
	{
		if (count($numeric_array) == 0)
			return FALSE;
		else
		{
			foreach ($numeric_array as $item)
			{
				if (! is_numeric($item))
					return FALSE;
			}

			return TRUE;
		}
	}

	/**
	 * Array with Geometry Stroke Widths
    */
	private function _stroke_width_array()
	{
		for ($i = 0.5; $i <= 8 ; $i += 0.5)
		{
			$stroke_width_array["$i"] = $i;
		}

		return $stroke_width_array;
	}

	/**
	 * Ajax call to update Incident Reporting Form
	 */
	public function switch_form()
	{
		$this->template = "";
		$this->auto_render = FALSE;
		isset($_POST['form_id']) ? $form_id = $_POST['form_id'] : $form_id = "1";
		isset($_POST['incident_id']) ? $incident_id = $_POST['incident_id'] : $incident_id = "";
		
		$form_fields = customforms::switcheroo($incident_id,$form_id);
		echo json_encode(array("status"=>"success", "response"=>$form_fields));
	}

	/**
	 * Return permissions for comment phases based on post date and rating
	 */
	public function comment_phase_perms($incident_date = 'now', $rating = 0, $incident_id = false) {
		$proposal_allowed = ($incident_date) ? ( strtotime('-' . Kohana::config('settings.proposal_length') . ' days') < strtotime($incident_date) ) : false; // Posted within 5 days
		$active_allowed = ( $rating >= Kohana::config('settings.active_threshold') ); // Has x+ supporters
		$certified_allowed = false;
		if ($incident_id) {
			$comments = ORM::factory('comment')
				->where('incident_id',$incident_id)
				->where('comment_active',1)
				->where(array('comment_phase >' => 0))
				->find_all();

			$certified_allowed = ( count($comments) >= Kohana::config('settings.certified_threshold') ); // Has x+ support comments
		}

		return Array($proposal_allowed, $active_allowed, $certified_allowed);
	}

	/**
	 * Upgrades Future if support meets the threshold
	 */
	public function upgrade_future($id = false, $rating = false) {
		if (!$id) return false;

		$permissions = $this->comment_phase_perms(null, $rating, $id);

		$incident = ORM::factory('incident')
			->where('incident.id',$id)
			->where('incident_active',1)
			->find();

		if (!$incident) return false;

		$cur_phase = $incident->incident_phase;
		$next_phase = ($cur_phase < 2) ? $cur_phase + 1 : $cur_phase;

		// Return false if there's no permission to upgrade or if it's already Certified
		if (!$permissions[$next_phase] || $cur_phase == $next_phase) return false;

		// Upgrade category!
		$category_id = 0;
		$categories = ORM::Factory('category')
			->join('incident_category', 'category_id', 'category.id')
			->where('incident_id', $id)
			->find_all();

		foreach ($categories as $category) {
			if ($cur_phase == $category->category_position) {
				// Found old category, let's upgrade it
				$old_category = $category->id;
				$category_id = $category->id;
				$parent = $category->parent_id;

				$next_cat = ORM::Factory('category')
					->where('parent_id', $parent)
					->where('category_position', $next_phase)
					->find();

				if (!$next_cat) break; // welp,

				$incident_cat = ORM::Factory('incident_category')
					->where('incident_id', $id)
					->find();

				$incident_cat->category_id = $next_cat->id;
				$category_id = $next_cat->id;
				$incident_cat->save();

				$incident->incident_phase = $next_phase;
				$incident->save();

				break;
			}
		}

		return $category_id;
	}
  
	/**
	 * Gives the Future's city score
	 */
	public function update_city_score($id = false, $points = false) {
		if (!$id || !$points) return false;

		$incident = ORM::factory('incident')
			->where('incident.id',$id)
			->where('incident_active',1)
			->find();
    
    $city = ORM::factory('city')
			->where('city.id',$incident->city_id)
			->find();
    
    $city->points += $points;
    
    $city->save();
  }
	
	public function topFutures()
	{
		// Cacheable Controller
		//$this->is_cachable = TRUE;

		$this->template->header->this_page = 'reports';
		$this->template->content = new View('reports/main');
		$this->themes->js = new View('reports/reports_js');

		$this->template->header->page_title .= Kohana::lang('ui_main.reports').Kohana::config('settings.title_delimiter');
		$this->template->content->page_title = 'Top Futures';

		// Store any exisitng URL parameters
		$this->themes->js->url_params = json_encode($_GET);

		// Enable the map
		$this->themes->map_enabled = TRUE;

		// Set the latitude and longitude
		$this->themes->js->latitude = Kohana::config('settings.default_lat');
		$this->themes->js->longitude = Kohana::config('settings.default_lon');
		$this->themes->js->default_map = Kohana::config('settings.default_map');
		$this->themes->js->default_zoom = Kohana::config('settings.default_zoom');

		// Get Default Color
		$this->themes->js->default_map_all = $this->template->content->default_map_all = Kohana::config('settings.default_map_all');
		
		// Get default icon
		$this->themes->js->default_map_all_icon = $this->template->content->default_map_all_icon = '';
		if (Kohana::config('settings.default_map_all_icon_id'))
		{
			$icon_object = ORM::factory('media')->find(Kohana::config('settings.default_map_all_icon_id'));
			$this->themes->js->default_map_all_icon = $this->template->content->default_map_all_icon = Kohana::config('upload.relative_directory')."/".$icon_object->media_thumb;
		}

		// Load the alert radius view
		$alert_radius_view = new View('alerts/radius');
		$alert_radius_view->show_usage_info = FALSE;
		$alert_radius_view->enable_find_location = FALSE;
		$alert_radius_view->css_class = "rb_location-radius";

		$this->template->content->alert_radius_view = $alert_radius_view;

		// Get locale
		$l = Kohana::config('locale.language.0');
		
		
		$query = "SELECT i.id as incident_id, i.*, l.location_name, COUNT(r.incident_id) as supporters FROM incident i "
			."LEFT JOIN rating r on r.incident_id=i.id "
			."RIGHT JOIN location l on l.id = i.location_id "
			."GROUP BY i.id "
			."ORDER BY supporters DESC";
			
		$topFuturesIncidents = Database::instance()->query($query);
		//echo $topFuturesIncidents->count();		
		//echo intval(Kohana::config('settings.items_per_page'));
			
		$pagination = new Pagination(array(
				'style' => 'front-end-reports',
				'query_string' => 'page',
				'items_per_page' => intval(Kohana::config('settings.items_per_page')),
				'total_items' => $topFuturesIncidents->count()
			));
						
		// Get the report listing view
		$report_listing_view = $this->_get_futures_listing_view('', $topFuturesIncidents, $pagination);

		// Set the view
		$this->template->content->report_listing_view = $report_listing_view;

		// Load the category
		$category_id = (isset($_GET['c']) AND intval($_GET['c']) > 0)? intval($_GET['c']) : 0;
		$category = ORM::factory('category', $category_id);

		if ($category->loaded)
		{
			// Set the category title
			$this->template->content->category_title = Category_Lang_Model::category_title($category_id,$l);
		}
		else
		{
			$this->template->content->category_title = "";
		}

		// Collect report stats
		$this->template->content->report_stats = new View('reports/stats');
		
		// Total Reports
		$total_reports = Incident_Model::get_total_reports(TRUE);

		// Get the date of the oldest report
		if (isset($_GET['s']) AND !empty($_GET['s']) AND intval($_GET['s']) > 0)
		{
			$oldest_timestamp =  intval($_GET['s']);
		}
		else
		{
			$oldest_timestamp = Incident_Model::get_oldest_report_timestamp();
		}

		// Get the date of the latest report
		if (isset($_GET['e']) AND !empty($_GET['e']) AND intval($_GET['e']) > 0)
		{
			$latest_timestamp = intval($_GET['e']);
		}
		else
		{
			$latest_timestamp = Incident_Model::get_latest_report_timestamp();
		}

		// Round the number of days up to the nearest full day
		$days_since = ceil((time() - $oldest_timestamp) / 86400);
		$avg_reports_per_day = ($days_since < 1)? $total_reports : round(($total_reports / $days_since),2);

		// Percent Verified
		$total_verified = Incident_Model::get_total_reports_by_verified(TRUE);
		$percent_verified = ($total_reports == 0) ? '-' : round((($total_verified / $total_reports) * 100),2).'%';

		// Category tree view
		$this->template->content->category_tree_view = category::get_category_tree_view();

		// Additional view content
		$this->template->content->custom_forms_filter = new View('reports/submit_custom_forms');
		$this->template->content->custom_forms_filter->disp_custom_fields = customforms::get_custom_form_fields();
		$this->template->content->custom_forms_filter->search_form = TRUE;
		$this->template->content->oldest_timestamp = $oldest_timestamp;
		$this->template->content->latest_timestamp = $latest_timestamp;
		$this->template->content->report_stats->total_reports = $total_reports;
		$this->template->content->report_stats->avg_reports_per_day = $avg_reports_per_day;
		$this->template->content->report_stats->percent_verified = $percent_verified;
		$this->template->content->services = Service_Model::get_array();
		//$this->template->content->total_reports = reports::$pagination->total_items;
		$this->template->content->total_reports = $pagination->total_items;		

		$this->template->header->header_block = $this->themes->header_block();
		$this->template->footer->footer_block = $this->themes->footer_block();
	}

	public function recentFutures($location = FALSE)
	{
		// Cacheable Controller
		//$this->is_cachable = TRUE;

		$this->template->header->this_page = 'reports';
		$this->template->content = new View('reports/main');
		$this->themes->js = new View('reports/reports_js');

		$this->template->content->page_title = Kohana::lang('ui_main.showing_futures').Kohana::config('settings.title_delimiter');
		$this->template->content->page_title = Kohana::lang('ui_main.showing_futures');

		// Store any exisitng URL parameters
		$this->themes->js->url_params = json_encode($_GET);

		// Enable the map
		$this->themes->map_enabled = TRUE;

		// Set the latitude and longitude
		$this->themes->js->latitude = Kohana::config('settings.default_lat');
		$this->themes->js->longitude = Kohana::config('settings.default_lon');
		$this->themes->js->default_map = Kohana::config('settings.default_map');
		$this->themes->js->default_zoom = Kohana::config('settings.default_zoom');

		// Get Default Color
		$this->themes->js->default_map_all = $this->template->content->default_map_all = Kohana::config('settings.default_map_all');
		
		// Get default icon
		$this->themes->js->default_map_all_icon = $this->template->content->default_map_all_icon = '';
		if (Kohana::config('settings.default_map_all_icon_id'))
		{
			$icon_object = ORM::factory('media')->find(Kohana::config('settings.default_map_all_icon_id'));
			$this->themes->js->default_map_all_icon = $this->template->content->default_map_all_icon = Kohana::config('upload.relative_directory')."/".$icon_object->media_thumb;
		}

		// Load the alert radius view
		$alert_radius_view = new View('alerts/radius');
		$alert_radius_view->show_usage_info = FALSE;
		$alert_radius_view->enable_find_location = FALSE;
		$alert_radius_view->css_class = "rb_location-radius";

		$this->template->content->alert_radius_view = $alert_radius_view;

		// Get locale
		$l = Kohana::config('locale.language.0');
		
		$query = "SELECT DISTINCT i.id incident_id, i.city_id, i.incident_title, i.incident_description, " 
		."i.incident_date, i.incident_mode, i.incident_active, i.incident_verified, i.user_id, " 
		."i.location_id, i.incident_phase, i.incident_stats, l.country_id, " 
		."l.location_name, l.latitude, l.longitude, " 
		."c.id as category_id, c.category_color, c.category_image, c.category_image_thumb "
		."FROM incident i "
		."LEFT JOIN location l ON (i.location_id = l.id) "
		."LEFT JOIN incident_category ic ON (ic.incident_id = i.id) "
		."LEFT JOIN category c ON (ic.category_id = c.id) "
		."WHERE i.incident_active = 1 ";

		//."ORDER BY i.incident_date DESC LIMIT 0, ".intval(Kohana::config('settings.items_per_page')); 
			
		//TODO filter by $location once that logic is determined
		if (! empty($latitude) AND !empty($longitude))
		{
			$query .= "AND l.latitude = ".floatval($latitude)." AND l.longitude = ".floatval($longitude)." "; 
		}
		
		$query .= "ORDER BY i.incident_date DESC"; 
			
		$recentFuturesIncidents = Database::instance()->query($query);
		
		//echo $recentFuturesIncidents->count();		
		//echo intval(Kohana::config('settings.items_per_page'));
			
		$pagination = new Pagination(array(
				'style' => 'front-end-reports',
				'query_string' => 'page',
				'items_per_page' => intval(Kohana::config('settings.items_per_page')),
				'total_items' => $recentFuturesIncidents->count()
			));
						
		// Get the report listing view
		$report_listing_view = $this->_get_futures_listing_view('', $recentFuturesIncidents, $pagination);

		// Set the view
		$this->template->content->report_listing_view = $report_listing_view;

		// Load the category
		$category_id = (isset($_GET['c']) AND intval($_GET['c']) > 0)? intval($_GET['c']) : 0;
		$category = ORM::factory('category', $category_id);

		if ($category->loaded)
		{
			// Set the category title
			$this->template->content->category_title = Category_Lang_Model::category_title($category_id,$l);
		}
		else
		{
			$this->template->content->category_title = "";
		}

		// Collect report stats
		$this->template->content->report_stats = new View('reports/stats');
		
		// Total Reports
		$total_reports = Incident_Model::get_total_reports(TRUE);

		// Get the date of the oldest report
		if (isset($_GET['s']) AND !empty($_GET['s']) AND intval($_GET['s']) > 0)
		{
			$oldest_timestamp =  intval($_GET['s']);
		}
		else
		{
			$oldest_timestamp = Incident_Model::get_oldest_report_timestamp();
		}

		// Get the date of the latest report
		if (isset($_GET['e']) AND !empty($_GET['e']) AND intval($_GET['e']) > 0)
		{
			$latest_timestamp = intval($_GET['e']);
		}
		else
		{
			$latest_timestamp = Incident_Model::get_latest_report_timestamp();
		}

		// Round the number of days up to the nearest full day
		$days_since = ceil((time() - $oldest_timestamp) / 86400);
		$avg_reports_per_day = ($days_since < 1)? $total_reports : round(($total_reports / $days_since),2);

		// Percent Verified
		$total_verified = Incident_Model::get_total_reports_by_verified(TRUE);
		$percent_verified = ($total_reports == 0) ? '-' : round((($total_verified / $total_reports) * 100),2).'%';

		// Category tree view
		$this->template->content->category_tree_view = category::get_category_tree_view();

		// Additional view content
		$this->template->content->custom_forms_filter = new View('reports/submit_custom_forms');
		$this->template->content->custom_forms_filter->disp_custom_fields = customforms::get_custom_form_fields();
		$this->template->content->custom_forms_filter->search_form = TRUE;
		$this->template->content->oldest_timestamp = $oldest_timestamp;
		$this->template->content->latest_timestamp = $latest_timestamp;
		$this->template->content->report_stats->total_reports = $total_reports;
		$this->template->content->report_stats->avg_reports_per_day = $avg_reports_per_day;
		$this->template->content->report_stats->percent_verified = $percent_verified;
		$this->template->content->services = Service_Model::get_array();
		//$this->template->content->total_reports = reports::$pagination->total_items;
		$this->template->content->total_reports = $pagination->total_items;		

		$this->template->header->header_block = $this->themes->header_block();
		$this->template->footer->footer_block = $this->themes->footer_block();
	}
	
	public function myFutures()
	{

		// Cacheable Controller
		//$this->is_cachable = TRUE;

		$this->template->header->this_page = 'reports';
		$this->template->content = new View('reports/main');
		$this->themes->js = new View('reports/reports_js');

		$this->template->header->page_title .= 'My Futures'.Kohana::config('settings.title_delimiter');
		$this->template->content->page_title = 'My Futures';

		if (! $this->logged_in)
		{
			url::redirect('reports/login');
		}

		// Store any exisitng URL parameters
		$this->themes->js->url_params = json_encode($_GET);

		// Enable the map
		$this->themes->map_enabled = TRUE;

		// Set the latitude and longitude
		$this->themes->js->latitude = Kohana::config('settings.default_lat');
		$this->themes->js->longitude = Kohana::config('settings.default_lon');
		$this->themes->js->default_map = Kohana::config('settings.default_map');
		$this->themes->js->default_zoom = Kohana::config('settings.default_zoom');

		// Get Default Color
		$this->themes->js->default_map_all = $this->template->content->default_map_all = Kohana::config('settings.default_map_all');
		
		// Get default icon
		$this->themes->js->default_map_all_icon = $this->template->content->default_map_all_icon = '';
		if (Kohana::config('settings.default_map_all_icon_id'))
		{
			$icon_object = ORM::factory('media')->find(Kohana::config('settings.default_map_all_icon_id'));
			$this->themes->js->default_map_all_icon = $this->template->content->default_map_all_icon = Kohana::config('upload.relative_directory')."/".$icon_object->media_thumb;
		}

		// Load the alert radius view
		$alert_radius_view = new View('alerts/radius');
		$alert_radius_view->show_usage_info = FALSE;
		$alert_radius_view->enable_find_location = FALSE;
		$alert_radius_view->css_class = "rb_location-radius";

		$this->template->content->alert_radius_view = $alert_radius_view;

		// Get locale
		$l = Kohana::config('locale.language.0');
		
		//$query = "SELECT i.id as incident_id, i.*, l.location_name " 
		//."FROM incident i "
		//."RIGHT JOIN location l on l.id = i.location_id "
		//."WHERE i.user_id =".$logged_in_id." "
		//."WHERE i.user_id =44 "
		//."ORDER BY incident_date DESC";
		
		$logged_in_id = 0;
		
		if(isset(Auth::instance()->get_user()->id))
		{
			$logged_in_id = Auth::instance()->get_user()->id;
									
		}
					
		$query = "select distinct * from(
		SELECT i.id as incident_id, i.*, l.location_name
		FROM incident i
		LEFT JOIN location l on (l.id = i.location_id)
		WHERE i.user_id =".$logged_in_id." 
		union
		SELECT i.id as incident_id, i.*, l.location_name  
		FROM incident i
		INNER JOIN comment c ON (c.incident_id = i.id)
		LEFT JOIN location l on (l.id = i.location_id)
		WHERE c.user_id =".$logged_in_id." 
		) as t";
			
		//echo $query;
			
		$myFuturesIncidents = Database::instance()->query($query);
		
		//echo $myFuturesIncidents->count();		
		//echo intval(Kohana::config('settings.items_per_page'));
			
		$pagination = new Pagination(array(
				'style' => 'front-end-reports',
				'query_string' => 'page',
				'items_per_page' => intval(Kohana::config('settings.items_per_page')),
				'total_items' => $myFuturesIncidents->count()
			));
						
		// Get the report listing view
		$report_listing_view = $this->_get_futures_listing_view('', $myFuturesIncidents, $pagination);

		// Set the view
		$this->template->content->report_listing_view = $report_listing_view;

		// Load the category
		$category_id = (isset($_GET['c']) AND intval($_GET['c']) > 0)? intval($_GET['c']) : 0;
		$category = ORM::factory('category', $category_id);

		if ($category->loaded)
		{
			// Set the category title
			$this->template->content->category_title = Category_Lang_Model::category_title($category_id,$l);
		}
		else
		{
			$this->template->content->category_title = "";
		}

		// Collect report stats
		$this->template->content->report_stats = new View('reports/stats');
		
		// Total Reports
		$total_reports = Incident_Model::get_total_reports(TRUE);

		// Get the date of the oldest report
		if (isset($_GET['s']) AND !empty($_GET['s']) AND intval($_GET['s']) > 0)
		{
			$oldest_timestamp =  intval($_GET['s']);
		}
		else
		{
			$oldest_timestamp = Incident_Model::get_oldest_report_timestamp();
		}

		// Get the date of the latest report
		if (isset($_GET['e']) AND !empty($_GET['e']) AND intval($_GET['e']) > 0)
		{
			$latest_timestamp = intval($_GET['e']);
		}
		else
		{
			$latest_timestamp = Incident_Model::get_latest_report_timestamp();
		}

		// Round the number of days up to the nearest full day
		$days_since = ceil((time() - $oldest_timestamp) / 86400);
		$avg_reports_per_day = ($days_since < 1)? $total_reports : round(($total_reports / $days_since),2);

		// Percent Verified
		$total_verified = Incident_Model::get_total_reports_by_verified(TRUE);
		$percent_verified = ($total_reports == 0) ? '-' : round((($total_verified / $total_reports) * 100),2).'%';

		// Category tree view
		$this->template->content->category_tree_view = category::get_category_tree_view();

		// Additional view content
		$this->template->content->custom_forms_filter = new View('reports/submit_custom_forms');
		$this->template->content->custom_forms_filter->disp_custom_fields = customforms::get_custom_form_fields();
		$this->template->content->custom_forms_filter->search_form = TRUE;
		$this->template->content->oldest_timestamp = $oldest_timestamp;
		$this->template->content->latest_timestamp = $latest_timestamp;
		$this->template->content->report_stats->total_reports = $total_reports;
		$this->template->content->report_stats->avg_reports_per_day = $avg_reports_per_day;
		$this->template->content->report_stats->percent_verified = $percent_verified;
		$this->template->content->services = Service_Model::get_array();
		//$this->template->content->total_reports = reports::$pagination->total_items;
		$this->template->content->total_reports = $pagination->total_items;		
		$this->template->content->myFutures = TRUE;

		$this->template->header->header_block = $this->themes->header_block();
		$this->template->footer->footer_block = $this->themes->footer_block();
					
	}

	public function login()
	{

		// Cacheable Controller
		//$this->is_cachable = TRUE;

		$this->template->header->this_page = 'reports';
		$this->template->content = new View('reports/login');
		$this->themes->js = new View('reports/reports_js');

		$this->template->header->page_title .= 'My Futures'.Kohana::config('settings.title_delimiter');
		$this->template->content->page_title = 'My Futures';

	}
}
