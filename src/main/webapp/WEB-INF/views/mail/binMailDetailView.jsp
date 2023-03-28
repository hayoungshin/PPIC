<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	table th{
		font-weight:600;
		padding:3px 0px;
		text-align:left;
	}
	table td{
		font-size:13px;
		color:gray;
	}

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
		width:65px;
		background-color:rgb(150,150,150);
		color: #fff;
		text-align: center;
		border-radius:5px;
		padding:3px 0;
		position: absolute;
		z-index: 1;
		bottom:-130%;
		left:-100%;
		opacity:0;
		transition:opacity 0.3s;
	}

	.tool-tip:hover .tooltiptext {
		visibility: visible;
		opacity: 1;
	}

	.dropdown-menu.show{
    left: -210%;
	}
</style>
</head>
<body>
	<jsp:include page="mailMenubar.jsp" />
	<script>
	document.getElementsByClassName("mail-menu")[4].className += ' selected';
    </script>


	<table style="font-size:14px;">
		<tr>
			<td colspan="6" style="font-size:18px; font-weight:600; padding:5px 0px; color:rgb(60,60,60);">
				${ m.mailTitle }
			</td>
		</tr>
		<tr>
			<th style="width:100px;">보낸 사람</th>
			<td style="width:1000px;">${ m.senderMail }</td>
		</tr>
		<tr>
			<th>받는 사람</th>
			<td>${ m.recipientMail }</td>
		</tr>
		<tr>
			<th>참조</th>
			<td>${ m.refMail }</td>
			<td style="width:120px; text-align:center;">${ m.sentDate }</td>
			<td style="width:35px; text-align:center;">
				<c:choose>
					<c:when test="${ m.importantStatus eq 'Y' }">
						<img onclick="importantStatus(this);" src="resources/icons/star-y.png" style="cursor:pointer; width:18px;">
					</c:when>
					<c:otherwise>
						<img onclick="importantStatus(this);" src="resources/icons/star.png" style="cursor:pointer; width:18px;">
					</c:otherwise>
				</c:choose>
			</td>
			<td style="width:35px; text-align:center;">
				<div class="tool-tip">
					<img src="resources/icons/bin-b.png" style="cursor:pointer; width:20px;">	
					<span class="tooltiptext" style="font-size:12px;">영구삭제</span>
				  </div>
			</td>
			<td style="width:35px; text-align:center;">
				<div class="dropdown" id="dropdown">
					<img src="resources/icons/dots.png" style="width:18px; cursor:pointer; opacity:0.7;" class="dropdown-toggle" data-toggle="dropdown">
					<div class="dropdown-menu" style="font-size:13px; padding:0; left:-120px;">
						<a class="dropdown-item" style="padding:5px 10px;" href="#">영구삭제</a>
						<c:if test="${ m.mailType ne 4 }">
							<span class="dropdown-item" id="read-status" style="padding:5px 10px;">안읽음으로표시</span>						
						</c:if>
					</div>
				</div>
			</td>
		</tr>
	</table>
	<hr>
	<c:if test="${ fn:length(list) ne 0 }">
		<div id="attachment-area">
			<div style="margin-bottom:5px; font-size:14px;">
				첨부파일 <span style="color:#6F50F8; font-weight:600;">${ fn:length(list) }</span>개 <br>
			</div>
			<c:forEach var="f" items="${ list }">
				<a href="${ f.changeName }" download="${ f.originName }">${ f.originName }</a> <br>
			</c:forEach>
		</div>
		<hr>
	</c:if>
	<div style="margin:10px 20px;">
		<c:choose>
			<c:when test="${ not empty m.mailContent }">
				${ m.mailContent }
			</c:when>
			<c:otherwise>
				<br>
				(내용없음)
			</c:otherwise>
		</c:choose>
	</div>
	
	<script>
		function importantStatus(star){
			
			if(star.src.includes("star-y")){	// 중요메일이었을 때
				$.ajax({
					url:"deleteImportant.ml",
					data:{
						mailNo:${m.mailNo},
						mailType:${m.mailType}
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
						mailNo:${m.mailNo},
						mailType:${m.mailType}
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
		
		document.getElementById("read-status").onclick = function(){
			$.ajax({
				url:"readNull.ml",
				data:{mailNo:${m.mailNo}},
				type:"post",
				success:function(){},
				error:function(){
					console.log("안읽음으로 표시용 ajax 통신 실패")
				}
			})
		}
	</script>
</body>
</html>