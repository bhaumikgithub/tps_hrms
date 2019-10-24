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
//= require cropping
  $(document).ready(function(){
    if($('.marital_status').val() == 'Married')
      $('.anniversary_date_div').show()
    else
      $('.anniversary_date_div').hide()
    $(".marital_status").on('change', function() {
      if($('option:selected', this).text() == 'Married')
        $('.anniversary_date_div').show()
      else
        $('.anniversary_date_div').hide()
    });
    var currentYear = (new Date).getFullYear()
    $('.birthdate ').datepicker({
      yearRange: [currentYear - 50,currentYear -14],
    });
    $('.join_date, .anniversary_date').datepicker({
       yearRange: [currentYear - 50,currentYear],
    });
     $('.join_date').datepicker({

       yearRange: [2011 ,currentYear],
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
