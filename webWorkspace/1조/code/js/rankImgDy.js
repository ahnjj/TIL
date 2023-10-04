
$(function(){ 
    let $rankImgBox = $('#rankImgBox > div');

    $('#rankMainMenuItem li:first-child').addClass('selectedItem'); 

    $('#rankMainMenuItem li').on('click', function(){ 
        let index = $(this).index();
        $('#rankMainMenuItem li').removeClass('selectedItem');
        $(this).addClass('selectedItem');
        $('#selectedItem').css('backgroundColor', 'blue');
        $rankImgBox.css('display', 'none')
        $rankImgBox.eq(index).css('display', 'block')
    });
}); 
// mainMenu li 클릭시 rankImg div 박스안의 사진들 해당 li 테마 이미지 박스로 변경
