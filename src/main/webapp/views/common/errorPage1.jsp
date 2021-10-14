<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%
	String msg = (String)request.getAttribute("error-msg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR</title>
<!-- fontawesome 아이콘cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" /> 
	<style>
		section {
			width : 600px;
			padding : 20px;
			background : white;
			margin-left : auto;
			margin-right: auto;
			margin-top:30px;
		}
		
		i {
			font-size : 30px;
			color : orange;
		}
		
		a {
			text-decoration: none;
			color : blue;
			font-size : 25px;
		}
	</style>
</head>
<body>

	<section>
		<h1>서비스 에러 발생!</h1>
		<h3 style="color : red;"> ERROR :: <%= msg %> </h3>
		<p>
		서비스 수행 중 에러가 발생하였습니다.<br>
		해당 페이지가 계속 보인다면, 담당자에게 문의 하세요.<br>
		<br>
		<a href="index.jsp"><i class="fas fa-home"></i> 메인화면으로 돌아가기</a>
		
		</p>
	</section>

</body>
</html>