// 좋아요 emoji를 누르면 좋아요 수가 증가하는 함수
$(document).ready(function(){
  let count=0;
  $('#smile_img').click(function(){
    $('#count_like').text(++count)
  })

  $('#smile_img').mousedown(function(){
    $('#smile_img').css('opacity',0.5);
  })

  $('#smile_img').mouseup(function(){
    $('#smile_img').css('opacity',1.0);
  })
}) // ready 태그 닫음
