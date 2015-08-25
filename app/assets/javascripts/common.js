$(document).ready(function(){
  $('input.datepicker').datepicker();

  $('#events_filter').on("ajax:success", function(e, data, status, xhr){
    // console.log(e,'data: ', data, status, xhr)
    $("#main_content").html(data);
  });
});