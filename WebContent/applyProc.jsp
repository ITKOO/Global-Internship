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
	String name;
	String student_number;
	String phone_number;
	String apply_reason;
	String goal;
%>
<%

	request.setCharacterEncoding("UTF-8"); //받아오는 값을 한글로 처리	
	Class.forName("com.mysql.jdbc.Driver"); // mysql 연동
	String url = "jdbc:mysql://localhost:3306/global?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC"; // mysql 데이터베이스명
	String id = "root";   // mysql id값
	String pw = "1234";   // mysql pw값
	
	String realFolder = ""; 
	String filename1 = ""; 
	int maxSize = 1024*1024*5; 
	String encType = "UTF-8"; 
	String savefile = "img/apply"; 
	ServletContext scontext = getServletContext(); 
	realFolder = scontext.getRealPath(savefile); 
	 
	try{ 
	MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy()); 
	name = multi.getParameter("name");    // 이름
	student_number = multi.getParameter("student_number"); // 학번
	phone_number = multi.getParameter("phone_number");    // 전번
	apply_reason = multi.getParameter("apply_reason"); // 지원동기
	goal = multi.getParameter("goal");    // 목표 및 포부
	
	Enumeration<?> files = multi.getFileNames(); 
	String file1 = (String)files.nextElement(); 
	filename1 = multi.getFilesystemName(file1); 
	} catch(Exception e) { 
	e.printStackTrace(); 
	} 
	
	String fullpath = realFolder + "\\" + filename1; 
	
	try{
		Connection conn = DriverManager.getConnection(url, id, pw); //실제연동시도
		
	  	String sql = "insert into applyPage(name,student_number,phone_number,apply_reason,goal,imgAddress) values(?,?,?,?,?,?)"; // insert 쿼리문
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	pstmt.setString(1, name);
	  	pstmt.setString(2, student_number);
	  	pstmt.setString(3, phone_number);
	  	pstmt.setString(4, apply_reason);
	  	pstmt.setString(5, goal);
	  	pstmt.setString(6, filename1);

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
	  	response.sendRedirect("index.jsp"); 
	}catch(SQLException e){
	
	  out.println(e.toString());
	
	}
%>

</body>
</html>
