<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
    table td{
        padding:10px 0px;
    }
    table div{
        width:300px;
        height:30px;
        padding-left:10px;
        border-radius:5px;
        border:1px solid gray;
    }

    #input-phone-area{
        position:relative;
    }
    #certification-btn{
        width:70px;
        height:25px;
        position:absolute;
        right:3px;
        bottom:3px;
        font-size:10px;
        padding:0;
        color: gray;
        background: none;
        border:1px solid gray;
    }

    button{
        width:300px;
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
</head>
<body>
	<div id="wrapper" align="center" style="margin-top:250px;">
        <img src="resources/icons/PPIC.png" style="width:100px;">
        <p style="font-size:18px;">비밀번호를 찾고자 하는 회원의 정보를 입력해주세요.</p>

        <br>
    
    	<form action="resetPwdForm.me" method="post" id="certification-form">
    		<input type="hidden" name="userNo" value="${ m.userNo }">
    		<table>
	            <tr>
	                <td>
	                    <div>
	                        <img src="resources/icons/smile.png" width="25px" style="vertical-align:middle;">
	                        <input id="checkName" type="text" placeholder="이름" style="width:260px; height:90%; margin-left:5px; border: none;"></input>
	                    </div>
	                </td>
	            </tr>
	            <tr>
	                <td>
	                    <div id="input-phone-area">
	                        <img src="resources/icons/phone.png" width="25px" style="vertical-align:middle;">
	                        <input id="checkPhone" type="text" placeholder="휴대전화번호 (-생략)" maxlength="11" style="width:260px; height:90%; margin-left:5px; border: none; z-index:-1000;"></input>
	                        <button type="button" id="certification-btn" onclick="phoneNumCheck();">인증번호 요청</button>
	                    </div>
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2" style="padding-bottom:0;">
	                    <div style="padding:0; border-radius:0; border:none; border-bottom:2px solid gray;">
	                        <input id="inputCode" type="text" placeholder="인증번호입력" style="width:300px; height:90%; border: none;"></input>
	                    </div>
	                </td>
	            </tr>
	            <tr>
	                <td style="padding:0; font-size:10px;">
	                    인증번호를 받지 못하셨나요? &nbsp&nbsp&nbsp
	                    <span style="color:rgb(60,60,60); cursor:pointer; text-decoration:underline;" onclick="phoneNumCheck();">인증번호 재발송</span>
	                </td>
	            </tr>
	        </table>
	        <button type="button" id="submit-btn" style="margin-top:30px;">다음</button>
    	</form>
        
        

        <script>
        	// 인증번호 전역변수로 설정
        	let code = null;
        
        	function phoneNumCheck(){
        		const checkName = document.getElementById("checkName").value;
        		const checkPhone = document.getElementById("checkPhone").value;
        		
        		if("${m.userName}" == checkName && "${m.phone}" == checkPhone){
        			// 이름 && 전화번호 올바로 작성했을 때
        			$.ajax({
        		        type:"POST", // post 형식으로 발송
        		        url:"sendMsg.me",
        		        data: {
        		        	phone:${m.phone}
        		        },
        		        cache:false,
        		        success:function(ranNum){
        		        	alert("인증번호 전송이 완료되었습니다.\n휴대폰에서 인증번호를 확인해주세요.");
        		        	code = ranNum;
        		        	console.log(code);
        		        }, error:function(){
        		        	console.log("문자전송용 ajax 통신 실패");
        		        }
        		    });
        		} else {
        			// 이름 || 전화번호 틀렸을 때
        			alert("입력하신 정보가 올바르지 않습니다.");
        		}
        	}
        	
        	
        	/* 인증번호 일치하는지 확인 */
       		let inputArea = document.getElementById("inputCode");
       		const btn = document.getElementById("submit-btn");
       		const form = document.getElementById("certification-form");
        	
           	btn.addEventListener("click", function(){
           		if(code==null){
           			alert("휴대전화 인증을 받고 다시 시도해 주세요.");
           		} else if(inputArea.value == code) {
                    form.submit();
                } else {
                	alert("인증번호가 일치하지 않습니다.\n다시 확인해주세요.");
                }
           	})
        	
        </script>
    
    </div>

</body>
</html>