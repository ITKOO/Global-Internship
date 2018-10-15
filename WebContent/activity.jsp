<%@page import="java.sql.*"%> <%-- JDBC API 임포트 작업 --%>
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
    <!-- Animate.css -->
	<link rel="stylesheet" href="css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="css/icomoon.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="css/magnific-popup.css">
	<!-- Salvattore -->
	<link rel="stylesheet" href="css/salvattore.css">
	<!-- Theme Style -->
	<link rel="stylesheet" href="css/style_a.css">
	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
    <title>글로벌 인턴쉽 캠프</title>
    <style>
    	.floatBtn{
    	width:80px;
    	height:80px;
    	position:fixed;
    	float:right;
    	right:0;
    	top:840px;
    	margin-right:40px;
    	opacity: 0.8;
    	
    	}
    	.floatBtn:hover{
    	opacity: 1;
    	}
    	
    	/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    -webkit-animation-name: fadeIn; /* Fade in the background */
    -webkit-animation-duration: 0.4s;
    animation-name: fadeIn;
    animation-duration: 0.4s
}

/* Modal Content */
.modal-content {
    position: fixed;
    bottom: 0;
    background-color: #fefefe;
    width: 100%;
    -webkit-animation-name: slideIn;
    -webkit-animation-duration: 0.4s;
    animation-name: slideIn;
    animation-duration: 0.4s
}

/* The Close Button */
.close {
    color: #313131;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #414040;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    
    background-color: #f2f2f2;
    
    color: #313131;
}

.modal-body {
padding: 2px 16px;
color: #313131;
}

/* Add Animation */
@-webkit-keyframes slideIn {
    from {bottom: -300px; opacity: 0} 
    to {bottom: 0; opacity: 1}
}

@keyframes slideIn {
    from {bottom: -300px; opacity: 0}
    to {bottom: 0; opacity: 1}
}

@-webkit-keyframes fadeIn {
    from {opacity: 0} 
    to {opacity: 1}
}

@keyframes fadeIn {
    from {opacity: 0} 
    to {opacity: 1}
}
    </style>

</head>
<body>

 	<!-- 상단  메뉴바 -->
   <jsp:include page="menubar_a.jsp" flush="false"/>
   <div id="fh5co-main">
   <img src = "img/floatBtn.svg" style = "" class = "floatBtn" id="floatBtn">
   <!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h2>사진추가</h2>
    </div>
    <div class="modal-body">
    <br><br>
    <form name="activityForm"  enctype="multipart/form-data" method="post" action="activityProc.jsp">
		<input type="file" name="filename1" size=40><br><input type="submit" value="올리기">
		<br><br><br>
	</form>	
      
    </div>
  </div>

</div>
		<div class="container">
			
			<div class="row">

        <div id="fh5co-board" data-columns>
        <%!
	
	String imgAddress; // 사진주소

	%>
	<%

	request.setCharacterEncoding("UTF-8"); //받아오는 값을 한글로 처리	
	Class.forName("com.mysql.jdbc.Driver"); // mysql 연동
	String url = "jdbc:mysql://localhost:3306/global?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC"; // mysql 데이터베이스명
	String id = "root";   // mysql id값
	String pw = "1234";   // mysql pw값
	
	
	try{
		Connection conn = DriverManager.getConnection(url, id, pw); //실제연동시도
	  	String sql = "select * from activityPage;";
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	ResultSet rs=pstmt.executeQuery();
	  	while(rs.next()){
	  		
	  		imgAddress = rs.getString("imgAddress");
	  		out.println("<div class='item'><div class='animate-box'><a href='img/activity/" + imgAddress + 
	  				"' class='image-popup fh5co-board-img'>" + "<img src='img/activity/" 
	  				+ imgAddress + "' alt='Free HTML5 Bootstrap template'>" + "</a></div></div>");
    
	  		
	  	}
	  
	}catch(SQLException e){
	
	  out.println(e.toString());
	
	}
%>
	

<!-- 
        	<div class="item">
        		<div class="animate-box">
	        		<a href="img/img_1.jpg" class="image-popup fh5co-board-img"><img src="img/img_1.jpg" alt="Free HTML5 Bootstrap template"></a>
        		</div>
        		
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="img/img_2.jpg" class="image-popup fh5co-board-img"><img src="img/img_2.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="img/img_3.jpg" class="image-popup fh5co-board-img"><img src="img/img_3.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="img/img_4.jpg" class="image-popup fh5co-board-img"><img src="img/img_4.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		
        		</div>
        	</div>
        	<div class="item">
        		<div class="animate-box">
	        		<a href="img/img_5.jpg" class="image-popup fh5co-board-img"><img src="img/img_5.jpg" alt="Free HTML5 Bootstrap template"></a>
	        		
        		</div>
        	</div>  -->
  </div>
        </div>
       </div>
	</div>
	
	
	<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("floatBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
	
	
 <!-- jQuery -->
	<script src="js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="js/jquery.waypoints.min.js"></script>
	<!-- Magnific Popup -->
	<script src="js/jquery.magnific-popup.min.js"></script>
	<!-- Salvattore -->
	<script src="js/salvattore.min.js"></script>
	<!-- Main JS -->
	<script src="js/main.js"></script>


</body>
</html>
