$(document).ready(function(){
  $(".book").click(function(){
  $(this).children(".content").slideToggle("slow");
  });
});
