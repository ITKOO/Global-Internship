<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- 앱앤미 관리자 웹사이트 관련 css 파일 -->
    <link rel = "stylesheet" href="css/style_l.css">
    <!-- 구글 웹폰트 css  -->
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Nanum+Gothic" rel="stylesheet">
    <!-- favicon -->
    <link rel="icon" type="image/png" sizes="152x152" href="img/favicon.png">
    <!-- fa-fa-icon css -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
    <title>글로벌 인턴쉽 캠프</title>
</head>
<body>
    <div class = "background">
        <div class="card">
            <div class="logoImg"></div>
            <div class = "set">
                    <div class="textBox">어서와라,<br> 글로발에</div>
                    <div class="loginBox">
                        
                        	<!-- ID 입력박스 -->
                               <div class = "signDiv">
					            	<img src="https://www.bigapple.in/img/login-google.png" width="300" id = "googleLoginBtn">
					        </div>
					   
                    </div>
            </div>
         <div class = "copyright">
            &copy; copyright 2018 all rights reserved Mirim <br>developed by ITKOO
         </div>

        </div>
    </div>
    
    <!-- /////////////////////////////////// javascript 스크립트 영역 /////////////////////////////////// -->

  <!--Import jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
 

  <!--  firebase SDK 링크 -->
  <script src="https://www.gstatic.com/firebasejs/3.1.0/firebase.js"></script>
  <script src="https://www.gstatic.com/firebasejs/3.1.0/firebase-app.js"></script>
  <script src="https://www.gstatic.com/firebasejs/3.1.0/firebase-auth.js"></script>
  <script src="fireinit.js"></script>
  <script type="text/javascript">
    /* 버튼을 눌렀을 경우 구글 인증 동작하게 */
    $('#googleLoginBtn').click(function(){ // jQuery를 이용
      /* 구글 인증을 provider 변수에 대체 */
      var provider = new firebase.auth.GoogleAuthProvider();
      /* provider(구글 인증) 인증으로 로그인 처리 */
      firebase.auth().signInWithPopup(provider).then(function(result) {
        // 구글 로그인이 성공했을 경우 수행할 코드
      }).
      catch(function(error) { // 로그인이 실패 했을시
        // 구글 로그인이 실패했을 경우 수행할 코드
        alert(error.message)
      });
    });
    /* 인증 상태 변화 감시하기 */
    firebase.auth().onAuthStateChanged(function (user) {
        if (user) { // 인증되었을 때
            alert("글로벌 인턴쉽 캠프 웹사이트에 오신것을 환영합니다 :)");
            location.href = "index.jsp";
        } 
        else { 
            
        }
    });
    
  </script>
</body>
</html>
