$(document).ready(function(){
  $('input.datepicker').datepicker();

  //  => source: http://edgeguides.rubyonrails.org/working_with_javascript_in_rails.html
  $('#events_filter').on("ajax:success", function(e, data, status, xhr){
    // console.log(e,'data: ', data, status, xhr)
    $("#main_content").html(data);
  });
});