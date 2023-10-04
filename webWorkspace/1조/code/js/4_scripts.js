$(document).ready(function() {
  let defaultLoad = 5;
  let $allLoad = $("#recentNews_Area li");

  $allLoad.slice(defaultLoad).hide();

  $("#load_more").click(function(event){
    event.preventDefault();
    $allLoad.show();
    $(this).hide();
  });
});