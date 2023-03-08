<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#attachment-area{
		padding:7px 10px;
		font-size:13px;
	}
	#attachment-area img{
		width:18px;
		margin-right:5px;
		margin-bottom:3px;
	}
	#attachment-area a{
		color: rgb(150,150,150);
		text-decoration:none;
	}
	#attachment-area a:hover{font-weight:600;}



	.tool-tip {
		position: relative;
		display: inline-block;
	}

	.tool-tip .tooltiptext {
		visibility: hidden;
		width:40px;
		background-color:rgb(150,150,150);
		color: #fff;
		text-align: center;
		border-radius:5px;
		padding:3px 0;
		position: absolute;
		z-index: 1;
		bottom:-130%;
		left:-50%;
		opacity:0;
		transition:opacity 0.3s;
	}

	.tool-tip:hover .tooltiptext {
		visibility: visible;
		opacity: 1;
	}


</style>
</head>
<body>
	<jsp:include page="mailMenubar.jsp" />
	
	<div class="tooltip">Hover over me
		<span class="tooltiptext" style="font-size:12px;">답장</span>
	</div>


	<table border="1" style="font-size:14px;">
		<tr>
			<td colspan="6" style="font-size:18px;">
				메일제목입니다 안녕하세요안녕하세여~~~~
			</td>
		</tr>
		<tr>
			<td style="width:100px;">보낸 사람</td>
			<td style="width:900px;" style="color:gray;">박사원</td>
		</tr>
		<tr>
			<td>받는 사람</td>
			<td>나, 이이름, 박이름 에게</td>
		</tr>
		<tr>
			<td>참조</td>
			<td>최뭐뭐</td>
			<td>23-03-08 11:50</td>
			<td>
				<img src="resources/icons/star.png" style="cursor:pointer; width:18px;">
			</td>
			<td>
				<div class="tool-tip">
					<img src="resources/icons/reply.png" style="cursor:pointer; width:20px;">	
					<span class="tooltiptext" style="font-size:12px;">답장</span>
				  </div>
			</td>
			<td>
				<img src="resources/icons/dots.png" style="width:18px; cursor:pointer; opacity:0.7;">
			</td>
		</tr>
	</table>
	<hr>
	<div id="attachment-area">
		<div style="margin-bottom:5px; font-size:15px;">
			첨부파일 <span style="color:#6F50F8; font-weight:600;">2</span>개 <br>
		</div>
		<a href="변경이름" download="원본이름"><img src="resources/icons_files/pdf.png">원본이름</a> <div></div>
		<a href="변경이름" download="원본이름"><img src="resources/icons_files/xls.png">원본이름</a>
	</div>
	<hr>
	<div style="margin:10px 20px;">
		안녕하세요<br>
		어떤팀 신하영입니다.<br><br>
		안녕히계세요.
	</div>

	

</body>
</html>