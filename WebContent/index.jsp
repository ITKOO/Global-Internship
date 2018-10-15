<%@page import="java.sql.*"%> <%-- JDBC API 임포트 작업 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/png" sizes="152x152" href="img/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Nanum+Gothic+Coding" rel="stylesheet">
    <title>글로벌 인턴쉽 캠프</title>
</head>
<body>
<%!
	String main_title;    // 넘어온 큰제목 값 저장
	String small_title; // 넘어온 소제목 값 저장
%>

<%

	request.setCharacterEncoding("UTF-8"); //받아오는 값을 한글로 처리	
	Class.forName("com.mysql.jdbc.Driver"); // mysql 연동
	String url = "jdbc:mysql://localhost:3306/global?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC"; // mysql 데이터베이스명
	String id = "root";   // mysql id값
	String pw = "1234";   // mysql pw값
	
	
	try{
		Connection conn = DriverManager.getConnection(url, id, pw); //실제연동시도
	  	String sql = "select * from indexPage;";
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	ResultSet rs=pstmt.executeQuery();
	  	while(rs.next()){
	  		main_title = rs.getString("main_title"); 
	  		small_title = rs.getString("small_title");
	  	}
	  
	}catch(SQLException e){
	
	  out.println(e.toString());
	
	}
%>
    <section class="index">
        <header>
            <img src="img/title.png" class="title" onclick = "location.href='index.jsp'">
            <img src="img/index_bg.png" class="topImg">
            <ul class="menulist">
                <li onclick = "location.href='index.jsp'">Home</li>
                <li onclick = "location.href='about.jsp'">About</li>
                <li onclick = "location.href='journal.jsp'">Journal</li>
                <li onclick = "location.href='activity.jsp'">Activity</li>
                <li onclick = "location.href='view_apply.jsp'" id = "viewApply">View Apply</li>
                <li onclick = "location.href='login.jsp'" id = "loginBtn">Login</li>
                <li id = "logoutBtn">Logout</li>
            </ul>

        </header>

        <section class="main">
            <p>
                <%=main_title %>
            </p>
            <span>
                Global internship camp in
                <%=small_title %>
            </span>
            <img src="img/apply_button.png" onclick="location.href='apply.jsp'">
        </section>
		
		<div style = "width:300px;height:100px;position:fixed;background-color: white;z-index: 500;bottom:0;right:0;border-radius: 20px;margin: 35px;margin-right: 80px;opacity: 0.9">
			<img style = "width:60px;height:60px;border-radius:50%;margin:20px;float:left;box-shadow: 0px 3px 5px #cecece" id ="userPhoto">
			<span id = "userName" style = "margin-top:35px;display: inline-block;font-size: 15pt;"></span>
		</div>

    </section>


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
         $('#userPhoto').attr('src', user.photoURL);
         UID = user.id;
         
         
       	}  // end of if
       else { // 인증되지 않았을 때
        
         $('#viewApply').hide(); 
         $('#loginBtn').show();
         $('#logoutBtn').hide();
         $('#userName').hide(); 
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
