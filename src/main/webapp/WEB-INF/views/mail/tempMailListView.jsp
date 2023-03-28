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
	#table-head span:hover{
		cursor:pointer;
		font-weight:600;
	}
</style>
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
						
						<span onclick="completelyDelete();" style="margin:0px 60px;">영구삭제</span>
						<span style="margin:0px 60px; color:gray; cursor:default;">│</span>
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
		
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script>
			function completelyDelete(){
				var arr = [];
				document.querySelectorAll('input[type=checkbox][name=mailNo]:checked').forEach(function(c){
					arr.push(c.value);
				})
				
				swal({
				  title: "정말 삭제하시겠습니까?",
				  text: "영구삭제된 메일은 다시 복구할 수 없습니다.",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
					  $.ajax({
							url:"tempDelete.ml",
							data:{
								mailNoArr:arr
								},
							type:"post",
							success:function(result){	// boolean 타입
								if(result){
									location.reload();
								} else {
									swal("삭제 실패");
								}
							}, error:function(){
								console.log("메일삭제용 ajax 통신실패")
							}
						})
				  } else {
				    swal("취소되었습니다.");
				  }
				});
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
          		<c:if test="${ pi.currentPage ne 1 }">
            		<li><a href="tempList.ml?cpage=${ pi.currentPage - 1 } "><</a></li>
              	</c:if>
	            
	            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		            <c:choose>
	            		<c:when test="${ pi.currentPage eq p }">
		            		<li class="active"><a href="tempList.ml?cpage=${ p }">${ p }</a></li>
	            		</c:when>
	            		<c:otherwise>
		            		<li><a href="tempList.ml?cpage=${ p }">${ p }</a></li>
	            		</c:otherwise>	            
		            </c:choose>
				</c:forEach>
				
				<c:if test="${ pi.currentPage ne pi.maxPage }">
            		<li><a href="tempList.ml?cpage=${ pi.currentPage + 1 }">></a></li>
				</c:if>
           </ul>
        </div>
	</div>
	

</body>
</html>