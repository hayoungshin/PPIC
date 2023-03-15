<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PPIC</title>
<style>
	 /* content css */

    .worktitle{
        width: 100%;
    }

    .workcategory{
       /* border: 1px solid black; */
        width: 100%;
        margin-bottom: 30px;
    }

    .workcategory>a{
        font-size: 20px;
        font-weight: bold;
        margin-right: 20px;
        color: lightgray;
    }


    label{
        font-size:18px;
        margin:5px 50px 30px 5px;
       
    }

    #homem { margin-right: 66px;}
    #homem2 { margin-right: 66px;}

    select{
        width: 150px;
        height: 30px;
    }

    .btn-holi{
        width: 70px;
        margin-left: 300px;
    }


    .profile{
        width: 100%;
        height: 110px;
       
    }

    .p_name{
        
        width: 400px;
        height: 100px;
        margin-bottom: 5px;
    }

    .phone{
        width: 25px;
        height: 25px;
        background: rgb(111, 80, 248);
        margin: 2px 10px 2px 2px;
        border-radius: 10%;
    }
    .email{
        width: 25px;
        height: 25px;
        background: rgb(111, 80, 248);
        margin: 2px 2px 2px 2px;
        border-radius: 10%;
    }
    .myPagecategory{
        width: 100%;
        
    }
    .myPagecategory>a{
        font-size: 20px;
        font-weight: bold;
        margin-right: 20px;
    }
    #p_title{
        width: 100px;
        
    }
    .p_update{
        width: 25px;
        height: 25px;
        background: rgb(111, 80, 248);
        margin: 2px 2px 2px 2px;
        border-radius: 10%;
       
    }
    
    .memnev{
        margin-bottom:30px;
        font-size: 18px;
        font-weight: bold;
    }
    
    #profileImg{
        width:100px;
        height:100px;
        background: rgb(111, 80, 248);
        border-radius: 25%;
        margin-right: 20px;
        margin-bottom: 30px ;
    }
    
    .mpro{
        width:100px;
        height:100px;
        background: rgb(111, 80, 248);
        color: white;
        border: none;
        border-radius: 25%;
        margin-right: 20px;
        margin-bottom: 30px ;
        font-size:25px;
        font-weight: bold;
        padding:30px 10px 10px 12px;
    }
    
    #phonep{
    	background: white;
    	border: 0.5px solid rgb(111, 80, 248);
    	color: rgb(111, 80, 248);
    	font-weight:bold;
    	font-size:12px;
    	width:100px;
    	height:30px;
    	padding:5px 5px 5px 10px;
    	border-radius :15px; 
    	position: absolute;
        left: 125px;
        top: 190px;
    }
    
    #mail{
    	background: white;
    	border: 0.5px solid rgb(111, 80, 248);
    	color: rgb(111, 80, 248);
    	font-weight:bold;
    	font-size:12px;
    	width:120px;
    	height:30px;
    	padding:5px 5px 5px 13px;
    	border-radius :15px; 
    	position: absolute;
        left: 150px;
        top: 190px;
    }
    
    #copy{
    	background:rgb(111, 80, 248);
    	width:230px;
    	height:80px;
    	position: fixed;
    	bottom: 10px; right: 10px; 
    	font-weight:bold;
    	font-size:20px;
    	color: white;
    	padding :20px 30px 30px 10px;
    	border-radius :15px; 
    }
    #phonepop{width:80%; margin:1px 3px 3px 3px;}
   
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
	<div class="outer">


        <div id="content" style=" " >

             <div class="memnev">
                <a href="memberMain.me" style="color:lightgray"> 구성원 </a>
                <a> | ${ m.userName }</a>
            </div>
           
            <div class="profile" style="float:left" >
            
            	<c:choose>
               		<c:when test="${ empty m.profileImg }">
               			<div class="mpro" style="float:left" >${ m.userName }</div>
                   	</c:when>
                   	<c:otherwise>
                   		<img id="profileImg" src="${ m.profileImg }" style="float:left" >
                   	</c:otherwise>
                </c:choose>
            	
                <div class="p_name" style="float:left" >
                    <h4 >${ m.userName }</h4>
                    <h5>${ m.department }부</h5>
                    <div class="phone" style="float:left;"> 
                    	<img src="resources/icons/phone_white.png" id="phonepop">
                    </div>
                    
                    <div class="email" style="float:left"> 
                    	<img src="resources/icons/email_white.png" id="mailpop"  style="width:80%; margin:1px 3px 3px 3px;">
                    </div>
                    
                    <div id="phonep" onclick="copyCode1()" style="display:none"> ${ m.phone } </div>
                    <div id="mail" onclick="copyCode2()" style="display:none"> ${ m.mail } </div>
                    <div id="copy" style="display:none">복사완료</div>
                </div>
            </div>
            
            <script>
	            $(function(){
	        		$("#phonepop").mouseover(function(){$('#phonep').show();})
	        		$("#phonep").mouseover(function(){$('#phonep').show();})
	        		$("#phonepop").mouseout(function(){$('#phonep').hide();})
	        		$("#phonep").mouseout(function(){$('#phonep').hide();})
	        		
	        	});
	            
	            $(function(){
	        		$("#mailpop").mouseover(function(){$('#mail').show();})
	        		$("#mail").mouseover(function(){$('#mail').show();})
	        		$("#mailpop").mouseout(function(){$('#mail').hide();})
	        		$("#mail").mouseout(function(){$('#mail').hide();})
	        		
	        	});
	            
	            function copyCode1() {
					const code = document.querySelector("#phonep");
					window.navigator.clipboard.writeText(code.textContent).then(() => {
						$('#copy').show(1000);
						$('#copy').hide(2000);
					});
	            }
	            
				function copyCode2() {
					const code = document.querySelector("#mail");
					window.navigator.clipboard.writeText(code.textContent).then(() => {
						$('#copy').show(1000);
						$('#copy').hide(2000);
					});
				}
            </script>

            <div class="myPagecategory" style="float:left" >
                <a style="color:black">인사정보</a>
                <hr>
            </div>

            <div class="member" >
                <label id="p_title" for="">소속</label>
                <label for="">${ m.department }부</label>
                <br>

                <label id="p_title" for="">직위</label>
                <label for="">${ m.position }</label>
                <br>

                <label id="p_title" for="">이메일</label>
                <label for="">${ m.mail }</label>
                <br>

                <label id="p_title" for="">휴대전화</label>
                <label for="">${ m.phone }</label>
                <br>

            </div>
            <br>

        </div>
    </div>

    

</body>
</html>