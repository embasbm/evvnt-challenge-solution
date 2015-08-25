$(document).ready(function(){
  var $dateFromField  = $('input#date_from'),
      $dateToField    = $('input#date_to'),
      $minDate        = $.datepicker.parseDate("dd/mm/yy", $dateFromField.data().mindate),
      $maxDate        = $.datepicker.parseDate("dd/mm/yy", $dateToField.data().maxdate);
  $dateFromField.datepicker({minDate: $minDate, maxDate: $maxDate});
  $dateToField.datepicker({minDate: $minDate, maxDate: $maxDate});

  //  => source: http://edgeguides.rubyonrails.org/working_with_javascript_in_rails.html
  $('#events_filter').on("ajax:success", function(e, data, status, xhr){
    // console.log(e,'data: ', data, status, xhr)
    $("#main_content").html(data);
  });
});