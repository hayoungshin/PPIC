<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .boardOuter{
        font-size: 13px;
    }
    
    .menu{
        width:100%;
        height:50px; 
        font-size:18px;
    }
    .menus{
        height:100%;
        float:left; 
        margin-right:15px; 
        color:rgb(190, 190, 190);
        cursor: pointer;
        border-radius: 15px; 
        line-height:48px;
        text-align: center;
        font-weight: 900;
        padding-left:8px;
        padding-right:8px;
    }
    .menus:hover{opacity: 0.5;}
    .clicked{color:black;}  
    
    /* 글쓰기 버튼 */
    #write{
        background: rgb(111, 80, 248);
        color:white;
        width:70px;
        height:30px;
        font-size: 13px;
    }
    #write:hover{opacity: 0.7;}
    
     /* 페이징 */
    #paging{
    	width:1400px; 
        text-align:center;
    }
    #paging>ul{display: inline-block;}
    #paging li {
        text-align: center;
        float: left;
        list-style:none;
        border-radius:5px;
        background: rgb(244, 244, 244);
        margin:2px;
    }
    #paging li a {
        display: block;
        font-size: 12px;
        color: black;
        padding: 5px 10px;
        box-sizing: border-box;
        text-decoration-line:none;
    }
    #paging li:hover{background: rgb(111, 80, 248);}
    #paging li a:hover{color: white;}
    #paging li.on {background: rgb(111, 80, 248);}
    #paging li.on a {color: white;}

    /* 검색 */
    #searchForm{float:right;}
    #searchForm>*{float:left;}
    #searchForm select{
        width: 70px;
        border: 1px solid rgb(202, 199, 199);
        height: 30px;
        border-radius: 5px;
        cursor: pointer;
    }
    .text{
        width: 190px;
        border: 1px solid rgb(202, 199, 199);
        height: 30px;
        border-radius: 5px;
    }
    .text>div{height:100%; float:left;}
    .text button, .text input{
        height:100%;
        box-sizing:border-box;
        border:none;
        background:none;
        cursor:pointer;
    }
</style>

</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	<div class="outer">
		<div id="content">
			<div class="boardMenu"> 
		        <h4><b>회사소식</b></h4>
		        <div class="menu">
		            <div class="menus" onclick="location.href='list.no'">공지사항</div>
		            <div class="menus" onclick="location.href='list.bo'">익명게시판</div>
		            <div class="menus" onclick="location.href='myList.bo?userNo=1'">나의 게시글</div>
		            <!-- 관리자일 경우 보여짐 -->
		            <div class="menus" onclick="location.href='manage.bo'">익명게시판 관리</div>
		            <div class="menus" onclick="location.href='schedule.bo'">회사 일정 관리</div>
		        </div>
		    </div>

    
    
</body>
</html>