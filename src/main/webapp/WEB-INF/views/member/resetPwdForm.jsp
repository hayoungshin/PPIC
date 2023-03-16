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
    .fulfilled:hover{
        cursor:pointer;
        font-weight:600;
        background:linear-gradient(to right, #6F50F8, #FFCECE);
    }
</style>
</head>
<body>
	
    <div id="wrapper" align="center" style="margin-top:260px;">
    
        <img src="resources/icons/PPIC.png" style="width:100px;">
        <p style="font-size:18px;">새로운 비밀번호를 입력해주세요.</p>

        <br>
    
        <form action="resetPwd.me">
        	<input type="hidden" name="userNo" value="${ userNo }">
            <table>
                <tr>
                    <td>
                        <div>
                            <img src="resources/icons/key.png" width="25px" style="vertical-align:middle;">
                            <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호" style="width:210px; height:90%; margin-left:5px; border: none;"></input>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div>
                            <img src="resources/icons/key.png" width="25px" style="vertical-align:middle;">
                            <input type="password" id="pwd-check" placeholder="비밀번호확인" style="width:210px; height:90%; margin-left:5px; border: none;"></input>
                            <span id="pwd-check-result" style="font-size:10px;"></span>
                        </div>
                    </td>
                </tr>
            </table>
    
            <button id="submit-btn" disabled>완료</button>
        </form>

        <script>
            const pwdInput = document.getElementById("userPwd");
            document.getElementById("pwd-check").onkeyup = function(){
                const area = document.getElementById("pwd-check-result");
                const btn = document.getElementById("submit-btn");
                if(this.value == pwdInput.value) {
                    area.style.color = "#00b5d1";
                    area.innerHTML = "비밀번호가 일치합니다.";
                    btn.className = "fulfilled";
                    btn.disabled = false;
                } else {
                    area.style.color = "red";
                    area.innerHTML = "비밀번호가 일치하지 않습니다.";
                    btn.classList.remove("fulfilled");
                    btn.disabled = true;
                }
            }
        </script>
    
    </div>


</body>
</html>