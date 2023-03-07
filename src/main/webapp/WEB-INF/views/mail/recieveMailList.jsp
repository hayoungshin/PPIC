<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#mail-menu div{
		display:inline-block;
		margin: 0px 20px;
		font-size: 20px;
		color: gray;
	}
	#mail-menu div:hover{
		cursor:pointer;
		color: rgb(60,60,60);
		font-weight:600;
	}
	#mail-search-area{
		position:relative;
	}
	#mail-search-btn{
		position:absolute;
		top:0; bottom:0; right:52px;
		width:50px; height:24px;
		padding:0px 5px;
		margin-top:1px;
		background:none;
		border:none;
	}
	#detail-modal-btn{
		position:absolute;
		top:0; bottom:0; right:0px;
		background:none;
		color:gray;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="outer">
		<div id="content">
		
			<div style="display:inline-block;">
				<span style="font-size:30px;">메일</span>
			</div>
			<div style="display:inline-block;">
				<a href="">
					<img src="resources/icons/addressBook.png" style="width:30px; margin-left:20px; vertical-align:bottom">
				</a>
			</div>
		    <div style="display:inline-block; margin-left: 1000px;">
		        <button class="btn-purple" style="width:200px; height:40px">메일쓰기</button>
		    </div>

			<br><br><br>

			<div id="mail-menu">
				<div style="margin-left:0; color:rgb(60,60,60); font-weight: 600;">
					받은메일
					<span style="color:#6F50F8;">12</span>
				</div>
				<div>보낸메일</div>
				<div>중요메일</div>
				<div>임시보관함</div>
				<div>휴지통</div>
				<div id="mail-search-area" style="font-size:15px; margin-left:400px;">
					<form action="">
						<input type="text" placeholder="메일검색" style="width:300px; border-radius:5px; border:1px solid gray; padding-left:10px;">
						<button id="mail-search-btn">
							<img src="resources/icons/search-gray.png" style="width:20px;">
						</button>
						<button id="detail-modal-btn" type="button">
							│ 상세
						</button>
					</form>
				</div>
			</div>
			
			
		</div>
	</div>

</body>
</html>