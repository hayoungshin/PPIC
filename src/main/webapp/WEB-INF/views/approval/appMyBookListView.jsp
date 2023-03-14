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
			// 부서 mouseover
			const m2 = document.getElementById("menu-2")
			m2.addEventListener("mouseover", function(){
				const arr1 = document.getElementsByClassName("menu1");
				for(let i=0; i<arr1.length; i++){
		        	arr1[i].style = 'display:none';
				}
				const arr2 = document.getElementsByClassName("menu2");
				for(let i=0; i<arr2.length; i++){
		        	arr2[i].style = 'display:none';
				}
				const arr3 = document.getElementsByClassName("menu3");
				for(let i=0; i<arr3.length; i++){
		        	arr3[i].style = 'display:block';
				}
				const arrm2 = document.getElementsByClassName("m2");
				for(let i=0; i<arrm2.length; i++){
		        	arrm2[i].style = 'margin-left: 19px';
				}
			});
			m2.addEventListener("mouseout", function(){
				const arr1 = document.getElementsByClassName("menu1");
				for(let i=0; i<arr1.length; i++){
		        	arr1[i].style = 'display:block';
				}
				const arr3 = document.getElementsByClassName("menu3");
				for(let i=0; i<arr3.length; i++){
		        	arr3[i].style = 'display:none';
				}
				const arrm2 = document.getElementsByClassName("m2");
				for(let i=0; i<arrm2.length; i++){
		        	arrm2[i].style = '';
				}
			});
			
			// 기안 mouseover
			const m11 = document.getElementById("menu-1-1")
			m11.addEventListener("mouseover", function(){
				const arr2 = document.getElementsByClassName("menu2");
				for(let i=0; i<arr2.length; i++){
		        	arr2[i].style = 'display:block';
				}
			});
			m11.addEventListener("mouseout", function(){
				const arr2 = document.getElementsByClassName("menu2");
				for(let i=0; i<arr2.length; i++){
		        	arr2[i].style = 'display:none';
				}
			});
			
			// 참조 mouseover
			const m12 = document.getElementById("menu-1-2")
			m12.addEventListener("mouseover", function(){
				const arr2 = document.getElementsByClassName("menu2");
				for(let i=0; i<arr2.length; i++){
		        	arr2[i].style = 'display:none';
				}
			});
			
			// 개인-중요 black
			document.getElementById("menu-1").style = 'color:black; font-weight:600';
			document.getElementById("menu-1-3").style = 'color:black; font-weight:600';

			document.getElementById("menu-1-3").innerHTML += " <span style='color:#fdbaba;'>${pi.listCount}</span>";
			
			// 개인-기안-, 부서- none
			const arr2 = document.getElementsByClassName("menu2");
			for(let i=0; i<arr2.length; i++){
	        	arr2[i].style = 'display:none';
			}
			const arr3 = document.getElementsByClassName("menu3");
			for(let i=0; i<arr3.length; i++){
	        	arr3[i].style = 'display:none';
			}
		}
	</script>
	
	<div class="content-2">
        <table id="tb" class="table-hover">
            <thead>
                <tr class="purple">
                    <th width="30px"><input type="checkbox"></th>
                    <th>작성자</th>
                    <th>문서양식</th>
                    <th>제목</th>
                    <th>첨부</th>
                    <th>결재상태</th>
                    <th>작성일</th>
                    <th>완료일</th>
                    <th>문서번호</th>
                    <th>중요</th>
                </tr>
            </thead>
            <tbody>
                
                <c:choose>
                	<c:when test="${ empty list }">
                		<tr>
                			<td colspan="10">중요 문서가 없습니다.</td>
                		</tr>
                	</c:when>
                	<c:otherwise>
		                <c:forEach var="a" items="${ list }">
			                <tr>
			                    <td><input type="checkbox"></td>
			                    <td>${ a.userName }</td>
			                    <td>${ a.form }</td>
			                    <td>${ a.title }</td>
			                    <td>
			                    	<c:if test="${ not empty a.originName }">
			                    		<img src="resources/icons/clip.png" height="20px">
			                    	</c:if>
			                    </td>
			                    <td>
			                    	<c:choose>
			                    		<c:when test="${ a.currentOrder lt a.finalOrder }">
			                    			${ a.approvalStatus } 반려
			                    		</c:when>
			                    		<c:otherwise>
			                    			${ a.approvalStatus} 승인
			                    		</c:otherwise>
			                    	</c:choose>
			                    </td>
			                    <td>${ a.createDate }</td>
			                    <td>${ a.completeDate }</td>
			                    <td>${ a.completeNo }</td>
			                    <td>
			                    	<c:choose>
			                    		<c:when test="${ empty a.bookmark }">
			                    			<img src="resources/icons/star.png" height="20px">
			                    		</c:when>
			                    		<c:otherwise>
				                    		<img src="resources/icons/star-y.png" height="20px">
			                    		</c:otherwise>
			                    	</c:choose>
			                    </td>
			                </tr>
		                </c:forEach>
		            </c:otherwise>
                </c:choose>

            </tbody>
        </table>

        <div class="del-btn-area"><button class="btnn-rd">선택 문서 삭제</button></div>
        <br clear="both">

        <div align="center">
            <a href="" class="btnn-pp">이전</a>
            <!-- forEach -->
            <a href="" class="btnn-pp">1</a>

            <a href="" class="btnn-pp">다음</a>
        </div>
    </div>
</div> <!-- div 닫는 구문 하나 더 있음 -->
</body>
</html>