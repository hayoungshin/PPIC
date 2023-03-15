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
        width:100px;
        height:30px;
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
    body {
	    opacity: 1;
	    transition-duration:3s;
	    transition-property: opacity;
	}

 	body.fade {
	    opacity: 0;
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

	<div id="wrapper" align="center" style="margin-top:300px;">

        <div style="height:70px; line-height:70px;">
            <span style="margin-right:10px; font-size:25px;">새로운 그룹웨어의 시작 , </span>
            <img src="resources/icons/PPIC.png" style="width:100px; vertical-align:text-bottom;">
        </div>
    
        <br>
    
        <form action="idCheck.me" method="post">
            <table>
                <tr>
                    <td style="width:170px; height:30px; padding-left:10px; border-radius:5px; border:1px solid gray;">
                        <img src="resources/icons/email.png" width="25px" style="vertical-align:middle;">
                        <input type="text" name="checkId" placeholder="아이디" style="width:130px; height:100%; margin-left:5px; border: none;" required></input>
                    </td>
                    <td style="padding-left:5px;">
                        @ppic.kr
                    </td>
                    <td>
                        <button style="margin-left:50px;">중복확인</button>
                    </td>
                </tr>
            </table>
        </form>

        <script>
        	document.body.className = 'fade';
        	document.addEventListener("DOMContentLoaded",function(){
        		window.setTimeout(function(){
        			document.body.className = '';
        		})
        	})
        </script>
    
    </div>

</body>
</html>