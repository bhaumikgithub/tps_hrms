//= require jquery
//= require jquery_ujs
//= jquery.dataTables.min
//= require activestorage
//= plugins
//= require ckeditor/init
//= materialize
//= vendors.min
//= require_tree .
//= require moment 
//= require fullcalendar
//= require app-calendar
  $(document).ready(function(){
    var currentYear = (new Date).getFullYear()
    $('.anniversary_date, .birthdate ').datepicker({
      yearRange: [currentYear - 79,currentYear -14],
    });
    $('.join_date').datepicker({
      yearRange: [currentYear - 100,currentYear],
    });
    $('.leave_date, .leave_end_date').datepicker({
    });
  });
