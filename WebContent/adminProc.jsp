<%@page import="java.sql.*"%> <%-- JDBC API 임포트 작업 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	request.setCharacterEncoding("UTF-8"); //받아오는 값을 한글로 처리	
	Class.forName("com.mysql.jdbc.Driver"); // mysql 연동
	String url = "jdbc:mysql://localhost:3306/global?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC"; // mysql 데이터베이스명
	String id = "root";   // mysql id값
	String pw = "1234";   // mysql pw값
	String main_title = request.getParameter("main_title");    // 넘어온 글제목 값 저장
	String small_title = request.getParameter("small_title"); // 넘어온 글내용 값 저장
	
	try{
		Connection conn = DriverManager.getConnection(url, id, pw); //실제연동시도
		/*
	  	String sql = "insert into indexPage(main_title, small_title) values(?,?)"; // insert 쿼리문
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	pstmt.setString(1, main_title);
	  	pstmt.setString(2, small_title);*/
	  	String sql = "update indexPage set main_title=?, small_title=?";
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	pstmt.setString(1, main_title);
	  	pstmt.setString(2, small_title);
	  	pstmt.executeUpdate();
	  	pstmt.close();
	  	
	  	/*
	  	String sql = "select * from indexPage;";
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	ResultSet rs=ps.executeQuery();
	  	while(rs.next()){
	  		String main_title = request.getParameter("main_title"); 
	  		String small_title = request.getParameter("small_title");
	  		pstmt.close();
	  	}*/
	  	
	  	
	  	response.sendRedirect("index.jsp"); 
	}catch(SQLException e){
	
	  out.println(e.toString());
	
	}
%>

</body>
</html>
