<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    table td{
        padding:10px 50px;
    }
    table div{
        width:250px;
        height:30px;
        padding-left:10px;
        border-radius:5px;
        border:1px solid gray;
    }
    button{
        width:260px;
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

	<div id="wrapper" align="center" style="margin-top:260px;">
    
        <img src="resources/icons/PPIC.png" style="width:100px;">
        <p style="font-size:18px;">아이디를 찾고자 하는 회원의 정보를 입력해주세요.</p>

        <br>
    
        <form action="findId.me" method="post">
            <table>
                <tr>
                    <td>
                        <div>
                            <img src="resources/icons/email.png" width="25px" style="vertical-align:middle;">
                            <input type="text" name="userName" placeholder="이름" style="width:210px; height:90%; margin-left:5px; border: none;" required></input>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div>
                            <img src="resources/icons/idCard.png" width="25px" style="vertical-align:middle;">
                            <input type="text" name="employeeNo" placeholder="사번" style="width:210px; height:90%; margin-left:5px; border: none;" required></input>
                        </div>
                    </td>
                </tr>
            </table>
    
            <button>다음</button>
        </form>
	</div>
</body>
</html>