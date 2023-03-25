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
	document.getElementsByClassName("mail-menu")[1].className += ' selected';
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
						<a href="" style="margin:0px 60px;">다시보내기</a>
						<span style="margin:0px 60px; color:gray;">│</span>
	
						<div class="dropdown" style="display:inline-block;">
							<a href="" style="margin:0px 30px 0px 60px;" class="dropdown-toggle" data-toggle="dropdown">이동</a>
							<div class="dropdown-menu" style="font-size:13px; padding:0;">
								<a class="dropdown-item" href="#">받은메일함</a>
								<a class="dropdown-item" href="#">보낸메일함</a>
								<a class="dropdown-item" href="#">중요메일함</a>
								<a class="dropdown-item" href="#">휴지통</a>
							</div>
						</div>
	
						<div class="dropdown" style="display:inline-block;">
							<a href="" style="margin:0px 30px" class="dropdown-toggle" data-toggle="dropdown">필터</a>
							<div class="dropdown-menu" style="font-size:13px; padding:0;">
								<a class="dropdown-item" href="#">모든메일</a>
								<a class="dropdown-item" href="#">안읽은메일</a>
								<a class="dropdown-item" href="#">중요메일</a>
								<a class="dropdown-item" href="#">첨부메일</a>
							</div>
						</div>
					</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var='m' items="${ list }">
					<tr>
						<td style="width:30px;">
							<input type="checkbox" class="mailNo" name="mailNo" value="${ m.mailNo }">
						</td>
						<td style="width:50px;text-align:right;">
							<c:choose>
								<c:when test="${ m.importantStatus eq 'Y' }">
									<img src="resources/icons/star-y.png" style="width:18px; margin-bottom:3px;">								
								</c:when>
								<c:otherwise>
									<img src="resources/icons/star.png" style="width:18px; margin-bottom:3px;">								
								</c:otherwise>
							</c:choose>
						</td>
						<td style="width:70px; text-align:left;" onclick="toDetail(this);">
							<img src="resources/icons/mail-opened.png" style="width:20px;">
						</td>
						<td style="width:200px" onclick="toDetail(this);">
							<c:choose>
								<c:when test="${ fn:length(m.recipientArr) gt 1 }">
									${ m.recipientArr[0] } 외 ${ fn:length(m.recipientArr) - 1 }
								</c:when>
								<c:otherwise>
									${ m.recipientMail }
								</c:otherwise>
							</c:choose>
						</td>
						<td style="width:750px" onclick="toDetail(this);">
							${ m.mailTitle }
							<c:if test="${ m.attachmentStatus ne '0' }">
								<img src="resources/icons/clip.png" style="width:18px; margin:0px 5px;">
							</c:if>
						</td>
						<td style="width:150px; text-align:right;" onclick="toDetail();">${ m.sentDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	
		<script>
			function toDetail(e){
				location.href = "sendDetail.ml?no=" + e.parentNode.childNodes[1].childNodes[1].value;
			}
		</script>
	
		<br>

		<div id="paging">
	       	<ul>
          		<c:if test="${ pi.currentPage ne 1 }">
              		<li><a href="recieveList.ml?cpage=${ pi.currentPage - 1 } "><</a></li>
              	</c:if>
	            
	            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	            	<c:choose>
	            		<c:when test="${ pi.currentPage eq p }">
	            			<c:choose>
			            		<c:when test="${ empty condition }">
				            		<li class="active"><a href="recieveList.ml?cpage=${ p }">${ p }</a></li>
				            	</c:when>
				            	<c:otherwise>
				            		<!-- 수정할 것 -->
				            		<li class="active"><a href="search.ml?cpage=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
				            	</c:otherwise>
	            			</c:choose>
	            		</c:when>
	            		<c:otherwise>
	            			<c:choose>
			            		<c:when test="${ empty condition }">
				            		<li><a href="recieveList.ml?cpage=${ p }">${ p }</a></li>
				            	</c:when>
				            	<c:otherwise>
				            		<!-- 수정할 것 -->
				            		<li><a href="search.ml?cpage=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
				            	</c:otherwise>
			            	</c:choose>
	            		</c:otherwise>
	            	</c:choose>
				</c:forEach>
				
				<c:if test="${ pi.currentPage ne pi.maxPage }">
	            	<li><a href="recieveList.ml?cpage=${ pi.currentPage + 1 }">></a></li>
				</c:if>
           </ul>
        </div>
	</div>
    

</body>
</html>