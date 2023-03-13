<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="outer">
		<div id="content">
			<form action="login.me" method="post">
			    아이디 : 
			    <input type="text" id="userId" name="userId"> <br>
			    비밀번호
			    <input type="password" id="userPwd" name="userPwd">
			    <button type="submit">로그인</button>
		    </form>
	    </div>
    </div>
</body>
</html>