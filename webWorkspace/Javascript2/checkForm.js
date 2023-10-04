// form유효성 확인
window.onload = function(){
    // 폼의 유효성 확인
    // 폼의 [회원가입] 버튼 눌렀을 때 : submit 이벤트 발생 / 처리
    document.getElementById('joinForm').onsubmit = function(){
        // 성명을 입력하지 않은 경우 알림창 출력 (값 : value)
        let name = document.getElementById('name');

        if(name.value == ""){
            alert("성명을 입력하십시오.");
            name.focus();  
            return false; //sumbit 기본 : 다음 페이지로 이동하는데 -> submit되지 않고 focus하도록
        }

        // 아이디 입력란
        let id = document.getElementById('id');

        if(id.value == ""){
            alert("아이디을 입력하십시오.");
            id.focus();  
            return false; 
        }
        else if(id.value.length<6 || id.value.length> 10){
            alert("아이디을 6~10자로 입력하십시오.");
            id.focus();
            id.value = ''
            return false; 
        }

        // 비밀번호 일치 여부
        let password = document.getElementById('password');
        let passwordcheck = document.getElementById('passwordCheck');


        if(password.value != passwordcheck.value){
            alert("비밀번호 확인이 일치하지 않습니다.");
            passwordcheck.focus();
            passwordcheck.value = ''
            return false; 
        } 

        // select 태그 : 직업 선택하지 않은 경우 
        let job = document.getElementById("job");

        // 방법1. selectedIndex 사용
        // if(job.selectedIndex == 0){
        //     alert('직업을 선택하세요');
        //     return false;
        // }
        // 방법2. value 속성 사용
        if(job.value==''){
            alert('직업을 선택하세요');
            return false;
        }

        // email 수신 여부 라디오 버튼 선택하지 않은 경우
        // 라디오 버튼 : id 속성 말고 그룹이름 name 속성 사용
        // 동일 그룹에 속한 여러 라디오 객체 : name 동일
        // 그룹 내에 여러개의 라디오 객체 있음 : 배열 처리
        let chk = false;   // 체크 여부 확인하는 변수. false로 초기화
        for(let i=0; i<joinForm.emailRcv; i++){
            if(joinForm.emailRcv[i].checked == true){
                chk = true;    // 하나라도 체크되면 true로 설정
            }
        }

        // 하나도 선택되지 않으면  false값 그대로
        if(chk == false){
            alert("이메일 수신 여부를 선택하세요");
            return false;
        }

        // checkbox
        let agreement1 = document.getElementById("agreement1");
        let agreement2 = document.getElementById("agreement2");

        if(agreement1.checked == false || agreement2.checked == false){
            alert("모두 동의하셔야 합니다.");
            return false;
        }

        

    }; //onsubmit끝
}; // window.onload끝

