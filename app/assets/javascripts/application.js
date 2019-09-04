//= require jquery
//= require jquery_ujs
//= jquery.dataTables.min
//= require activestorage
//= plugins
//= materialize
//= vendors.min
//= require ckeditor/init
//= require_tree .
//= require moment 
//= require fullcalendar
//= require app-calendar
  $(document).ready(function(){
      debugger
    $('.datepicker').datepicker({
      yearRange: [1950,2005],
    });
  });
