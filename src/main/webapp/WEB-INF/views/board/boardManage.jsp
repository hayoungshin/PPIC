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
    
    /* 버튼 스타일 */
    #modal-btn, #exit-btn, #delete-btn, #check-btn, #blind-btn{
        color:white;
        width:70px;
        height:30px;
        font-size: 12px;
        background: rgb(190, 190, 190);
    }
    #modal-btn, #delete-btn, #blind-btn{background: rgb(111, 80, 248);}
    #blind-btn{width:75px;}
    .btn:hover{opacity: 0.7;}

    textarea{
        border: 1px solid rgb(202, 199, 199);
        border-radius: 5px;
        width: 300px;
        height:100px;
    }
    #blindModal td{
        padding: 5px;
    }
</style>
</head>
<body>

	<jsp:include page="boardMenubar.jsp"/>
    <script>
        document.getElementsByClassName("menus")[3].className += ' clicked';
    </script>

	<div class="boardOuter"> 
        <div align="right">
            <a href="" class="btn" id="modal-btn" data-toggle="modal" data-target="#deleteModal">삭제</a>
        </div>
        <br>
        <table class="table">
            <thead class="thead-light">
              <tr>
                <th><input type="checkbox"></th> <!-- 전체 선택 체크박스 -->
                <th style="width:50px;">번호</th>
                <th style="width:800px;">제목</th>
                <th>신고글 번호</th>
                <th style="width:70px;">신고일</th>
                <th>블라인드</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><input type="checkbox"></td>
                <td>10</td>
                <td class="title">익명게시판 신고 내역</td>
                <td>2023-02-16</td>
                <td>100</td>
                <td></td>
              </tr>
              <tr>
                <td><input type="checkbox"></td>
                <td>9</td>
                <td>익명게시판 신고 내역</td>
                <td>2023-02-15</td>
                <td>50</td>
                <td>완료</td>
              </tr>
            </tbody>
        </table>

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
        
        <!-- 삭제 확인용 Modal -->
        <div class="modal" id="deleteModal" data-backdrop='static' data-keyboard='false'>
            <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-body">
                <b>신고 내역 삭제</b> <br><br>
                <div align="center">
                    삭제하시겠습니까?<br><br>
                    <a class="btn" data-dismiss="modal" id="exit-btn">취소</a>
                    <a href="" class="btn" id="delete-btn">확인</a>
                </div>
                </div>
            </div>
            </div>
        </div>

        <!-- 블라인드 처리용 Modal -->
        <div class="modal" id="blindModal" data-backdrop='static' data-keyboard='false'>
            <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <b>신고하기</b> <br><br>
                    <form action="">
                        <table>
                            <tr>
                                <td><b>신고구분</b></td>
                                <td>기타</td>
                            </tr>
                            <tr>
                                <td><b>신고게시글</b></td>
                                <td>개발팀 차은우 대리 여자친구 있나요? <a href=""><img src=""></a></td>
                            </tr>
                            <tr>
                                <td><b>신고내용</b></td>
                                <td><textarea name="" style="resize: none;" readonly>고발합니다.</textarea></td>
                            </tr>
                        </table>
                        <div align="center">
                            <a class="btn" data-dismiss="modal" id="check-btn">확인</a>
                            <a href="" class="btn" id="blind-btn">블라인드</a>
                        </div>
                    </form>
                </div>
            </div>
            </div>
        </div>
    </div>
    <script>
	    $(".title").click(function(){
	        // 신고 번호 넘기면서
	        $('#blindModal').modal('show'); 
	    })
    </script>
</body>
</html>