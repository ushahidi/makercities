<?php
/**
 * View file for updating the reports display
 *
 * PHP version 5
 * LICENSE: This source file is subject to LGPL license 
 * that is available through the world-wide-web at the following URI:
 * http://www.gnu.org/copyleft/lesser.html
 * @author     Ushahidi Team - http://www.ushahidi.com
 * @package    Ushahidi - http://source.ushahididev.com
 * @copyright  Ushahidi - http://www.ushahidi.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL) 
 */
?>
		<!-- Top reportbox section-->
<?php
function reportBoxPaginator($stats_breadcrumb, $pagination, $previous_page, $next_page) {
	//global $stats_breadcrumb, $pagination, $previous_page, $next_page;
	?>
		<div class="rb_nav-controls">
        <table style="width:100%;">
          <tr>
            <td colspan="3" style="text-align:center"><?php echo $stats_breadcrumb; ?></td>
          </tr>
          <tr>
            <td style="text-align:right">
      				<ul class="link-toggle lt-icons-only">
                <li><a href="#page_<?php echo $previous_page; ?>" class="prev"></a></li>
              </ul>
            </td>
            <td style="text-align:center;">
              <?php echo $pagination; ?>
            </td>
            <td style="text-align:right">
              <ul class="link-toggle lt-icons-only">
        				<li><a href="#page_<?php echo $next_page; ?>" class="next"></a></li>
              </uL>
            </td>
          </tr>
        </table>
		</div>
<?php
}

?>
		<!-- /Top reportbox section-->
		
		<!-- Report listing -->
		<div class="r_cat_tooltip"><a href="#" class="r-3"></a></div>
		<div class="rb_list-and-map-box">
			<div id="rb_list-view">
			<?php echo $incidents_html; ?>
			</div>
			<div id="rb_map-view" style="display:none; width: 590px; height: 384px; border:1px solid #CCCCCC; margin: 3px auto;">
			</div>
		</div>
		<!-- /Report listing -->
		
		<!-- Bottom paginator -->
		<?php reportBoxPaginator($stats_breadcrumb, $pagination, $previous_page, $next_page); ?>
		<!-- /Bottom paginator -->
	        