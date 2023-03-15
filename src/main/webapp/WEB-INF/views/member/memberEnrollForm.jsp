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
        width:500px;
        height:30px;
        margin-top:40px;
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

	<div id="wrapper" align="center" style="margin-top:230px;">

        <p style="font-size:25px;">${ checkId }님, 반가워요!</p>
        <p style="font-size:15px;">${ checkId }@ppic.kr 계정의 나머지 정보를 입력해주세요.</p>
    
        <br>
    
        <form action="insert.me" method="post">
        <input type="hidden" name="userId" value="${ checkId }">
            <table>
                <tr>
                    <td>
                        <div>
                            <img src="resources/icons/key.png" width="23px" style="vertical-align:middle;">
                            <input type="password" id="userPwd" name="userPwd" placeholder="* 비밀번호" style="width:212px; height:90%; margin-left:5px; border: none;" required></input>
                        </div>
                    </td>
                    <td>
                        <div>
                            <img src="resources/icons/birthday.png" width="23px" style="vertical-align:middle;">
                            <input type="date" name="birthday" style="width:212px; height:100%; margin-left:5px; border: none;"></input>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div>
                            <img src="resources/icons/key.png" width="23px" style="vertical-align:middle;">
                            <input type="password" id="pwd-check" placeholder="* 비밀번호 확인" style="width:212px; height:90%; margin-left:5px; border: none;" required></input>
                            <span id="pwd-check-result" style="font-size:10px;"></span>
                        </div>
                    </td>
                    <td>
                        <div>
                            <img src="resources/icons/office-c.png" width="23px" style="vertical-align:middle;">
                            <input type="text" name="employeeNo" placeholder="사번" style="width:212px; height:90%; margin-left:5px; border: none;"></input>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div>
                            <img src="resources/icons/smile.png" width="23px" style="vertical-align:middle;">
                            <input type="text" name="userName" placeholder="* 이름" style="width:212px; height:90%; margin-left:5px; border: none;" required></input>
                        </div>
                    </td>
                    <td>
                        <div>
                            <img src="resources/icons/suitcase.png" width="23px" style="vertical-align:middle;">
                            <select name="department" style="width:212px; height:100%; margin-left:5px; border: none;" required>
                                <option value="" disabled selected>* 부서</option>
                                <c:forEach var="d" items="${ dList }">
	                            	<option value="${ d.departmentNo }">${ d.departmentName }</option>
	                            </c:forEach>
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div>
                            <img src="resources/icons/phone.png" width="23px" style="vertical-align:middle;">
                            <input type="text" name="phone" maxlength="11" placeholder="휴대전화번호 (-생략)" style="width:212px; height:90%; margin-left:5px; border: none;"></input>
                        </div>
                    </td>
                    <td>
                        <div>
                            <img src="resources/icons/suitcase.png" width="23px" style="vertical-align:middle;">
                            <select name="position" style="width:212px; height:100%; margin-left:5px; border: none;" required>
                                <option value="" disabled selected>* 직급</option>
                                <c:forEach var="p" items="${ pList }">
	                            	<option value="${ p.positionNo }">${ p.positionName }</option>
	                            </c:forEach>
                            </select>
                        </div>
                    </td>
                </tr>
            </table>

            <button id="submit-btn" disabled>PPIC 시작하기</button>

        </form>

        <script>
            const pwdInput = document.getElementById("userPwd");
            document.getElementById("pwd-check").onkeyup = function(){
                const area = document.getElementById("pwd-check-result");
                const btn = document.getElementById("submit-btn");
                if(this.value == pwdInput.value) {
                    //console.log("일치");
                    area.style.color = "#00b5d1";
                    area.innerHTML = "비밀번호가 일치합니다.";
                    btn.className = "fulfilled";
                    btn.disabled = false;
                } else {
                    //console.log("불일치");
                    area.style.color = "red";
                    area.innerHTML = "비밀번호가 일치하지 않습니다.";
                    btn.classList.remove("fulfilled");
                    btn.disabled = true;
                }
                //console.log(pwdInput.value);
                //console.log(this.value);
            }
        </script>
    
    </div>

</body>
</html>