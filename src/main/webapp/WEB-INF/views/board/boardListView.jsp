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
        document.getElementsByClassName("menus")[1].className += ' clicked';
    </script>
    <div class="boardOuter"> 
        <div align="right">
            <a href="enrollForm.bo" class="btn" id="write">글쓰기</a>
        </div>
        <br>
        <table class="table" id="boardList">
            <thead class="thead-light">
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
        		$("#boardList>tbody>tr").click(function(){
        			location.href = 'detail.bo?userNo=40&no=' + $(this).children(".no").text(); // userNo 바꾸기
        		})
        	})
        </script>
        
		<form id="searchForm" action="search.bo" method="Get">
			<input type="hidden" name="cpage" value="1">
            <div class="select">
                <select name="condition">
                    <option value="all">전체</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
            </div>
            <div class="text">
                <div id="search-text">
                    <input type="text" name="keyword" value="${ keyword }" placeholder="&nbsp;검색어를 입력하세요">
                </div>
                <div id="search-btn">
                    <button type="submit"><img src="resources/icons/search.png" height="23px" width="23px"></button>
                </div>
            </div>
        </form>
        
        <script>
        	document.querySelector("#searchForm option[value=${condition}]").selected = true;
        </script>
        
        <div id="paging">
            <ul>
          		<c:if test="${ pi.currentPage ne 1 }">
              		<li><a href="list.bo?cpage=${ pi.currentPage - 1 } "><</a></li>
              	</c:if>
	            
	            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	            	<c:choose>
	            		<c:when test="${ pi.currentPage eq p }">
	            			<c:choose>
			            		<c:when test="${ empty condition }">
				            		<li class="on"><a href="list.bo?cpage=${ p }">${ p }</a></li>
				            	</c:when>
				            	<c:otherwise>
				            		<li class="on"><a href="search.bo?cpage=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
				            	</c:otherwise>
	            			</c:choose>
	            		</c:when>
	            		<c:otherwise>
	            			<c:choose>
			            		<c:when test="${ empty condition }">
				            		<li><a href="list.bo?cpage=${ p }">${ p }</a></li>
				            	</c:when>
				            	<c:otherwise>
				            		<li><a href="search.bo?cpage=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
				            	</c:otherwise>
			            	</c:choose>
	            		</c:otherwise>
	            	</c:choose>
	            	
				</c:forEach>
				
				<c:if test="${ pi.currentPage ne pi.maxPage }">
	            	<li><a href="list.bo?cpage=${ pi.currentPage + 1 }">></a></li>
				</c:if>
           </ul>
        </div>
    </div>

</body>
</html>