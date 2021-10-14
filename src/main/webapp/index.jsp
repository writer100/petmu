<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>PETMU</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/petcss.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/resources/css/header.css" />
<!-- 타이틀 로고 -->
<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/resources/images/petmu.ico" /> 
</head>


<body>

	<%@ include file="/views/common/header.jsp"%>

	<div id="best">
		<div class="bestboard">
			<img class="bestphoto"
				src="<%=request.getContextPath()%>/resources/images/dog.jpg">
		</div>
		<div class="bestboard">
			<img class="bestphoto"
				src="<%=request.getContextPath()%>/resources/images/dogcat.jpg">
		</div>
	</div>

	<h1 align="center">FOCUS ON</h1>

	<div class="container">
		<div class="item1">
			<img id="modal_btn1"
				src="<%=request.getContextPath()%>/resources/images/know1.png">
		</div>
		<div class="item2">
			<img id="modal_btn2"
				src="<%=request.getContextPath()%>/resources/images/know2.png">
		</div>
		<div class="item3">
			<img id="modal_btn3"
				src="<%=request.getContextPath()%>/resources/images/know3.png">
		</div>
	</div>
	<div class="black_bg"></div>
	<!-- 모달창 띄워질때 뒤 배경 -->
	<div class="modal_wrap">
		<div class="modal_close">
			<a href="#">close</a>
		</div>
		<div>
			<img
				src="<%=request.getContextPath()%>/resources/images/introImg2.png">
		</div>
	</div>

	<div class="modal_wrap">
		<div class="modal_close">
			<a href="#">close</a>
		</div>
		<div>
			<img
				src="<%=request.getContextPath()%>/resources/images/introImg2.png">
		</div>
	</div>

	<div class="modal_wrap">
		<div class="modal_close">
			<a href="#">close</a>
		</div>
		<div>
			<img
				src="<%=request.getContextPath()%>/resources/images/introImg2.png">
		</div>
	</div>
</body>
<script>
	window.onload = function() {

		function onClick() {
			document.querySelector('.modal_wrap').style.display = 'block';
			document.querySelector('.black_bg').style.display = 'block';
		}
		function offClick() {
			document.querySelector('.modal_wrap').style.display = 'none';
			document.querySelector('.black_bg').style.display = 'none';
		}

		document.getElementById('modal_btn1').addEventListener('click', onClick);
		document.querySelector('.modal_close').addEventListener('click',
				offClick);
		
		document.getElementById('modal_btn2').addEventListener('click', onClick);
		document.querySelector('.modal_close').addEventListener('click',
				offClick);
		
		document.getElementById('modal_btn3').addEventListener('click', onClick);
		document.querySelector('.modal_close').addEventListener('click',
				offClick);

	};

	
</script>

<br><br><br><br>

<%@ include file="/views/common/footer.jsp"%>

</html>