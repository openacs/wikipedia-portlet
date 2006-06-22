ad_library {
}

namespace eval wikipedia_portlet {

    ad_proc -private get_my_name {
    } {
        return "wikipedia_portlet"
    }

    ad_proc -private my_package_key {
    } {
        return "wikipedia-portlet"
    }

    ad_proc -public get_pretty_name {
    } {
        return "#wikipedia-portlet.pretty_name#"
    }

    ad_proc -public link {
    } {
        return ""
    }

    ad_proc -public add_self_to_page {
        {-portal_id:required}
        {-page_name ""}
        {-package_id:required}
        {-extra_params ""}
        {-force_region ""}
        {-param_action:required}
    } {
        add the portlet element to the given portal
    } {
        return [portal::add_element_parameters \
            -portal_id $portal_id \
            -page_name $page_name \
            -pretty_name [get_pretty_name] \
            -portlet_name [get_my_name] \
            -key package_id \
            -value $package_id \
            -force_region $force_region \
            -extra_params $extra_params \
            -param_action $param_action
            ]
    }

    ad_proc -public remove_self_from_page {
        {-portal_id:required}
        {-package_id:required}
    } {
        Removes a wikipedia PE from the given page or the package_id of the
        wikipedia package from the portlet if there are others remaining

        @param portal_id The page to remove self from
        @param package_id
    } {
        portal::remove_element_parameters \
            -portal_id $portal_id \
            -portlet_name [get_my_name] \
            -value $package_id
    }

    ad_proc -public show {
         cf
    } {
    } {
        portal::show_proc_helper \
            -package_key [my_package_key] \
            -config_list $cf \
            -template_src "wikipedia-portlet"
    }

}

