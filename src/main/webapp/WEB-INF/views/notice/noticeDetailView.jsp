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

    /* button 스타일 */
    #list-btn, #update-btn, #modal-btn, #delete-btn, #exit-btn{
        color:white;
        width:70px;
        height:30px;
        font-size: 12px;
        background: rgb(190, 190, 190);
    }
    #update-btn, #delete-btn, #modal-btn{background: rgb(111, 80, 248);}
    a:hover{opacity: 0.7;}
</style>
</head>
<body>

	<jsp:include page="../board/boardMenubar.jsp"/>

	<script>
        document.getElementsByClassName("menus")[0].className += ' clicked';
    </script>
    <br>
    <div class="boardOuter">
        <table>
            <tr>
                <td colspan="3" width="1200px"><h5>[공지] 회의실 노트북 패스워드 변경 작업 안내</h5></td>
            </tr>
            <tr class="line">
                <td colspan="2">
                    <img src="resources/icons/profile.jpg" class="rounded-circle" width="25" height="25">
                    문동은 팀장 
                    2023-02-16 (목) 16:35
                </td>
                <td><div align="right">조회수 50</div></td>
            </tr>
            <!-- 첨부파일 있을 경우 -->
            <tr>
                <td style="width:120px; vertical-align:top;">첨부파일 <b>2</b>개</td>
                <td colspan="2">
                    noticeFile.pdf <img src="resources/icons/download.png" height="15px" width="15px"><br>
                    noticeFile2.pdf <img src="resources/icons/download.png" height="15px" width="15px">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <pre>
안녕하세요. 문동은입니다.

6층 회의실 노트북 패스워드 변경 작업 관련해서 안내 말씀 드립니다.

ISMS 보안정책에 따라 공용 노트북의 패스워드를 3개월 주기로 변경하고 있습니다.

변경되는 패스워드 및 주의사항은 아래 내용을 참고하시기 바랍니다.
 
                            - 아 래 -

1. 작업 시간 : 2023년 02월 20일 월요일 17:30 ~ 18:00

2. 작업 내용 : 6층 회의실 노트북 패스워드 변경 작업

3. 대상 회의실 : ①LA Dodgers, ②Cincinnati Reds

4. 주의 사항 : 노트북 패스워드 임의 변경 및 기록 금지

감사합니다.   
                    </pre>
                </td>
            </tr>
        </table>
        <div align="center" style="width:1200px;">
            <a href="" class="btn" id="list-btn">목록</a>
            <!-- 수정/삭제 관리자만 보여짐 -->
            <a href="" class="btn" id="update-btn">수정</a>
            <a href="" class="btn" id="modal-btn" data-toggle="modal" data-target="#deleteModal">삭제</a>
        </div>
        <!-- 삭제 확인용 Modal -->
        <div class="modal" id="deleteModal" data-backdrop='static' data-keyboard='false'>
            <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-body">
                <b>나의 게시글 삭제</b> <br><br>
                <div align="center">
                    삭제하시겠습니까?<br><br>
                    <a class="btn" data-dismiss="modal" id="exit-btn">취소</a>
                    <a href="" class="btn" id="delete-btn">확인</a>
                </div>
                </div>
            </div>
            </div>
        </div>
    </div>

</body>
</html>