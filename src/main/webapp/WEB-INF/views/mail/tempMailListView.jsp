<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="mailMenubar.jsp" />
	<script>
	document.getElementsByClassName("mail-menu")[3].className += ' selected';
    </script>
	
	<!-- 리스트 -->
	<div align="center">
		<table class="table" style="margin-top:30px;">
			<thead>
				<tr id="table-head">
					<td colspan="6" style="width:30px;">
	
						<input type="checkbox" name="" id="">
	
						<div class="dropdown" style="display:inline-block;">
							<button style="margin:0px; padding:0; background:none;" class="dropdown-toggle" data-toggle="dropdown"></button>
							<div class="dropdown-menu" style="font-size:13px; padding:0;">
								<a class="dropdown-item" href="#">전체선택</a>
								<a class="dropdown-item" href="#">읽은메일</a>
								<a class="dropdown-item" href="#">읽지않은메일</a>
								<a class="dropdown-item" href="#">중요메일</a>
								<a class="dropdown-item" href="#">중요표시안한메일</a>
								<a class="dropdown-item" href="#">선택해제</a>
							</div>
						</div>
	
						<a href="" style="margin:0px 48px;">삭제</a>
						<a href="" style="margin:0px 60px;">영구삭제</a>
						<span style="margin:0px 60px; color:gray;">│</span>
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width:30px;">
						<input type="checkbox" name="" id="">
					</td>
					<td style="width:50px;text-align:right;">
						<img src="resources/icons/star.png" style="width:18px; margin-bottom:3px;">
					</td>
					<td style="width:70px; text-align:left;" onclick="toDetail();">
						<img src="resources/icons/mail-c.png" style="width:20px;">
					</td>
					<td style="width:200px" onclick="toDetail();">shin@ppic.kr</td>
					<td style="width:750px" onclick="toDetail();">제목제목 나는 제목~~~ 여기는 제목자리~~~</td>
					<td style="width:150px; text-align:right;" onclick="toDetail();">2023.02.21 15:10</td>
				</tr>
				<tr>
					<td style="width:30px;">
						<input type="checkbox" name="" id="">
					</td>
					<td style="width:50px;text-align:right;">
						<img src="resources/icons/star-y.png" style="width:18px; margin-bottom:3px;">
					</td>
					<td style="width:70px; text-align:left;">
						<img src="resources/icons/mail-opened.png" style="width:20px;">
					</td>
					<td style="width:200px">shin@ppic.kr</td>
					<td style="width:750px">제목제목 나는 제목~~~ 여기는 제목자리~~~</td>
					<td style="width:150px; text-align:right;">2023.02.21 15:10</td>
				</tr>
				<tr>
					<td style="width:30px;">
						<input type="checkbox" name="" id="">
					</td>
					<td style="width:50px;text-align:right;">
						<img src="resources/icons/star-y.png" style="width:18px; margin-bottom:3px;">
					</td>
					<td style="width:70px; text-align:left;">
						<img src="resources/icons/mail-opened.png" style="width:20px;">
					</td>
					<td style="width:200px">shin@ppic.kr</td>
					<td style="width:770px">
						제목제목 나는 제목~~~ 여기는 제목자리~~~
						<img src="resources/icons/clip.png" style="width:18px; margin:0px 5px;">
					</td>
					<td style="width:130px; text-align:right;">2023.02.21 15:10</td>
				</tr>
				<tr>
					<td style="width:30px;">
						<input type="checkbox" name="" id="">
					</td>
					<td style="width:50px;text-align:right;">
						<img src="resources/icons/star.png" style="width:18px; margin-bottom:3px;">
					</td>
					<td style="width:70px; text-align:left;">
						<img src="resources/icons/mail-c.png" style="width:20px;">
					</td>
					<td style="width:200px">shin@ppic.kr</td>
					<td style="width:750px">제목제목 나는 제목~~~ 여기는 제목자리~~~</td>
					<td style="width:150px; text-align:right;">2023.02.21 15:10</td>
				</tr>
				<tr>
					<td style="width:30px;">
						<input type="checkbox" name="" id="">
					</td>
					<td style="width:50px;text-align:right;">
						<img src="resources/icons/star.png" style="width:18px; margin-bottom:3px;">
					</td>
					<td style="width:70px; text-align:left;">
						<img src="resources/icons/mail-c.png" style="width:20px;">
					</td>
					<td style="width:200px">shin@ppic.kr</td>
					<td style="width:750px">제목제목 나는 제목~~~ 여기는 제목자리~~~</td>
					<td style="width:150px; text-align:right;">2023.02.21 15:10</td>
				</tr>
			</tbody>
		</table>

	
		<script>
			function toDetail(){
				location.href = "tempForm.ml";
			}
		</script>
	
		<br>

		<div id="paging">
			<ul>
				<li><a href="#"><</a></li>
				<li><a href="#">1</a></li>
				<li class="active"><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">></a></li>
			</ul>
		</div>
	</div>
	

</body>
</html>