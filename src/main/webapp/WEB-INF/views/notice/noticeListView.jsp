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
	/* 게시판 리스트 */
    .table{text-align: center;}
    .table>tbody>tr:hover{cursor:pointer; opacity: 0.7;}
</style>
</head>
<body>

	<jsp:include page="../board/boardMenubar.jsp"/>

	<script>
        document.getElementsByClassName("menus")[0].className += ' clicked';
    </script>
    <div class="boardOuter">
    	<c:set var = "authorityNo" value = "${loginUser.authorityNo}"/>
		<c:if test="${fn:contains(authorityNo, '0') or fn:contains(authorityNo, '3')}">
		    <div align="right">
		        <a href="enrollForm.no" class="btn" id="write">글쓰기</a>
		    </div>
	    </c:if>
	    <br>
	    <table class="table" id="noticeList">
	        <thead>
	          <tr>
	            <th style="width:50px;">번호</th>
	            <th style="width:900px;">제목</th>
	            <th>작성자</th>
	            <th>작성일</th>
	            <th style="width:70px;">조회수</th>
	          </tr>
	        </thead>
	        <tbody>
	        	<c:forEach var="n" items="${ list }">
                    <tr>
                        <td class="no">${ n.noticeNo }</td>
                        <td>
                        	<c:choose>
	                        	<c:when test="${ n.important eq 'Y' }">
	                        		📢
	                        		<b> ${ n.noticeTitle } </b>
	                        	</c:when>
	                        	<c:otherwise>
	                        		${ n.noticeTitle }
	                        	</c:otherwise>
                        	</c:choose>
                        	<c:if test="${ n.attachmentCount > 0 }">
                        		<img src="resources/icons/clip.png" height="15px" width="15px">
                        	</c:if>
                        </td>
                        <td>${ n.userName }</td>
                        <td>${ n.createDate }</td>
                        <td>${ n.count }</td>
                    </tr>
                   </c:forEach>
	        </tbody>
	    </table>
	    
	    <script>
        	$(function(){
        		$("#noticeList>tbody>tr").click(function(){
        			location.href = 'detail.no?no=' + $(this).children(".no").text();
        		})
        	})
        </script>
	    
	    <form id="searchForm" action="search.no" method="Get">
	    	<input type="hidden" name="cpage" value="1">
            <div class="select">
                <select name="condition">
                    <option value="all">전체</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="writer">작성자</option>
                </select>
            </div>
            <div class="text">
                <div id="search-text" style="width:80%">
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
              		<li><a href="list.no?cpage=${ pi.currentPage - 1 } "><</a></li>
              	</c:if>
	            
	            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	            	<c:choose>
	            		<c:when test="${ pi.currentPage eq p }">
	            			<c:choose>
			            		<c:when test="${ empty condition }">
				            		<li class="on"><a href="list.no?cpage=${ p }">${ p }</a></li>
				            	</c:when>
				            	<c:otherwise>
				            		<li class="on"><a href="search.no?cpage=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
				            	</c:otherwise>
	            			</c:choose>
	            		</c:when>
	            		<c:otherwise>
	            			<c:choose>
			            		<c:when test="${ empty condition }">
				            		<li><a href="list.no?cpage=${ p }">${ p }</a></li>
				            	</c:when>
				            	<c:otherwise>
				            		<li><a href="search.no?cpage=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
				            	</c:otherwise>
			            	</c:choose>
	            		</c:otherwise>
	            	</c:choose>
				</c:forEach>
				
				<c:if test="${ pi.currentPage lt pi.maxPage }">
	            	<li><a href="list.no?cpage=${ pi.currentPage + 1 }">></a></li>
				</c:if>
           </ul>
        </div>
	</div>
</body>
</html>