$(document).ready(function(){
  $(".return.bookClass").click(function(){
    var r = confirm("이 책을 반납하시겠습니까?")
    if (r){
      alert("반납!")
      var bookId = $(this).attr('book-id')
      var checkId = $(this).attr('check-id')
      $.get('/return'+bookId+'/'+checkId, function(data) {}) //refresh
    }
    else{
      alert("안반납!")
    }
  });


});
