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

	 <object type="application/pdf" data="pdf/global_document.pdf" width="100%" height="1000" style = "margin-top:-10px;">
                    <param name="src" value="pdf/global_document.pdf">
                </object>

</body>
</html>
