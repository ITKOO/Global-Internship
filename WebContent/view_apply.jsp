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
    <title>글로벌 인턴쉽 캠프</title>
    <style>
    
  
    .viewCard{
    	width : 300px;
    	height:310px;
    	background-color: #f2f2f2;
    	margin-left:35px;
    	margin-top:35px;
    	text-align:center;
    	display:inline-block;
    	box-shadow: 0px 3px 5px #cecece;
    }
    
    .viewCard .applyImg{
    width:130px;
    height:130px;
    margin-top:30px;
    border-radius: 50%;
    
    }
    
    .viewCard .detailBtn{
    width:110px;
    height:35px;
    margin-top:13px;
    opacity: 0.8;
    
    }
    
     .viewCard .detailBtn:hover{
    opacity: 1;
    }
    
    .viewCard p{
    	color : #717171;
    	font-weight: bold;
    	margin-bottom: 20px;
    }
    
    .viewCard hr{
	    border-color : #cbcbcb;
	    width: 35px;
    	border-style: ridge;
    }
    
    .menulist{
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

 	<!-- 상단  메뉴바 -->
   <jsp:include page="menubar.jsp" flush="false"/>
    

<%!
	String student_number;    // 학번
	String name; // 이름
	String imgAddress; // 사진주소
	int rows;
%>

<%

	request.setCharacterEncoding("UTF-8"); //받아오는 값을 한글로 처리	
	Class.forName("com.mysql.jdbc.Driver"); // mysql 연동
	String url = "jdbc:mysql://localhost:3306/global?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC"; // mysql 데이터베이스명
	String id = "root";   // mysql id값
	String pw = "1234";   // mysql pw값
	
	
	try{
		Connection conn = DriverManager.getConnection(url, id, pw); //실제연동시도
	  	String sql = "select * from applyPage;";
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	ResultSet rs=pstmt.executeQuery();
	  	while(rs.next()){
	  		student_number = rs.getString("student_number"); 
	  		name = rs.getString("name");
	  		imgAddress = rs.getString("imgAddress");
	  		out.println("<div class = 'viewCard'><img src = 'img/apply/" + imgAddress + "' class = 'applyImg'><p>" + 
	  		student_number + " " + name + "</p><hr><a href = 'view_detail.jsp?student_number=" + student_number +"'><img src = 'img/detail_button.png' class = 'detailBtn'></a></div>");
	  		
	  	}
	  
	}catch(SQLException e){
	
	  out.println(e.toString());
	
	}
%>


</script>




</body>
</html>
