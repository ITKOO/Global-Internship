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
<%! String journalText; %>
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
	String savefile = "img/journal"; 
	ServletContext scontext = getServletContext(); 
	realFolder = scontext.getRealPath(savefile); 
	 
	try{ 
	MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy()); 
	journalText = multi.getParameter("journalText");
	Enumeration<?> files = multi.getFileNames(); 
	String file1 = (String)files.nextElement(); 
	filename1 = multi.getFilesystemName(file1); 
	} catch(Exception e) { 
	e.printStackTrace(); 
	} 
	
	String fullpath = realFolder + "\\" + filename1; 
	
	try{
		Connection conn = DriverManager.getConnection(url, id, pw); //실제연동시도
		
	  	String sql = "insert into journalPage(imgAddress,journalText) values(?,?)"; // insert 쿼리문
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	pstmt.setString(1, filename1);
	  	pstmt.setString(2, journalText);

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
	  	response.sendRedirect("journal.jsp"); 
	}catch(SQLException e){
	
	  out.println(e.toString());
	
	}
%>

</body>
</html>
