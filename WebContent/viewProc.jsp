<%@page import="java.sql.*"%> <%-- JDBC API 임포트 작업 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	int communication;
	int creative;
	int humor;
	int plus;
	int total;
	int student_number;
	String score_person;
%>
<%

	request.setCharacterEncoding("UTF-8"); //받아오는 값을 한글로 처리
	student_number = Integer.parseInt(request.getParameter("student_number"));
	score_person = request.getParameter("score_person");
	communication = Integer.parseInt(request.getParameter("communication"));  //
	creative = Integer.parseInt(request.getParameter("creative")); // 
	humor = Integer.parseInt(request.getParameter("humor"));    // 
	plus = Integer.parseInt(request.getParameter("plus")); // 
	total = communication + creative + humor + plus;
	Class.forName("com.mysql.jdbc.Driver"); // mysql 연동
	String url = "jdbc:mysql://localhost:3306/global?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC"; // mysql 데이터베이스명
	String id = "root";   // mysql id값
	String pw = "1234";   // mysql pw값
	
	 
	
	
	
	try{
		Connection conn = DriverManager.getConnection(url, id, pw); //실제연동시도
		
	  	String sql = "insert into score(student_number,total,score_person) values(?,?,?)"; // insert 쿼리문
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	pstmt.setInt(1, student_number);
	  	pstmt.setInt(2, total);
	  	pstmt.setString(3, score_person);
	  

	  	/*
	  	String sql = "update indexPage set main_title=?, small_title=?";
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	pstmt.setString(1, main_title);
	  	pstmt.setString(2, small_title);
	  	pstmt.executeUpdate();
	  	pstmt.close();
	  	*/
	  	pstmt.execute();
	  	pstmt.close();
	  	response.sendRedirect("view_score.jsp?student_number=" + student_number); 
	}catch(SQLException e){
	
	  out.println(e.toString());
	
	}
%>


   
	

</body>
</html>
