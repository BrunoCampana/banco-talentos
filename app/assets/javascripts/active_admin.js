//= require active_admin/base
//= require activeadmin_addons/all
//= require active_admin/searchable_select
#= require active_admin_datetimepicker
#= require active_admin_filters_visibility

$(document).ready(function() {
    $('#filters_sidebar_section').activeAdminFiltersVisibility();
  });
