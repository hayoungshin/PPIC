<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    button{
        width:250px;
        height:30px;
        border:none;
        border-radius:5px;
        background:#6F50F8;
        color:white;
    }
    button:hover{
        cursor:pointer;
        font-weight:600;
        background:linear-gradient(to right, #6F50F8, #FFCECE);
    }
    a{
        text-decoration:none;
        font-size:10px;
        color:gray;
    }
    a:hover{
        font-weight: 700;
        color:gray;
    }
</style>
<!-- Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>

	<c:if test="${ not empty alertMsg }">
		<script>
			swal('', "${ alertMsg }", 'success')
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	
	<div id="wrapper" align="center" style="margin-top:250px;">

        <div style="height:70px; line-height:70px;">
            <span style="margin-right:10px; font-size:25px;">새로운 그룹웨어의 시작 , </span>
            <img src="resources/icons/PPIC.png" style="width:100px; vertical-align:text-bottom;">
        </div>
    
        <br>
    
        <form action="login.me" method="post">
            <table id="login-area">
                <tr>
                    <td style="width:170px; height:30px; padding-left:10px; border-radius:5px; border:1px solid gray;">
                        <img src="resources/icons/email.png" width="20px" style="vertical-align:middle;">
                        <input type="text" name="userId" placeholder="아이디" style="width:130px; height:100%; margin-left:5px; border: none;" required></input>
                    </td>
                    <td style="padding-left:5px;">
                        @ppic.kr
                    </td>
                </tr>
                <tr>
                    <td style="font-size:3px;">&nbsp</td>
                </tr>
                <tr>
                    <td colspan="2" style="width:170px; height:30px; padding-left:10px; border-radius:5px; border:1px solid gray;">
                        <img src="resources/icons/key.png" width="20px" style="vertical-align:middle;">
                        <input type="password" name="userPwd" placeholder="비밀번호" style="width:201px; height:100%; margin-left:5px; border: none;" required></input>
                    </td>
                </tr>
            </table>
    
            <br>
    
            <button>로그인하기</button>
        </form>
    
        <table>
            <tr>
                <td>
                    <a href="findIdForm.me">아이디</a> · <a href="findPwdIdCheckForm.me">비밀번호 찾기</a>
                </td>
                <td style="padding-left:100px;">
                    <a href="idCheckForm.me">회원가입</a>
                </td>
            </tr>
        </table>

    </div>
</body>
</html>