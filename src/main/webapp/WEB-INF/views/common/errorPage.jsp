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
	<jsp:include page="menubar.jsp"/>

    <br>
    <div align="center">	
        <h1 style="font-weight:bold">${ errorMsg } </h1>
    </div>
    <br>
</body>
</html>