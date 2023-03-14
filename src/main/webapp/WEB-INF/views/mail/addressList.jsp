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

			<table border="1">
				<tr>
					<td></td>
					<td></td>
					<td>이름</td>
					<td></td>
					<td>부서</td>
					<td>직급</td>
					<td>전화번호</td>
				</tr>
				<tr>
					<td>
						<div>전체주소</div>
						<div>
							<p>인사부</p>
							<p>인사부</p>
							<p>인사부</p>
							<p>인사부</p>
							<p>인사부</p>
							<p>미지정</p>
						</div>
						<div>즐겨찾기</div>
					</td>
					<td>
						<img src="resources/icons/star.png" width="18px">
					</td>
					<td>
						신하영
					</td>
					<td>
						shin@ppic.kr
					</td>
					<td>
						인사
					</td>
					<td>
						과장
					</td>
					<td>
						01011112222
					</td>
				</tr>
			</table>

        </div>
    </div>

</body>
</html>