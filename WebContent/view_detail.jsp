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
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans" rel="stylesheet">
    <title>글로벌 인턴쉽 캠프</title>
    <style>
    
    	.button{
    		opacity:0.8;
    		margin-right:80px;
    	}
    	.button:hover{
    		opacity: 1;
    	
    	}
    </style>
</head>
<body>
   <%!
     int student_number;
  	 String name;
  	 String phone_number;
  	 String apply_reason;
  	 String goal;
  	 String imgAddress;
  	 String major;
  	 
   %>
   <% 
   
   		
   		student_number = Integer.parseInt(request.getParameter("student_number"));
   		System.out.println(student_number);
   		request.setCharacterEncoding("UTF-8"); //받아오는 값을 한글로 처리	
   		Class.forName("com.mysql.jdbc.Driver"); // mysql 연동
   		String url = "jdbc:mysql://localhost:3306/global?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC"; // mysql 데이터베이스명
   		String id = "root";   // mysql id값
   		String pw = "1234";   // mysql pw값
   		
   		
   		try{
   			Connection conn = DriverManager.getConnection(url, id, pw); //실제연동시도
   		  	String sql = "select * from applyPage where student_number = " + student_number + ";";
   		  	PreparedStatement pstmt = conn.prepareStatement(sql);
   		  	ResultSet rs=pstmt.executeQuery();
   		  	while(rs.next()){
	   		 	name = rs.getString("name");
	   		 	phone_number = rs.getString("phone_number");
	   		 	apply_reason = rs.getString("apply_reason");
	   			goal = rs.getString("goal");
	   			imgAddress = rs.getString("imgAddress");
   		  	}
   		  	
	 		if(request.getParameter("student_number").substring(1,2).equals("1") || request.getParameter("student_number").equals("1"))
	 		{
	 			major = "인터랙티브미디어과";
	 		}
	 		
	 		else if(request.getParameter("student_number").substring(1,2).equals("3") || request.getParameter("student_number").equals("4"))
	 		{
	 			major = "뉴미디어디자인과";
	 		}
	 		
	 		else{
	 			major = "뉴미디어솔루션과";
	 		}
   		  
   		}catch(SQLException e){
   		
   		  out.println(e.toString());
   		
   		}
   
   
   %>
   
   <section class = "viewDetail">
   <!-- 상단  메뉴바 -->
   <jsp:include page="menubar.jsp" flush="false"/>
       

      <div class="detail">
          <div class="scoreContent">
          	  <form method = "post" action = "viewProc.jsp?student_number=<%=student_number%>">
	              <div class = "info" id = "infoName"></div>
	              <div class = "info" id = "infoName" style = "margin-top:6px;font-size:13pt;font-weight: lighter;">※소숫점 점수는 되지 않음.</div>
	              <div class = "info" id = "infoName" style = "margin-top:6px;font-size:13pt;font-weight: lighter;"><a href = "view_score.jsp?student_number=<%=student_number%>" style="color:white">통합점수보기</a></div>
	              <p>채점자</p>
	              <input type="text" class = "inputText" name = "score_person"><br>
	              <p>커뮤티케이션(30점)</p>
	              <input type="text" class = "inputText" name = "communication"><br>
	              <p>창의력(30점)</p>
	              <input type="text" class = "inputText" name = "creative"><br>
	              <p>유머감각(30점)</p>
	              <input type="text" class = "inputText" name = "humor"><br>
	              <p>가산점(10점)</p>
	              <input type="text" class = "inputText" name = "plus"><br><br><br><br><br>
	              <input type="IMAGE" value="제출하기" src="img/apply_rect_button.png" onclick="location.href='apply.jsp'" class = "button">
	              
              </form>
          </div>
          <div class="applyContent">
              <img src = 'img/apply/<%=imgAddress %>' class = "applyImg">
              <div class = "userInfo">
                  <p><%=student_number %> <%=name %></p>
                  <span><%=major %></span>
                  <span><%=phone_number %></span>
             </div>
             <p class = "q">지원동기</p>
             <div class = "qBox"><%=apply_reason %></div>

             <p class = "q2">목표 및 포부</p>
             <div class = "qBox2"><%=goal %></div>
          </div>
      </div>
      
   </section>
 	
 
</body>
</html>
