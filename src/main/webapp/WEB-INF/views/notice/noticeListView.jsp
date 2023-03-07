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

	<jsp:include page="../board/boardMenubar.jsp"/>

	<script>
        document.getElementsByClassName("menus")[0].className += ' clicked';
    </script>
    <div class="boardOuter">
		<!-- 글쓰기 버튼 관리자만 보여짐 -->
	    <div align="right">
	        <a href="" class="btn" id="write">글쓰기</a>
	    </div>
	    <br>
	    <table class="table">
	        <thead class="thead-light">
	          <tr>
	            <th style="width:50px;">번호</th>
	            <th style="width:500px;">제목</th>
	            <th>작성자</th>
	            <th>작성일</th>
	            <th style="width:70px;">조회수</th>
	          </tr>
	        </thead>
	        <tbody>
	          <tr>
	            <td>10</td>
	            <td><b>📢 중요 공지사항 제목 <img src="resources/icons/clip.png" height="15px" width="15px"></b></td>
	            <td>김은숙 팀장</td>
	            <td>2023-02-16</td>
	            <td>100</td>
	          </tr>
	          <tr>
	            <td>9</td>
	            <td>공지사항 제목</td>
	            <td>문동은 팀장</td> 
	            <td>2023-02-15</td>
	            <td>50</td>
	          </tr>
	        </tbody>
	    </table>
	
	    <form id="searchForm" action="" method="Get">
            <div class="select">
                <select name="condition">
                    <option value="all">전체</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
            </div>
            <div class="text">
                <div id="search-text">
                    <input type="text" name="keyword" placeholder="&nbsp;검색어를 입력하세요">
                </div>
                <div id="search-btn">
                    <button type="submit"><img src="resources/icons/search.png" height="25px" width="25px"></button>
                </div>
            </div>
        </form>
        <div id="paging">
            <ul>
                <li><a href="#"><</a></li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">></a></li>
            </ul>
        </div>
	</div>
</body>
</html>