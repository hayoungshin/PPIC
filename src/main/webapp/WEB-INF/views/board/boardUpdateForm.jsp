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
    .boardOuter td{padding-bottom:20px;}

    /* input 스타일 */
    input[type=text]{
        width: 1200px;
        border: 1px solid rgb(202, 199, 199);
        border-radius: 5px;
    }
    #boardTitle{height:30px;}
    input[type=checkbox]{
        width:10px;
        height:10px;
        margin-right:5px;
    }
    textarea{
        border: 1px solid rgb(202, 199, 199);
        border-radius: 5px;
        width: 1200px;
        height:400px;
    }

	/* button 스타일 */
    #cancel-btn, #modify-btn, #exit-btn, #modal-btn{
        background: rgb(190, 190, 190);
        color:white;
        width:70px;
        height:30px;
        font-size: 12px;
    }
    #modify-btn, #modal-btn{background: rgb(111, 80, 248);}
    
    button:hover{opacity: 0.7;}
</style>
</head>
<body>
	<jsp:include page="boardMenubar.jsp"/>
    <script>
    	if(${type} == 0){
    		document.getElementsByClassName("menus")[1].className += ' clicked';
    	}else{
    		document.getElementsByClassName("menus")[2].className += ' clicked';
    	}
        
    </script>
    <div class="boardOuter">
        <br><h5><b>게시글 수정</b></h5><br>
        <form action="update.bo" method="post">
        <input type="hidden" name="boardNo" value="${ b.boardNo }">
        <input type="hidden" name="type" value="${ type }">
        <input type="hidden" name="boardWriter" value="${ b.boardWriter }">
            <table>
                <tr>
                    <td width="100">제목</td>
                    <td width="800"><input type="text" id="boardTitle" name="boardTitle" value="${ b.boardTitle }" required></td>
                </tr>
                <tr>
                    <td style="vertical-align:top;">내용</td>
                    <td>
                        <textarea name="boardContent" style="resize:none" required>${ b.boardContent }</textarea>
                    </td>
                </tr>
            </table>
            <div align="center">
                <button type="button" class="btn" id="cancel-btn" onclick="javascript:history.go(-1);">취소</button>
                <button type="button" class="btn" id="modal-btn" data-toggle="modal" data-target="#modifyModal">수정</button>
            </div>
            <div class="modal" id="modifyModal" data-backdrop='static' data-keyboard='false'>
                <div class="modal-dialog modal-dialog-centered modal-sm">
                <div class="modal-content">
                    <div class="modal-body">
                    <b>익명 게시판 삭제</b> <br><br>
                    <div align="center">
                        수정하시겠습니까?<br><br>
                        <button type="button" class="btn" data-dismiss="modal" id="exit-btn">취소</button>
                        <button type="submit" class="btn" id="modify-btn">확인</button>
                    </div>
                    </div>
                </div>
                </div>
            </div>
        </form>
    </div> 

</body>
</html>