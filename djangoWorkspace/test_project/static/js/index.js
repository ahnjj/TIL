window.onload = function(){
    let btn = document.getElementById('btn');

    // 버튼 클릭시 show_msg함수 호출
    btn.addEventListener('click', show_msg);
}

function show_msg(){
    alert('메세지 출력');
}