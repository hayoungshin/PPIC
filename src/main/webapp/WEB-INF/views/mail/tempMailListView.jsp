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
	document.getElementsByClassName("mail-menu")[3].className += ' selected';
    </script>
	
	<!-- 리스트 -->
	<div align="center">
		<table class="table" style="margin-top:30px;">
			<thead>
				<tr id="table-head">
					<td colspan="6" style="width:30px;">
	
						<input type="checkbox" id="check-all" onclick="checkAll(this);">
						
						<a href="" style="margin:0px 60px;">영구삭제</a>
						<span style="margin:0px 60px; color:gray;">│</span>
					</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="m" items="${ list }">
					<tr>
						<td style="width:30px;">
							<input type="checkbox" class="mailNo" name="mailNo" value="${ m.mailNo }" onclick="boxchecked();">
						</td>
						<td style="width:50px;text-align:right;">
							<img onclick="importantStatus(this);" class="important-status" src="resources/icons/star.png" style="width:18px; margin-bottom:3px;">
						</td>
						<td style="width:70px; text-align:left;" onclick="toDetail();">
							<img src="resources/icons/mail-opened.png" style="width:20px;">
						</td>
						<td style="width:200px" onclick="toDetail(this);">
							<c:choose>
								<c:when test="${ fn:length(m.recipientArr) gt 1 }">
									${ m.recipientArr[0] } 외 ${ fn:length(m.recipientArr) - 1 }
								</c:when>
								<c:when test="${ fn:length(m.recipientArr) eq 1 }">
									${ m.recipientMail }								
								</c:when>
								<c:otherwise>
									(받는이없음)
								</c:otherwise>
							</c:choose>
						</td>
						<td style="width:750px" onclick="toDetail(this);">
							${ m.mailTitle }
						</td>
						<td style="width:150px; text-align:right;" onclick="toDetail(this);">${ m.sentDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		
		<!-- 체크박스 -->
		<script>
			function checkAll(all){
				const list = document.getElementsByClassName("mailNo");
				if(all.checked){
					document.querySelectorAll(".mailNo").forEach(function(c){
						c.checked = true;
					})
				} else {
					document.querySelectorAll(".mailNo").forEach(function(c){
						c.checked = false;
					})
				}
			}
			function boxchecked(){
				let checkedCount = 0;
				document.querySelectorAll(".mailNo").forEach(function(c){
					if(c.checked == false){
						checkedCount++;
					}
				});
				if(checkedCount > 0){
					document.getElementById("check-all").checked = false;
				} else if(checkedCount == 0) {
					document.getElementById("check-all").checked = true;
				}
			}
		</script>
	
		<script>
			function toDetail(e){
				location.href = "tempForm.ml?no=" + e.parentNode.childNodes[1].childNodes[1].value;;
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