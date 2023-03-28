<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 게시판 리스트 */
    .table{text-align: center;}
    .table>tbody>tr:hover{cursor:pointer; opacity: 0.7;}
</style>
</head>
<body>
	<jsp:include page="boardMenubar.jsp"/>
	<script>
        document.getElementsByClassName("menus")[2].className += ' clicked';
    </script>
	<div class="boardOuter"> 
     <br><br>
     <table class="table" id="myPostList">
         <thead>
           <tr>
             <th style="width:50px;">번호</th>
             <th style="width:1000px;">제목</th>
             <th>작성일</th>
             <th style="width:70px;">조회수</th>
             </tr>
           </thead>
           <tbody>
             <c:forEach var="b" items="${ list }">
               <tr>
                   <td class="no">${ b.boardNo }</td>
                   <td>${ b.boardTitle }</td>
                   <td>${ b.createDate }</td>
                   <td>${ b.count }</td>
               </tr>
              </c:forEach>
           </tbody>
       </table>
       
       <script>
       $(function(){
			console.log(${ pi.startPage})
			console.log(${ pi.endPage})
		})
        	$(function(){
        		$("#myPostList>tbody>tr").click(function(){
        			location.href = 'detailMy.bo?userNo=${loginUser.userNo}&no=' + $(this).children(".no").text();
        		})
        	})
        </script>
       
       <form id="searchForm" action="searchMy.bo" method="Get">
      	   <input type="hidden" name="cpage" value="1">
      	   <input type="hidden" name="userNo" value="${loginUser.userNo}">
           <div class="select">
               <select name="condition">
                   <option value="all">전체</option>
                   <option value="title">제목</option>
                   <option value="content">내용</option>
               </select>
           </div>
           <div class="text">
               <div id="search-text" style="width:80%;">
                   <input type="text" name="keyword" value="${ keyword }" placeholder="&nbsp;검색어를 입력하세요">
               </div>
               <div id="search-btn" style="width:20%;">
                   <button type="submit"><img src="resources/icons/search.png" height="100%" width="100%"></button>
               </div>
           </div>
       </form>
       
       <script>
        	document.querySelector("#searchForm option[value=${condition}]").selected = true;
        	
       </script>
       
       <div id="paging">
            <ul>
          		<c:if test="${ pi.currentPage ne 1 }">
              		<li><a href="myList.bo?cpage=${ pi.currentPage - 1 }&userNo=${loginUser.userNo}"><</a></li>
              	</c:if>
	            
	            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	            	<c:choose>
	            		<c:when test="${ pi.currentPage eq p }">
	            			<c:choose>
			            		<c:when test="${ empty condition }">
				            		<li class="on"><a href="myList.bo?cpage=${ p }&userNo=${loginUser.userNo}">${ p }</a></li>
				            	</c:when>
				            	<c:otherwise>
				            		<li class="on"><a href="searchMy.bo?cpage=${ p }&condition=${condition}&keyword=${keyword}&userNo=${loginUser.userNo}">${ p }</a></li>
				            	</c:otherwise>
	            			</c:choose>
	            		</c:when>
	            		<c:otherwise>
	            			<c:choose>
			            		<c:when test="${ empty condition }">
				            		<li><a href="myList.bo?cpage=${ p }&userNo=${loginUser.userNo}">${ p }</a></li>
				            	</c:when>
				            	<c:otherwise>
				            		<li><a href="searchMy.bo?cpage=${ p }&condition=${condition}&keyword=${keyword}&userNo=${loginUser.userNo}">${ p }</a></li>
				            	</c:otherwise>
			            	</c:choose>
	            		</c:otherwise>
	            	</c:choose>
				</c:forEach>
				
				<c:if test="${ pi.currentPage lt pi.maxPage }">
	            	<li><a href="myList.bo?cpage=${ pi.currentPage + 1 }&userNo=${loginUser.userNo}">></a></li>
				</c:if>
           </ul>
        </div>
    </div>
</body>
</html>