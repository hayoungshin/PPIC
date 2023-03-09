<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서ㆍ증명서</title>
<style>
   /* 서브메뉴 */
   .sub-menu a{
       font-size:18px;
       color:rgb(143, 143, 143);
       text-decoration:none;
       margin-right:30px;
   }
   .sub-menu a.active, .sub-menu a:hover {
       color:rgb(0, 0, 0);
       font-weight:600;
   }

   /* 리스트 */
   .table{
       text-align:center;
       font-size:14px;
   }
   .table>thead{
   	   background:rgb(244, 244, 244);
   }
   .edit-btn, .edit-btn:hover{
       margin-left:20px;
       cursor:pointer;
   }
   .btn-outline-purple{
   	   background:white;
   	   border:0.5px solid #6F50F8;
   	   color:#6F50F8;
   }
   .btn-outline-purple:hover{
   	   background:#6F50F8;
   	   color:white;
   }
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
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />
	
	<div id="content">
		<h3 class="title"><b>문서ㆍ증명서</b></h3>
        <br><br>
        <div class="sub-menu">
             <a href="commonList.doc" class="active">회사문서</a>
             <a href="myList.doc">내 문서</a>
        </div>
        <hr>
        <br>
        <button style="float:right" class="btn-purple" data-toggle="modal" data-target="#addModal">문서 추가</button>
        <br><br>
        <div class="list-area">
            <table class="table">
                <thead>
                    <th style="width:600px">문서</th>
                    <th style="width:100px">다운로드</th>
                    <th style="width:100px">수정일</th>
                </thead>
                <tbody>
	                <c:forEach var="d" items="${list}">
	                   <tr>
	                    <td>${d.docName}<img src="${d.savePath}" width="20" class="edit-btn" data-toggle="modal" data-target="#editModal"></td>
	                    <td><button class="btn-outline-purple">다운로드</button></td>
	                    <td>${d.modifyDate}</td>
	                   </tr>
	                </c:forEach>
                </tbody>
            </table>
        </div>
        <br><br>

        <!-- 추가 모달 -->
        <div class="modal fade" id="addModal">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">문서 추가</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    문서 이름 : <input type="text" placeholder="문서명을 입력해주세요." required>
                    <br><br>
                    문서 첨부 : <input type="file">
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">등록</button>
                </div>
        
            </div>
            </div>
        </div>

        <!-- 수정 모달 -->
        <div class="modal fade" id="editModal">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">문서 수정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    문서 이름 : <input type="text" placeholder="문서명을 입력해주세요." required>
                    <br><br>
                    문서 첨부 : <input type="file">
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-danger">삭제</button>
                    <button type="button" class="btn btn-primary">등록</button>
                </div>
        
            </div>
            </div>
        </div>
  

        <div id="paging">
            <ul>
            <c:if test="${pi.currentPage ne 1}">
           		<li><a href="">&lt;</a></li>
           	</c:if>
	        	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
	        		<c:choose>
	        			<c:when test="${pi.currentPage eq p}">
                    		<li class="on"><a class="page-link" href="commonList.docs?cpage=${p}">${p}</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li><a class="page-link" href="commonList.docs?cpage=${p}">${p}</a></li>
                    	</c:otherwise>
                    </c:choose>
                </c:forEach>
        	<c:if test="${pi.maxPage ne pi.endPage}">
        		<li><a href="">&gt;</a></li>
        	</c:if>
           </ul>
		</div>
	
</body>
</html>