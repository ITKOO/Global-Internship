<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel = "stylesheet" href="css/style.css">
    <link rel="icon" type="image/png" sizes="152x152" href="img/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Nanum+Gothic" rel="stylesheet">
    <title>글로벌 인턴쉽 캠프</title>
    <style>
 	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
    
    .menulist{
    	font-family: 'Noto Sans KR', sans-serif;
    	z-index:300;
        position: absolute; 
        right:0;
        top: 0;
        margin-top:27px;
        margin-right: 120px;
        list-style: none;
        float: right;
    }
    
    .menulist  li
     {        
         display: inline;
         color:#fff;
         opacity: 0.8;
         font-size: 15pt;
         margin-left:35px;
         text-transform: uppercase;
     }
     
     .menulist  li:hover{
     
     	opacity: 1;
     }
     
    </style>
</head>
<body>

    <header>
	     <img src = "img/title.png" class = "title" style="position: absolute;z-index: 100;margin-top:35px;left:90px;" onclick = "location.href='index.jsp'">
	     <img src = "img/view_apply.jpg" class = "topImg" style = "position: relative;z-index: 1;">
	     <ul class = "menulist">
	       <li onclick = "location.href='index.jsp'">Home</li>
                <li onclick = "location.href='about.jsp'">About</li>
                <li onclick = "location.href='journal.jsp'">Journal</li>
                <li onclick = "location.href='activity.jsp'">Activity</li>
                <li onclick = "location.href='view_apply.jsp'" id = "viewApply">View Apply</li>
                <li onclick = "location.href='login.jsp'" id = "loginBtn">Login</li>
                <li id = "logoutBtn">Logout</li>
	     </ul>
	
	</header>
	
		<!-- !!!!!!!!!!!!!!!!! script영역 !!!!!!!!!!!!!!!!!!!!!  -->

    <!-- firebase 관련 js -->
    <script src = "https://www.gstatic.com/firebasejs/4.6.1/firebase.js"></script>
    <script src="https://www.gstatic.com/firebasejs/4.6.1/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/4.6.1/firebase-auth.js"></script>
    <script src="https://www.gstatic.com/firebasejs/4.6.1/firebase-database.js"></script>
    <script src="https://www.gstatic.com/firebasejs/4.6.1/firebase-firestore.js"></script>
    <script src="https://www.gstatic.com/firebasejs/4.6.1/firebase-messaging.js"></script>

    <!-- jquery 관련 js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- firebase config 관련 js -->
    <script src = "fireinit.js"></script>

   <script>
     let UID = "";
        
     firebase.auth().onAuthStateChanged(function(user) {
        
         if (user) { // 인증되었을 때
         $('#viewApply').show();
         $('#logoutBtn').show();
         $('#loginBtn').hide();
         $('#userName').text(user.displayName + "님");
         $('#infoName').text("접속자 : " + user.displayName + "님");
         $('#userPhoto').attr('src', user.photoURL);
        // $('#pra').appendHTML('<a href = "viewProc.jsp?email=' +user.email + '?userName='+ user.displyName+'">');
         UID = user.id;
         
         
       	}  // end of if
       else { // 인증되지 않았을 때
        
    	 location.href = "index.jsp";
         $('#viewApply').hide(); 
         $('#loginBtn').show();
         $('#logoutBtn').hide();
         $('#userName').hide(); 
         $('#infoName').hide();
         $('#userPhoto').hide();
       }
     });
    
     /* 로그아웃 버튼을 눌렀을 때 인증 해제 하도록 하기 */
     $('#logoutBtn').click(function(){
       firebase.auth().signOut().then(function() {
         alert("로그아웃 되었습니다.");
       }, function(error) {
         alert(error.message);
       });
     });
     
     </script>
	

</body>
</html>
