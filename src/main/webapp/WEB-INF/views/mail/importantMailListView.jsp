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
	document.getElementsByClassName("mail-menu")[2].className += ' selected';
    </script>
    
    <!-- 리스트 -->
	<div align="center">
		<table class="table" style="margin-top:30px;">
			<thead>
				<tr id="table-head">
					<td colspan="6" style="width:30px;">
	
						<input type="checkbox" id="check-all" onclick="checkAll(this);">
	
						<div class="dropdown" style="display:inline-block;">
							<button style="margin:0px; padding:0; background:none;" class="dropdown-toggle" data-toggle="dropdown"></button>
							<div class="dropdown-menu" style="font-size:13px; padding:0;">
								<span class="dropdown-item select-checkbox" id="select-all">전체선택</span>
								<span class="dropdown-item select-checkbox" id="select-read">읽은메일</span>
								<span class="dropdown-item select-checkbox" id="select-notread">읽지않은메일</span>
							</div>
						</div>
	
						<span id="read-status" onclick="readMail();" style="margin:0px 48px;">읽음</span>
						<span onclick="deleteMail();" style="margin:0px 60px;">삭제</span>
						<span style="margin:0px 60px; color:gray;">│</span>
	
						<div class="dropdown" style="display:inline-block;">
							<a href="" style="margin:0px 30px" class="dropdown-toggle" data-toggle="dropdown">정렬</a>
							<div class="dropdown-menu" style="font-size:13px; padding:0;">
								<a class="dropdown-item" href="importantList.ml?cpage=1">최신 순</a>
								<a class="dropdown-item" href="importantList.ml?cpage=1&sort=older">오래된 순</a>
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
							<input type="checkbox" class="mailNo" name="mailNo" value="${ m.mailNo }" onclick="boxchecked();">
						</td>
						<td style="width:50px;text-align:right;">
							<img onclick="importantStatus(this);" src="resources/icons/star-y.png" style="width:18px; margin-bottom:3px;">
						</td>
						<td style="width:70px; text-align:left;" onclick="toDetail(this);">
							<c:choose>
								<c:when test="${ not empty m.readDate || m.mailType eq 4 }">	<!-- 읽음 -->
									<img class="read-status" src="resources/icons/mail-opened.png" style="width:20px;">
								</c:when>
								<c:otherwise>	<!-- 안읽음 -->
									<img class="read-status" src="resources/icons/mail-c.png" style="width:20px;">
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
		
		
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script>
			/* 체크박스 */
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
			$(".select-checkbox").click(function(e){
				document.getElementById("check-all").checked = false;
				document.querySelectorAll(".mailNo").forEach(function(c){
					c.checked = false;
				})
				const id = e.target.id;
				if(id == "select-all"){
					document.getElementById("check-all").checked = true;
					document.querySelectorAll(".mailNo").forEach(function(c){
						c.checked = true;
					})
				} else if(id == "select-read"){
					document.querySelectorAll(".read-status").forEach(function(r){
						if(r.src.includes("mail-opened")){
							r.parentNode.parentNode.childNodes[1].childNodes[1].checked = true;							
						}
					})
				} else if(id == "select-notread"){
					document.querySelectorAll(".read-status").forEach(function(r){
						if(r.src.includes("mail-c")){
							r.parentNode.parentNode.childNodes[1].childNodes[1].checked = true;							
						}
					})
				}
			})
			
			/* 삭제 */
			function deleteMail(){
				var sendArr = [];
				var recieveArr = [];
				document.querySelectorAll('input[type=checkbox][name=mailNo]:checked').forEach(function(c){
					if(document.getElementById("mailType" + c.value).value == 4){
						sendArr.push(c.value)
					} else {
						recieveArr.push(c.value)
					}
				})
				
				if(sendArr.length > 0 || recieveArr.length > 0){
					swal({
						  title: "정말 삭제하시겠습니까?",
						  text: "메일을 휴지통으로 이동하며 10일 보관 후 영구삭제됩니다.",
						  icon: "warning",
						  buttons: true,
						  dangerMode: true,
						})
						.then((willDelete) => {
						  if (willDelete) {
							  if(sendArr.length > 0){
									$.ajax({
										url:"listDelete.ml",
										data:{
											mailNoArr:sendArr,
											mailType:4
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
								}
								if(recieveArr.length > 0){
									$.ajax({
										url:"listDelete.ml",
										data:{
											mailNoArr:recieveArr
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
								}
						  } else {
						    swal("취소되었습니다.");
						  }
						});
				} else {
					swal("메일을 선택해주세요");
					
				}
			}
			
			/* 읽음안읽음 */
			function readMail(){
				var arr = [];
				let checked = document.querySelectorAll('input[type=checkbox][name=mailNo]:checked');
				checked.forEach(function(c){
					if(document.getElementById("mailType" + c.value).value != 4){
						arr.push(c.value);
					}
				})
				
				if(document.getElementById("read-status").innerText == "읽음"){
					$.ajax({
						url:"read.ml",
						data:{mailNoArr:arr},
						type:"post",
						success:function(result){	// boolean 타입
							if(result){
								checked.forEach(function(c){
									c.parentNode.parentNode.childNodes[5].childNodes[3].src = "resources/icons/mail-opened.png";
								})
								document.getElementById("read-status").innerText = "안읽음";
							} else {
								alert("읽음처리 실패");
							}
						}, error:function(){
							console.log("읽음처리용 ajax 통신실패")
						}
					})
				} else {
					$.ajax({
						url:"unread.ml",
						data:{mailNoArr:arr},
						type:"post",
						success:function(result){	// boolean 타입
							if(result){
								checked.forEach(function(c){
									if(document.getElementById("mailType" + c.value).value != 4){
										c.parentNode.parentNode.childNodes[5].childNodes[3].src = "resources/icons/mail-c.png";
									}
								})
								document.getElementById("read-status").innerText = "읽음";
							} else {
								alert("안읽음처리 실패");
							}
						}, error:function(){
							console.log("안읽음처리용 ajax 통신실패")
						}
					})
				}
			}
		</script>
		
		

		<!-- 별표 -> 중요메일 설정,해제 -->
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
				location.href = "importantDetail.ml?no=" + mailNo + "&type=" + document.getElementById("mailType" + mailNo).value;
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
				            		<li class="active"><a href="importantList.ml?cpage=${ p }">${ p }</a></li>
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
				            		<li><a href="importantList.ml?cpage=${ p }">${ p }</a></li>
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
	            	<li><a href="importantList.ml?cpage=${ pi.currentPage + 1 }">></a></li>
				</c:if>
           </ul>
        </div>
	</div>

    

</body>
</html>