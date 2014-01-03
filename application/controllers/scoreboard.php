<?php defined('SYSPATH') or die('No direct script access.');
/**
 * Scoreboard Controller
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team <team@ushahidi.com>
 * @package    Ushahidi - http://source.ushahididev.com
 * @subpackage Controllers
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL)
 */

class Scoreboard_Controller extends Main_Controller {
	function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
		$this->template->header->this_page = 'scoreboard';
		$this->template->content = new View('scoreboard');

		$this->template->header->page_title .= Kohana::lang('makercities.tab_scoreboard') . Kohana::config('settings.title_delimiter');

		$scoreboard = Reports_Controller::city_leaderboard(true, true);
		$this->template->content->scoreboard = $scoreboard;
	}

}
