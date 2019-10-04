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
    $('.birthdate ').datepicker({
      yearRange: [currentYear - 79,currentYear -14],
    });
      // debugger;
    $('.join_date, .anniversary_date').datepicker({
      yearRange: [currentYear - 100,currentYear - 0],
    });
    $('.leave_date').datepicker();
    $('.leave_end_date').datepicker({
      onOpen: function(){
        var startDate = new Date($("#start_date").val());
        var instance = M.Datepicker.getInstance($('.leave_end_date'));
        instance.options.minDate = new Date(startDate);
      }
    });
  });
