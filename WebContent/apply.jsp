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
    	.applyForm{
    	margin-top:80px;
    		text-align: center;
    		
    	}
    	
    	.inputBox{
    	
    		border-style: none;
    		width:410px;
    		height:30px;
    		background-color: #f2f2f2;
    		margin-right: 50px;
    	
    	}
    	
    	.inputArea{
    		border-style: none;
    		width:450px;
    		height:150px;
    		background-color: #f2f2f2;
    	
    	}
    	
    	.button{
    		float: right;
    		margin-right: 650px;
    	}
    	
    </style>
</head>
<body>
 <jsp:include page="menubar_apply.jsp" flush="false"/>

	<form name="applyForm"  enctype="multipart/form-data" method="post" action="applyProc.jsp" class = "applyForm">
		<label for= "name">이름&nbsp;&nbsp;</label> 
		<input type="text" id = "name" name = "name" class = "inputBox"><input type="file" name="filename1" size=40><br><br>
		<label for= "student_number">학번&nbsp;&nbsp; </label>	
		<input type="text" id = "student_number" name = "student_number"  class = "inputBox">
		<label for= "phone_number">전화번호&nbsp;&nbsp; </label>
		<input type="text" id = "phone_number" name = "phone_number"  class = "inputBox"><br><br>
		<label for= "apply_reason">지원동기&nbsp;&nbsp;</label>
		<textarea  id = "apply_reason" name = "apply_reason"  class = "inputArea"></textarea>
		<label for= "goal">목표 및 포부&nbsp;&nbsp;</label>
		<textarea  id = "goal" name = "goal"  class = "inputArea"></textarea><br><br>
		<input type="IMAGE" value="제출하기" src = "img/submitBtn.png" class = "button">
 	</form>	


</body>
</html>
