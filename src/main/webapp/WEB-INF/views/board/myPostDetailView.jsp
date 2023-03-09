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
    #list-btn, #modify-btn, #exit-btn, #delete-btn, #modal-btn{
        color:white;
        width:70px;
        height:30px;
        font-size: 12px;
        background: rgb(190, 190, 190);
    }
    #modify-btn, #delete-btn, #modal-btn{background: rgb(111, 80, 248);}
    a:hover{opacity: 0.7;}
    .dropdown-toggle{border:none; background: white;}

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
        width: 300px;
        height:100px;
        resize: none;
    }
</style>
</head>
<body>
	<jsp:include page="boardMenubar.jsp"/>
	<script>
        document.getElementsByClassName("menus")[2].className += ' clicked';
    </script>
    <br>
    <div class="boardOuter">
        <table>
            <tr>
                <td colspan="2" width="1200px"><h5>${ b.boardTitle }</h5></td>
            </tr>
            <tr class="line">
                <td>
                    <span>${ b.createDate }</span>
                    <a href="">👍 </a>${ b.likeCount }  <a href="">👎  </a>${ b.hateCount }
                    <!-- 이미 좋아요 또는 싫어요 눌렀을 시 표시 달라지고 누른거 취소해야 다시 누를 수 있음 -->
                </td>
                <td style="text-align: right;">조회수 ${ b.count }</td>
            </tr>
            <tr>
                <td colspan="2">
                    <p>
                        ${ b.boardContent }
                    </p>
                </td>
            </tr>
        </table>
        <br>
        <div align="center" style="width:1200px;">
            <a class="btn" id="list-btn" onclick="history.back();">목록</a>
            <a class="btn" id="modify-btn" onclick="postFormSubmit(1)">수정</a>
            <a class="btn" data-toggle="modal" data-target="#deleteModal" id="modal-btn">삭제</a>
        </div>
		<form action="" method="post" id="postForm">
        	<input type="hidden" name="no" value="${ b.boardNo }">
        	<input type="hidden" name="type" value="1"> <!-- 익명게시판에서 수정이면 0, 나의 게시글에서 수정이면 1 -->
        	<input type="hidden" name="userNo" value="10"> <!-- value 수정 -->
        </form>
		<script>
        	function postFormSubmit(num){
        		if(num == 1){
        			$("#postForm").attr("action", "updateForm.bo").submit();
        		} else{
        			$("#postForm").attr("action", "delete.bo").submit();
        		}
        	}
        </script>
        
        <!-- 삭제 확인용 Modal -->
        <div class="modal" id="deleteModal" data-backdrop='static' data-keyboard='false'> 
            <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-body">
                <b>나의 게시글 삭제</b> <br><br>
                <div align="center">
                    삭제하시겠습니까?<br><br>
                    <a class="btn" data-dismiss="modal" id="exit-btn">취소</a>
                    <a onclick="postFormSubmit(2);" class="btn" id="delete-btn">확인</a>
                </div>
                </div>
            </div>
            </div>
        </div>
    </div>

</body>
</html>