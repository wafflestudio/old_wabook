$(document).ready(function(){
  $(".title.bookClass").click(function(){
    $(this).parent().parent().children(".content").slideToggle("slow");
  });
  $(".available.bookClass").click(function(){
    var r = confirm("이 책을 빌리시겠습니까?")
    if (r){
      alert("빌림!")
      //Book.returned=false
    }
    else{
      alert("안빌림!")
    }

  });
  $(".reservation.bookClass").click(function(){
    var r = confirm("이 책을 예약하시겠습니까?")
    if (r){
      alert("예약!")
    }
    else{
      alert("안예약!")
    }

  });

});
