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
        width:200px;
        height:30px;
        margin-top:20px;
        border:none;
        border-radius:5px;
        background:#6F50F8;
        color:white;
    }
    button:hover{
        cursor:pointer;
        font-weight:600;
        background-color: rgb(98, 69, 230);
        transition: background 0.3s;
    }
    .btn-gray{
        border:none;
        border-radius:5px;
        background:rgb(230,230,230);
        color:rgb(60,60,60);
        padding:3px 7px;
    }
    .btn-gray:hover{
        cursor:pointer;
        font-weight:600;
        background-color: rgb(220,220,220);
        transition: background 0.3s;
    }
</style>
</head>
<body>
	
	<div id="wrapper" align="center" style="margin-top:260px;">
    
        <img src="resources/icons/PPIC.png" style="width:100px;">
        <p style="font-size:18px;">회원님의 정보와 일치하는 아이디입니다.</p>

        <br>

        <p style="font-size:20px; color:#6F50F8;">${ userId }</p>
    
        <br>
        
        <button class="btn-gray" onclick="location.href='${ pageContext.request.contextPath }'">로그인 하기</button>
        <button onclick="location.href='resetPwdIdCheckForm.me'">비밀번호 찾기</button>
    
    </div>

</body>
</html>