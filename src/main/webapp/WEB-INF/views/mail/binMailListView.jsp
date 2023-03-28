<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="mailMenubar.jsp" />
	<script>
	document.getElementsByClassName("mail-menu")[4].className += ' selected';
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
	
						<a href="" style="margin:0px 48px;">읽음</a>
						<a href="" style="margin:0px 60px;">복구</a>
						<a href="" style="margin:0px 60px;">영구삭제</a>
						<span style="margin:0px 60px; color:gray;">│</span>
	
						<div class="dropdown" style="display:inline-block;">
							<a href="" style="margin:0px 30px" class="dropdown-toggle" data-toggle="dropdown">필터</a>
							<div class="dropdown-menu" style="font-size:13px; padding:0;">
								<a class="dropdown-item" href="#">모든메일</a>
								<a class="dropdown-item" href="#">안읽은메일</a>
								<a class="dropdown-item" href="#">중요메일</a>
								<a class="dropdown-item" href="#">나에게온메일</a>
								<a class="dropdown-item" href="#">첨부메일</a>
							</div>
						</div>
					</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="m" items="${ list }">
					<input type="hidden" id="mailType${ m.mailNo }" value="${ m.mailType }">
					<tr>
						<td style="width:30px;">
							<input type="checkbox" class="mailNo" name="mailNo" value="${ m.mailNo }">
						</td>
						<td style="width:50px;text-align:right;">
							<c:choose>
								<c:when test="${ m.importantStatus eq 'Y' }">
									<img onclick="importantStatus(this);" src="resources/icons/star-y.png" style="width:18px; margin-bottom:3px;">								
								</c:when>
								<c:otherwise>
									<img onclick="importantStatus(this);" src="resources/icons/star.png" style="width:18px; margin-bottom:3px;">								
								</c:otherwise>
							</c:choose>
						</td>
						<td style="width:70px; text-align:left;" onclick="toDetail(this);">
							<c:choose>
								<c:when test="${ not empty m.readDate || m.mailType eq 4 }">	<!-- 읽음 -->
									<img src="resources/icons/mail-opened.png" style="width:20px;">
								</c:when>
								<c:otherwise>	<!-- 안읽음 -->
									<img src="resources/icons/mail-c.png" style="width:20px;">
								</c:otherwise>
							</c:choose>
						</td>
						<td style="width:200px" onclick="toDetail(this);">
							<c:choose>
								<c:when test="${ m.mailType eq 4 }">
									<c:choose>
										<c:when test="${ fn:length(m.recipientArr) gt 1 }">
											${ m.recipientArr[0] } 외 ${ fn:length(m.recipientArr) - 1 }
										</c:when>
										<c:otherwise>
											${ m.recipientMail }
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									${ m.senderMail }
								</c:otherwise>
							</c:choose>
						</td>
						<td style="width:750px" onclick="toDetail(this);">
							<c:choose>
								<c:when test="${ m.mailType eq 4 }">
									<span style="color:rgb(200,200,200)">[보낸메일]</span> ${ m.mailTitle }
								</c:when>
								<c:otherwise>
									<span style="color:rgb(200,200,200)">[받은메일]</span> ${ m.mailTitle }
								</c:otherwise>
							</c:choose>
							<c:if test="${ m.attachmentStatus ne '0' }">
								<img src="resources/icons/clip.png" style="width:18px; margin:0px 5px;">
							</c:if>
						</td>
						<td style="width:150px; text-align:right;" onclick="toDetail(this);">${ m.sentDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<script>
			function importantStatus(star){
				const no = star.parentNode.parentNode.childNodes[1].childNodes[1].value;
				const type = document.getElementById("mailType" + no).value;
				
				if(star.src.includes("star-y")){	// 중요메일이었을 때
					$.ajax({
						url:"deleteImportant.ml",
						data:{
							mailNo:no,
							mailType:type
						},
						type:"post",
						success:function(result){
							if(result > 0){
								star.src = "resources/icons/star.png";
							} else {
								alert("중요메일 해제 실패");
							}
						}, error:function(){
							console.log("중요메일 해제용 ajax 통신실패")
						}
					})
				} else {	// 중요메일이 아니었을 때
					$.ajax({
						url:"updateImportant.ml",
						data:{
							mailNo:no,
							mailType:type
						},
						type:"post",
						success:function(result){
							if(result > 0){
								star.src = "resources/icons/star-y.png";
							} else {
								alert("중요메일 등록 실패");
							}
						}, error:function(){
							console.log("중요메일 해제용 ajax 통신실패")
						}
					})
				}
				
			}
		</script>
	
		<script>
			function toDetail(e){
				const mailNo = e.parentNode.childNodes[1].childNodes[1].value;
				location.href = "binDetail.ml?no=" + mailNo + "&type=" + document.getElementById("mailType" + mailNo).value;
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