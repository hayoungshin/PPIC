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
			// 개인-기안-임시저장 count
			document.getElementById("menu-area").innerHTML += "개인 &gt; 기안 &gt; 임시저장 <span style='color:#fdbaba;'>${pi.listCount}</span>";
			
			// 각 행
			const tr = document.getElementsByClassName("trOver");
			for(let i=0; i<tr.length; i++){
				// 상세 onclick
				tr[i].childNodes[9].addEventListener("click", function(){
					const no = this.parentNode.childNodes[1].value;
					const form = this.parentNode.childNodes[7].innerHTML;
					location.href="updateForm.ap?no=" + no + "&form=" + form;
				});
			}
		}
		
		// 전체체크, 전체해제
		function allCk(ckMode){
			const bx = document.getElementsByClassName("ckBoxes");
			for(let i=0; i<bx.length; i++){
				bx[i].checked = ckMode;
			}
		}
		
		// 개별체크
		function isAllCk(){
			const bx = document.getElementsByClassName("ckBoxes");
			let ckedCnt = 0;
			for(let i=0; i<bx.length; i++){
				if(bx[i].checked){
					ckedCnt += 1;
				}
			}
			let ckMode = false;
			if(bx.length == ckedCnt){
				ckMode = true;
			}
			document.getElementById("allCkBox").checked = ckMode;
		}
		
		// Ajax 영구삭제 delete
		function remove(){
			const bx = document.getElementsByClassName("ckBoxes");
			let ckNoArr = [];
			let formArr = [];
			let ckedCnt = 0;
			for(let i=0; i<bx.length; i++){
				if(bx[i].checked){
					ckedCnt += 1;
					ckNoArr.push(bx[i].parentElement.previousElementSibling.value);
					formArr.push(bx[i].parentElement.nextElementSibling.nextElementSibling.innerHTML);
				}
			}
			if(ckedCnt == 0){
				alert('선택된 결재문서가 없습니다.');
				return false;
			} else if(confirm(ckedCnt + '개의 결재문서를 영구삭제하시겠습니까?')){
				$.ajax({
					url:"removeApproval.ap?no=" + ckNoArr + "&form=" + formArr,
					success:function(result){
						if(result > 0){
							location.reload();
						}
					}, error:function(){
						console.log("삭제용 ajax통신 실패");
					}
				});
			}
			return false;
		}
	</script>
	
	<div class="content-2">
        <table id="tb" class="table-hover">
            <thead>
                <tr class="purple">
                    <th width="40px"><input type="checkbox" id="allCkBox" onclick="allCk(this.checked);"></th>
                    <th width="120px">작성자</th>
                    <th width="200px">문서양식</th>
                    <th>제목</th>
                    <th width="70px">첨부</th>
                    <th width="150px">결재상태</th>
                    <th width="150px">생성일</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                	<c:when test="${ empty list }">
                		<tr>
                			<td colspan="7">임시저장된 문서가 없습니다.</td>
                		</tr>
                	</c:when>
                	<c:otherwise>
		                <c:forEach var="a" items="${ list }">
			                <tr class="trOver">
			                    <input type="hidden" name="approvalNo" value="${ a.approvalNo }">
			                    <td><input type="checkbox" class="ckBoxes" onclick="isAllCk();"></td>
			                    <td>${ a.userName }</td>
			                    <td>${ a.form }</td>
			                    <td class="titleTd">${ a.title }</td>
			                    <td>
			                    	<c:if test="${ not empty a.originName }">
			                    		<img src="resources/icons/clip.png" height="20px">
			                    	</c:if>
			                    </td>
			                    <td><span class="stt-pk">${ a.approvalStatus }</span></td>
			                    <td>${ a.createDate }</td>
			                </tr>
		                </c:forEach>
		            </c:otherwise>
                </c:choose>

            </tbody>
        </table>
		
		<div class="del-btn-area"><button class="btnn-rd" onclick="return remove();">선택 문서 삭제</button></div>
        <br clear="both">

        <div align="center">
        	<c:if test="${ pi.currentPage ne 1 }">
            	<a href="list.ap?myt=1&cpage=${ pi.currentPage - 1 }" class="btnn-pp">이전</a>
            </c:if>
            
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:choose>
					<c:when test="${ p eq pi.currentPage }">
						<a href="list.ap?myt=1&cpage=${ p }" class="btnn-pp" style="background-color:#6F50F8; color:white;">${ p }</a>
					</c:when>
					<c:otherwise>
						<a href="list.ap?myt=1&cpage=${ p }" class="btnn-pp">${ p }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<c:if test="${ pi.currentPage ne pi.maxPage and pi.maxPage ne 0 }">
            	<a href="list.ap?myt=1&cpage=${ pi.currentPage + 1 }" class="btnn-pp">다음</a>
            </c:if>
        </div>
    </div>
</div> <!-- div 닫는 구문 하나 더 있음 -->
</body>
</html>