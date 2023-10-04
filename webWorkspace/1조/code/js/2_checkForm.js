// 2(login).html 페이지
window.onload = function () {
    document.getElementById('join').onsubmit = function() {
        // 아이디 : abcd 
        // 비밀번호 : 1234

        // let id = document.getElementById('id');

        let id = 'abcd'
        let password = '1234'
        
    

        if((id.value !== inputId) || password.value !== inputPassword  ) { 
            alert("아이디나 비밀번호가 일치하지 않습니다");
            password.value = "";
            password.focus(); 
            return false; 
        }

    }; // onsubmit 끝




}; // window.onload 끝