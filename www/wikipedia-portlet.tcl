#dotlrn-wikipedia/www/wikipedia-portlet.tcl

ad_page_contract {
    The display logic for the wikipedia portlet

    @author Agustin Lopez (Agustin.Lopez@uv.es)
    @version $Id$
} {           
  {whatsearch:trim ""}
  {xlang:trim ""}
  {see:trim "short"}
  {page_num:trim "0"}
} -properties {
}

if {$xlang eq ""} {
  set xlang [string range [lang::user::site_wide_locale] 0 1]
}

array set config $cf
set community_id [dotlrn_community::get_community_id]

set user_id [ad_conn user_id]

ad_return_template

