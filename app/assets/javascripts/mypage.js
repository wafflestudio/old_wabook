function soonbun() {
  $("#mybooklist > .book").each(function(k, v) {
    $(v).children(".order").text((k + 1).toString());
  });
}

$(document).ready(function(){
  soonbun();
  $(".return.bookClass").click(function(){
    var r = confirm("이 책을 반납하시겠습니까?")
    if (r){
      alert("반납!")
      var bookId = $(this).data('book_id')
      var checkId = $(this).data('check_id')
      $.get('/return/'+bookId+'/'+checkId, function(data) {
        location.reload();
      }) 
    }
    else{
      alert("반납안함!")
    }
  });

  $(".prolong.bookClass").click(function(){
    var r = confirm("이 책의 반납기한을 일주일 연장하시겠습니까?")
    if(r){
      var checkId = $(this).data('check_id')

      $.get('/prolong/'+checkId, function(data) { 
        if (data.status == "OK")
        {
          alert("연장!")
          location.reload();
        }
        else
          alert("안됨!")

      })

    }
    else{
      alert("연장안함!")
    }

  });

});
