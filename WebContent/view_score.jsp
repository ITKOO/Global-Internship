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
    	
    	table, td, th {    
		    border: 1px solid #ddd;
		    text-align: left;
		}
		
		table {
		
		    border-collapse: collapse;
		    width: 250px;
		    background-color: #fff;
		}
		
		th, td {
			width:100%;
		    padding: 15px;
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
  	 String score_person;
  	 int total;
  	 int allTotal;
  	 int count = 0;
  	 float result;
   %>
  
   
   <section class = "viewDetail">
   <!-- 상단  메뉴바 -->
   <jsp:include page="menubar.jsp" flush="false"/>
       

      <div class="detail">
          <div class="scoreContent">
          	  <form method = "post" action = "viewProc.jsp?student_number=<%=student_number%>">
	              <div class = "info">점수</div>
	              <table style = "margin-top:40px;margin-left:20px;display: inline-block;">
					  <tr>
					    <th>채점자</th>
					    <th>점수</th>
					  </tr>
					  
					   <% 
   
   		
   		student_number = Integer.parseInt(request.getParameter("student_number"));
   		
   		request.setCharacterEncoding("UTF-8"); //받아오는 값을 한글로 처리	
   		Class.forName("com.mysql.jdbc.Driver"); // mysql 연동
   		String url = "jdbc:mysql://localhost:3306/global?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC"; // mysql 데이터베이스명
   		String id = "root";   // mysql id값
   		String pw = "1234";   // mysql pw값
   		
   		
   		try{
   			Connection conn = DriverManager.getConnection(url, id, pw); //실제연동시도
   		  	String sql = "select * from applyPage where student_number = " + student_number + ";";
   		  	PreparedStatement pstmt = conn.prepareStatement(sql);
   		 	String sql2 = "select * from score where student_number = " + student_number + ";";
   		 	PreparedStatement pstmt2 = conn.prepareStatement(sql2);
   		  	ResultSet rs=pstmt.executeQuery();
   		 	ResultSet rs2=pstmt2.executeQuery();
   		  	while(rs.next()){
	   		 	name = rs.getString("name");
	   		 	phone_number = rs.getString("phone_number");
	   		 	apply_reason = rs.getString("apply_reason");
	   			goal = rs.getString("goal");
	   			imgAddress = rs.getString("imgAddress");
   		  	}
   		  	
   		  	while(rs2.next()){
	   		 	score_person = rs2.getString("score_person");
	   		 	total = rs2.getInt("total");
	   		 	System.out.println(score_person);
	   		 	System.out.println(total);
	   		 	out.println("<tr><td>" +score_person + "</td>" + "<td>"+ total +"&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>");
	   		 	allTotal = allTotal + total;
	   		 	System.out.println("으악!" + allTotal);
	   		    System.out.println("전 카운트" + count);
	   		 	count++;
	   		 	System.out.println("전 카운트" + count);
   		  	}
   		  	
   		 pstmt.execute();
 	  	 pstmt.close();
 	  	 
 	  	 pstmt2.execute();
	  	 pstmt2.close();
   		  
   		}catch(SQLException e){
   		
   		  out.println(e.toString());
   		
   		}
   		if(count == 1)
   		{
   			result = total;
   		}
   		
   		else{
   			result = (float)allTotal/count;
   		}
   		
   
   %>
					
					 <tr>
					    <td>총점</td>
					    <td><%=result %></td>
					    
					 <%result = 0; %>
					  </tr> 
				</table>
	              
              </form>
          </div>
          <div class="applyContent">
              <img src = 'img/apply/<%=imgAddress %>' class = "applyImg">
              <div class = "userInfo">
                  <p><%=student_number %> <%=name %></p>
                  <span>뉴미디어솔루션과</span>
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
