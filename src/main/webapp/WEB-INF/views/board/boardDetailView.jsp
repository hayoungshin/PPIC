<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* table 스타일 */
    .boardOuter td{
        padding:10px; 
        font-size:14px;
    }
    .line{
        border-bottom:1px solid lightgray;
    }
    .boardOuter td>span{margin-right:15px;}
    .boardOuter td>a{text-decoration: none!important;}

    /* button 스타일 */
    #list-btn, #report-btn, #exit-btn, #delete-btn, #modal-btn{
        color:white;
        width:70px;
        height:30px;
        font-size: 12px;
        background: rgb(190, 190, 190);
    }
    #report-btn, #delete-btn, #modal-btn{background: rgb(111, 80, 248);}
    .boardOuter a:hover{opacity: 0.7;}
    .dropdown-toggle{cursor:pointer;}

    /* modal내 input요소 스타일 */
    select{
        width: 100px;
        border: 1px solid rgb(202, 199, 199);
        height: 30px;
        border-radius: 5px;
        cursor: pointer;
    }
    textarea{
        border: 1px solid rgb(202, 199, 199);
        border-radius: 5px;
        width: 350px;
        height:100px;
    }
</style>
</head>
<body>

	<jsp:include page="boardMenubar.jsp"/>
    <script>
        document.getElementsByClassName("menus")[1].className += ' clicked';
    </script>
	<br>
	<div class="boardOuter">
        <table>
            <tr>
                <td colspan="2" width="1100px"><h5>개발팀 차은우 대리 여자친구 있나요?</h5></td>
                <td style="text-align: right;">
                    <div class="dropdown btn-align">
                        <img src="resources/icons/dots.png" class="dropdown-toggle" data-toggle="dropdown" height="15" width="15">
                        <div class="dropdown-menu">
                            <!-- 작성자만 클릭할 수 있는 버튼 -->
                            <a class="dropdown-item" href="#">수정</a>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#deleteModal">삭제</a>
                        </div>
                    </div>
                </td>
            </tr>
            <tr class="line">
                <td colspan="2">
                    <span>2023-02-16 (목) 16:35</span>
                    <a href="">👍 </a>840  <a href="">👎  </a>87
                    <!-- 이미 좋아요 또는 싫어요 눌렀을 시 표시 달라지고 누른거 취소해야 다시 누를 수 있음 -->
                </td>
                <td style="text-align: right;">조회수 999</td>
            </tr>
            <tr>
                <td colspan="3">
                    <p>
                        제발 알려주세요
                    </p>
                </td>
            </tr>
        </table>
        <br>
        <div align="center" style="width:1200px;">
            <a href="" class="btn" id="list-btn">목록</a>
            <a href="" class="btn" id="modal-btn" data-toggle="modal" data-target="#reportModal">신고</a>
        </div>

        <!-- 삭제 확인용 Modal -->
        <div class="modal" id="deleteModal" data-backdrop='static' data-keyboard='false'>
            <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-body">
                <b>익명 게시글 삭제</b> <br><br>
                <div align="center">
                    삭제하시겠습니까?<br><br>
                    <a class="btn" data-dismiss="modal" id="exit-btn">취소</a>
                    <a href="" class="btn" id="delete-btn">확인</a>
                </div>
                </div>
            </div>
            </div>
        </div>

        <!-- 신고용 Modal -->
        <div class="modal" id="reportModal" data-backdrop='static' data-keyboard='false'>
            <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <b>신고하기</b> <br><br>
                    <form action="">
                        <table>
                            <tr>
                                <td><b>신고구분</b></td>
                                <td>
                                    <select name="category">
                                        <option value="">욕설/비방</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><b>신고내용</b></td>
                                <td><textarea name="" placeholder="내용을 입력해주세요." style="resize: none;" required></textarea></td>
                            </tr>
                        </table>
                        <div align="center">
                            <a class="btn" data-dismiss="modal" id="exit-btn">취소</a>
                            <a href="" class="btn" id="report-btn">등록</a>
                        </div>
                    </form>
                </div>
            </div>
            </div>
        </div>
    </div>
</body>
</html>