$(document).ready(function(){
  $(".return.bookClass").click(function(){
    var r = confirm("이 책을 반납하시겠습니까?")
    if (r){
      alert("반납!")
      var bookId = $(this).attr('book-id')
      var checkId = $(this).attr('check-id')
      $.get('/return/'+bookId+'/'+checkId, function(data) {
        $('div[book-id='+bookId+']').hide() 
        }) //refresh
    }
    else{
      alert("반납안함!")
    }
  });

  $(".prolong.bookClass").click(function(){
    var r = confirm("이 책의 반납기한을 일주일 연장하시겠습니까?")
    if(r){
      alert("연장!")
      var checkId = $(this).attr('check-id')
      $.get('/prolong/'+checkId, function(data) { $() })
    }
    else{
      alert("연장안함!")
    }

  });

});
