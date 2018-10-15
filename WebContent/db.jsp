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
    String driverName="com.mysql.cj.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/global?characterEncoding=UTF-8&serverTimezone=UTC";
    String id = "root";
    String pwd ="1234";
   
    try{
        //[1] JDBC 드라이버 로드
        Class.forName(driverName);     
    }catch(ClassNotFoundException e){
    	System.out.println("Where is your mysql jdbc driver?");
        e.printStackTrace();
        return;
    }
    System.out.println("mysql jdbc Driver registered!!");
   
    //[2]데이타베이스 연결 
    Connection conn = DriverManager.getConnection(url,id,pwd);
    System.out.println("DB연결성공!!");
     
    //[3]데이타베이스 연결 해제
    conn.close();
%>
</body>
</html>
