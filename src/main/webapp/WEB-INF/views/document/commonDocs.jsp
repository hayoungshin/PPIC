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
   }
   .edit-btn, .edit-btn:hover{
       margin-left:20px;
       cursor:pointer;
   }
   .pagination {
       display: flex;
       justify-content: center;
       margin-top: 50px;
   }
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />
	
	<div id="content">
		<h2 class="title"><b>문서ㆍ증명서</b></h2>
        <br><br>
        <div class="sub-menu">
             <a href="commonList.doc" class="active">회사문서</a>
             <a href="myList.doc">내 문서</a>
        </div>
        <br><br>
        <button style="float:right" class="btn btn-secondary" data-toggle="modal" data-target="#addModal">문서 추가</button>
        <br><br>
        <div class="list-area">
            <table class="table">
                <thead>
                    <th style="width:600px">문서</th>
                    <th style="width:100px">다운로드</th>
                    <th style="width:100px">수정일</th>
                </thead>
                <tbody>
                   <tr>
                    <td><img>사업자등록증<img src="./images/edit.png" width="20" class="edit-btn" data-toggle="modal" data-target="#editModal"></td>
                    <td><button class="btn btn-primary">다운로드</button></td>
                    <td>2022.10.10</td>
                   </tr>
                   <tr>
                    <td><img>사업자등록증<img src="./images/edit.png" width="20" class="edit-btn" data-toggle="modal" data-target="#editModal"></td>
                    <td><button class="btn btn-primary">다운로드</button></td>
                    <td>2022.10.10</td>
                   </tr>
                </tbody>
            </table>
        </div>

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
  

        <ul class="pagination">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item active"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
	</div>
	
</body>
</html>