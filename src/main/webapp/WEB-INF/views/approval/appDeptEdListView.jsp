<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PPIC</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<jsp:include page="appMenu.jsp"/>
	
	<script>
		window.onload = function(){
			// 부서-완료 count
			document.getElementById("menu-area").innerHTML += "부서 &gt; 완료 <span style='color:#fdbaba;'>${pi.listCount}</span>";
			
			// 각 행
			const tr = document.getElementsByClassName("trOver");
			for(let i=0; i<tr.length; i++){
				// 삭제버튼 mouseover
				tr[i].addEventListener("mouseover", function(){
					const writer = this.childNodes[3].childNodes[1].childNodes[1].innerHTML;
					const btn = this.childNodes[3].childNodes[1].childNodes[3]
					if(writer == '${loginUser.userName}'){
						btn.style = 'position:absolute; top:-4px; left:25px; display:block;';
					}
				});
				
				// 삭제버튼 mouseout
				tr[i].addEventListener("mouseout", function(){
					const writer = this.childNodes[3].childNodes[1].childNodes[1].innerHTML;
					const btn = this.childNodes[3].childNodes[1].childNodes[3]
					if(writer == '${loginUser.userName}'){
						btn.style = 'position:absolute; top:-4px; left:25px; display:none;';
					}
				});
				
				// 상세 onclick
				tr[i].childNodes[7].addEventListener("click", function(){
					const no = this.parentNode.childNodes[1].value;
					const form = this.parentNode.childNodes[5].innerHTML;
					location.href="detail.ap?no=" + no + "&form=" + form;
				});
			}
		}
		
		// Ajax 삭제 update
		function del(){
			if(confirm('결재문서를 삭제하시겠습니까?')){
				const el = window.event.target;
				const no = el.parentNode.parentNode.parentNode.childNodes[1].value;
				$.ajax({
					url:"deleteApproval.ap?no=" + no,
					success:function(result){
						if(result > 0){
							location.reload();
						}
					}, error:function(){
						console.log("삭제용 ajax통신 실패");
					}
				});
			}
		}
	</script>
	
	<div class="content-2">
        <table id="tb" class="table-hover">
            <thead>
                <tr class="purple">
                    <th width="100px">작성자</th>
                    <th width="200px">문서양식</th>
                    <th>제목</th>
                    <th width="70px">첨부</th>
                    <th width="150px">결재상태</th>
                    <th width="130px">작성일</th>
                    <th width="130px">완료일</th>
                    <th width="180px">문서번호</th>
                </tr>
            </thead>
            <tbody>
                
                <c:choose>
                	<c:when test="${ empty list }">
                		<tr>
                			<td colspan="8">완료된 문서가 없습니다.</td>
                		</tr>
                	</c:when>
                	<c:otherwise>
		                <c:forEach var="a" items="${ list }">
			                <tr class="trOver">
			                    <input type="hidden" name="approvalNo" value="${ a.approvalNo }">
			                    <td>
			                    	<div style="position:relative;">
			                    		<span>${ a.userName }</span>
				                    	<div class="btnn-rd" style="position:absolute; top:-4px; left:25px; display:none;" onclick="return del();">삭제</div>
				                    </div>
			                    </td>
			                    <td>${ a.form }</td>
			                    <td class="titleTd">${ a.title }</td>
			                    <td>
			                    	<c:if test="${ not empty a.originName }">
			                    		<img src="resources/icons/clip.png" height="20px">
			                    	</c:if>
			                    </td>
			                    <td>
			                    	<c:choose>
			                    		<c:when test="${ a.currentOrder lt a.finalOrder }">
			                    			<span class="stt-rd">${ a.approvalStatus }</span>
			                    		</c:when>
			                    		<c:otherwise>
			                    			<span class="stt-sb">${ a.approvalStatus}</span>
			                    		</c:otherwise>
			                    	</c:choose>
			                    </td>
			                    <td>${ a.createDate }</td>
			                    <td>${ a.completeDate }</td>
			                    <td>${ a.completeNo }</td>
			                </tr>
		                </c:forEach>
		            </c:otherwise>
                </c:choose>

            </tbody>
        </table>
        
        <br>

        <div align="center">
        	<c:if test="${ pi.currentPage ne 1 }">
            	<a href="list.ap?dpe=1&cpage=${ pi.currentPage - 1 }" class="btnn-pp">이전</a>
            </c:if>
            
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:choose>
					<c:when test="${ p eq pi.currentPage }">
						<a href="list.ap?dpe=1&cpage=${ p }" class="btnn-pp" style="background-color:#6F50F8; color:white;">${ p }</a>
					</c:when>
					<c:otherwise>
						<a href="list.ap?dpe=1&cpage=${ p }" class="btnn-pp">${ p }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:if test="${ pi.currentPage ne pi.maxPage and pi.maxPage ne 0 }">
            	<a href="list.ap?dpe=1&cpage=${ pi.currentPage + 1 }" class="btnn-pp">다음</a>
            </c:if>
        </div>
    </div>
</div> <!-- div 닫는 구문 하나 더 있음 -->
</body>
</html>