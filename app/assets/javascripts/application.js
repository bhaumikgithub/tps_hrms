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
    if($('#user_marital_status').val() == 'Married')
      $('.anniversary_date_div').show()
    else
      $('.anniversary_date_div').hide()
    $("#user_marital_status").on('change', function() {
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

    var cdate = new Date();
    $('.free_leave_date').datepicker({
      firstDay: 1,
      selectMonths: true,
      defaultDate: cdate,
      setDefaultDate: true,
      onOpen: function(){
        var minDate = new Date(cdate.getFullYear(), cdate.getMonth(), 1);
        var instance = M.Datepicker.getInstance($('.free_leave_date'));
        instance.options.minDate = new Date(minDate);
      },
      disableDayFn: function(date) {
        if (date.getDate() == 1)
          return false;
        else
          return true;
      }
    });

    function startOfMonth(date)
    {
      return new Date(date.getFullYear(), date.getMonth(), 1);
    }

    $('.from_education_date').datepicker({
      firstDay: 1,
      selectMonths: true,
      defaultDate: startOfMonth(cdate),
      setDefaultDate: true,
      disableDayFn: function(date) {
        if (date.getDate() == 1)
          return false;
        else
          return true;
      }
    });

    $('.to_education_date').datepicker({
      firstDay: 1,
      onOpen: function(){
        var startDate = new Date($("#start_education_date").val());
        var instance = M.Datepicker.getInstance($('.to_education_date'));
        instance.options.minDate = new Date(startDate);
      },
      disableDayFn: function(date) {
        if (date.getDate() == 1)
          return false;
        else
          return true;
      }
    });


  });
