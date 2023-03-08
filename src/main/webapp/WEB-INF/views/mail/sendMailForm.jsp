<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 테이블 줄 높이 지정 */
	#mail-send-form tr{
		height:40px;
	}
	.reciever-list input{
		width:900px; height:30px;
		border: 1px solid rgb(200,200,200);
		border-radius:5px;
	}
	.reciever-name{
		border:none;
		border-radius:10px;
		background:#FFCECE;
	}
	.reciever-name:hover{
		background:#f6c1c1;
		font-weight:500;
		color: rgb(60, 60, 60);
	}
	
	/* 주소록 버튼 */
	.reciever-list{
		position:relative;
	}
	#address-btn {
		position:absolute;
		cursor:pointer;
		height:23px;
		margin:3px 5px;
		font-size:12px;
		right:0;
		border:1px solid rgb(230,230,230);
		background:none;
	}
	#address-btn:hover{
		background:rgb(230,230,230);
	}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="outer">
		<div id="content">
		
		<div style="display:inline-block; margin-bottom:40px;">
			<span style="font-size:30px;">메일</span>
		</div>

		<form action="" style="padding:0px 20px;">

			<button class="btn-purple" style="font-size:13px; padding:3px 10px; margin:0 5px;">보내기</button>
			<button type="button" style="font-size:13px; padding:3px 10px;  margin:0 5px;">임시저장</button>
			<button type="button" style="font-size:13px; padding:3px 10px;  margin:0 5px;">미리보기</button>

			<table border="1" style="margin:20px 0; font-size:14px;" id="mail-send-form">
				<tr>
					<th colspan="2" style="width:150px;">받는사람</th>
					<td class="reciever-list">
						<button class="reciever-name">
							신하영 &ltuser01@ppic.kr&gt
							<img src="resources/icons/close.png" style="width:7px; margin-bottom:3px;">
						</button>
						<input type="text">
						<button id="address-btn">주소록</button>
					</td>
				</tr>
				<tr>
					<th>참조</th>
					<td></td>
					<td class="reciever-list">
						<button class="reciever-name">
							신하영 &ltuser01@ppic.kr&gt
							<img src="resources/icons/close.png" style="width:7px; margin-bottom:3px;">
						</button>
						<input type="text">
						<button id="address-btn">주소록</button>
					</td>
				</tr>
				<tr>
					<th colspan="2">숨은참조</th>
					<td class="reciever-list">
						<button class="reciever-name">
							신하영 &ltuser01@ppic.kr&gt
							<img src="resources/icons/close.png" style="width:7px; margin-bottom:3px;">
						</button>
						<input type="text">
						<button id="address-btn">주소록</button>
					</td>
				</tr>
				<tr>
					<th>참조</th>
					<td></td>
					<td class="reciever-list">
						<button class="reciever-name">
							신하영 &ltuser01@ppic.kr&gt
							<img src="resources/icons/close.png" style="width:7px; margin-bottom:3px;">
						</button>
						<input type="text">
						<button id="address-btn">주소록</button>
					</td>
				</tr>
			</table>

			<script>

			</script>



		</form>
		
		</div>
	</div>

</body>
</html>