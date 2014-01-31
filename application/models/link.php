<?php defined('SYSPATH') or die('No direct script access.');

/**
* Links Table Model
*/

class Link_Model extends ORM
{
	protected $belongs_to = array('incident','user');
	
	// Database table name
	protected $table_name = 'link';
}