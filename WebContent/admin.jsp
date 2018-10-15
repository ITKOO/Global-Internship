<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 
 <!-- 상단  메뉴바 -->
   <jsp:include page="menubar.jsp" flush="false"/>
    <form name="form1" method="post" action="adminProc.jsp">
        <table>
            <tr>
                <td>큰 제목</td>
                <td><input type="text" name ="main_title" id="main_title"></td>
            </tr>
            <tr>
                <td>소 제목</td>
                <td><input type="text" name ="small_title" id="small_title"></td>
            </tr>
            
            <tr>
                <td><input type="submit" value="적용하기"></td>
           </tr>          
        </table>       
    </form>
    
    
</body>
</html>
