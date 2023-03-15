<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#address-search-area{
		position:relative;
		display:inline-block;
	}
	#address-search-btn{
		position:absolute;
		right:0;
		width:50px; height:24px;
		padding:0px 5px;
		background:none;
		border:none;
	}
	
	#address-area{width:100%; height:650px;}
	#address-area span{display: inline-block;}
	#address-header{
		height:5%;
		background:rgb(230,230,230);
	}
	#address-group{
		border-right:1.5px solid rgb(230,230,230);
		width:15%; height:95%;
		padding:70px 20px 0px;
		float:left;
	}
	#address-group>div{margin-bottom:20px;}
	#address-group img{
		width:18px;
		margin-bottom:5px;
		margin-right:10px;
	}
	#address-group p{margin:10px 0px 0px 40px; font-size:15px;}
	#address-group>.div:hover, #address-group p:hover{cursor:pointer; font-weight:600;}

	#address-list-area{
		float:left;
		height:95%; width:85%;
		padding:20px;
		overflow:auto;
	}
</style>
</head>
<body>
    <jsp:include page="../common/menubar.jsp" />
	<div class="outer">
		<div id="content">
            <div>
                <img src="resources/icons/left-arrow.png" width="30px" style="vertical-align:bottom; margin-right:10px; cursor:pointer;">
                <h2 style="display:inline-block; margin:0;"><b>주소록</b></h2>
            </div>
            <br><br>
            
            <div id="address-search-area" style="font-size:15px;">
				<form action="">
					<input type="text" placeholder="주소록 검색" style="width:300px; border-radius:5px; border:1px solid gray; padding-left:10px;">
					<button id="address-search-btn">
						<img src="resources/icons/search-g.png" style="width:20px;">
					</button>
				</form>
			</div>
			<br><br>

			<div id="address-area">
				<div id="address-header">
					<span style="height:100%; margin-left:250px; padding:5px; width:70px;">
						이름
					</span>
					<span style="height:100%; margin-left:275px; padding:5px; width:70px;">
						부서
					</span>
					<span style="height:100%; margin-left:80px; padding:5px; width:70px;">
						직급
					</span>
					<span style="height:100%; margin-left:80px; padding:5px; width:150px;">
						전화번호
					</span>
				</div>
				<div id="address-group">
					<div class="div"><img src="resources/icons/addressBook.png">전체주소</div>
					<div>
						<p>└&nbsp&nbsp미지정</p>
						<p>└&nbsp&nbsp인사부</p>
						<p>└&nbsp&nbsp인사부</p>
						<p>└&nbsp&nbsp인사부</p>
						<p>└&nbsp&nbsp인사부</p>
					</div>
					<div class="div" style="margin-top:30px;"><img src="resources/icons/star-y.png">즐겨찾기</div>
				</div>
				<div id="address-list-area">
					<p>
						<img src="resources/icons/star-y.png" width="15px;" style="margin-bottom:5px;">
						<span style="width:100px; padding-left:10px; font-weight:600;">신하영</span>
						<span style="width:250px;">shin@ppic.kr</span>
						<span style="width:150px;">인사부</span>
						<span style="width:150px;">과장</span>
						<span>01011112222</span>
					</p>
				</div>
			</div>
			

        </div>
    </div>

</body>
</html>