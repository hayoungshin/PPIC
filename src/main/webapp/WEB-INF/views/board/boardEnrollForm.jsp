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

    #cancel-btn, #enroll-btn{
        background: rgb(190, 190, 190);
        color:white;
        width:70px;
        height:30px;
        font-size: 12px;
    }
    #enroll-btn{background: rgb(111, 80, 248);}
    
    button:hover{opacity: 0.7;}
</style>
</head>
<body>

	<jsp:include page="boardMenubar.jsp"/>
    <script>
        document.getElementsByClassName("menus")[1].className += ' clicked';
    </script>
	<div class="boardOuter">
        <br><h5><b>익명게시판 작성</b></h5><br>
        <form action="insert.bo" method="post">
            <table>
                <tr>
                    <td width="100">제목</td>
                    <td><input type="text" id="boardTitle" name="boardTitle" placeholder="제목을 입력해주세요." required></td>
                </tr>
                <tr>
                    <td style="vertical-align:top;">내용</td>
                    <td>
                        <textarea name="boardContent" placeholder="내용을 입력해주세요." style="resize:none" required></textarea>
                    </td>
                </tr>
            </table>
            <!-- <input type="hidden" name="boardWriter" value="${ loginUser.userNo }"> -->
            <div align="center">
                <button type="button" class="btn" id="cancel-btn" onclick="javascript:history.go(-1);">취소</button>
                <button type="submit" class="btn" id="enroll-btn">작성</button>
            </div>
        </form>
    </div> 
</body>
</html>