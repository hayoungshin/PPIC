<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PPIC</title>

<script src="https://cdn.jsdelivr.net/clipboard.js/1.5.3/clipboard.min.js"></script>
<style>
	 /* content css */

    .worktitle{width: 100%;}
    .workcategory{width: 100%;margin-bottom: 30px;}

    .workcategory>a{
        font-size: 20px;
        font-weight: bold;
        margin-right: 20px;
        color: lightgray;
    }

   
    label{font-size:18px;margin:5px 50px 30px 5px;}
    select{width: 150px; height: 30px;}
    .profile{width: 100%;height: 110px;}

    .p_name{
        width: 400px;
        height: 100px;
        margin-bottom: 5px;
    }

    #profileImg{
        width:100px;
        height:100px;
        background: rgb(111, 80, 248);
        border-radius: 25%;
        margin-right: 20px;
        margin-bottom: 30px ;
    }
    
    .pro{
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
    
    .myPagecategory{ width: 100%;}
    .myPagecategory>a{
        font-size: 20px;
        font-weight: bold;
        margin-right: 20px;
    }
    #p_title{ width: 100px;}
    
    .p_update{
        width: 25px;
        height: 25px;
        background: rgb(111, 80, 248);
        margin: 2px 2px 2px 2px;
        border-radius: 10%;
       
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
        top: 200px;
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
        top: 200px;
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

            <div>
                <h2 >내 프로필</h2>
                <br>
            </div>
           
            <div class="profile">
            
                <div class="profileImg" style="float:left">
                	<c:choose>
                		<c:when test="${ empty loginUser.profileImg }">
                			<div class="pro" style="float:left" onclick="$('#profileImgFile').click();">${ loginUser.userName }</div>
		                    <input type="file" id="profileImgFile" style="display:none;">
                    	</c:when>
                    	<c:otherwise>
                    		<img id="profileImg" src="${ loginUser.profileImg }" onclick="$('#profileImgFile').click();">
		                    <input type="file" id="profileImgFile" style="display:none;">
                    	</c:otherwise>
                    </c:choose>
                </div>
                
                <script>
            	$(function(){
            		$("#profileImgFile").change(function(){
            			 
            			let formData = new FormData();
            			let uploadFile = this.files[0];
            			
            			formData.append("uploadFile", uploadFile);
            			formData.append("userId", '${loginUser.userId}');
            			formData.append("userPwd", '${loginUser.userPwd}');
            			formData.append("originalFile", '${loginUser.profileImg}');
            			
            			$.ajax({
            				url:"uploadProfile.me",
            				data:formData, // 파일이 담겨있는 form 
            				processData:false, //기본적으로 true 폼 데이터값을 문자열로 변환하여 넘기지만 false로 선언해 from데이터를 문자열로 변환하지 않음 (파일 전송시에만 작성 )
            				contentType:false, 
            				type:"POST",
            				success:function(){
            					location.reload(); //강제로 새로고침
            				}, error:function(){
            					
            				}
            			})
            		})
            	})
            </script>
                
                <div class="p_name" style="float:left" >
                    <h4 >${loginUser.userName }</h4>
                    <h5>${loginUser.department }</h5>
                    
                    <div class="phone" style="float:left;"> 
                    	<img src="resources/icons/phone_white.png" id="phonepop">
                    </div>
                    
                    <div class="email" style="float:left"> 
                    	<img src="resources/icons/email_white.png" id="mailpop"  style="width:80%; margin:1px 3px 3px 3px;">
                    </div>
                    
                    <div id="phonep" onclick="copyCode1()" style="display:none"> ${ loginUser.phone } </div>
                    <div id="mail" onclick="copyCode2()" style="display:none"> ${ loginUser.mail } </div>
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
                <a style="color:lightgray">문서</a>
                <hr>
            </div>

            <div class="" style="float:right">
                <img src="resources/icons/approval.png" data-toggle="modal" data-target="#deleteForm" style="width:20px; margin:1px 3px 3px 3px;">
           </div>

           <script>
                /* 프로필 변경 모달 */

           </script>

            <div class="member" >
                <label id="p_title" for="">사번</label>
                <label for="">${ loginUser.employeeNo }</label>
                <br>

                <label id="p_title" for="">입사일</label>
                <label for="">${ loginUser.hireDate }</label>
                <br>
                
                <label id="p_title" for="">소속</label>
                <label for="">${loginUser.department }</label>
                <br>

                <label id="p_title" for="">직위</label>
                <label for="">${loginUser.position }</label>
                <br>

                <label id="p_title" for="">이메일</label>
                <label for="">${loginUser.mail }</label>
                <br>

                <label id="p_title" for="">휴대전화</label>
                <label for="">${loginUser.phone }</label>
                <br>

                <label id="p_title" for="">주소</label>
                <label for="">${loginUser.address }</label>
                <br>

            </div>
            <br>

        </div>
    </div>

    <!-- 아이콘 클릭시 보여질 프로필변경 Modal -->
    <div class="modal" id="deleteForm">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">회원정보수정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" align="center">
                
                    <form action="update.me" method="post">
                        <div class="form-group" align="left">
                            
                            <input type="hidden" id="userId" name="userId" value="${ loginUser.userId }" >
                            <input type="hidden" id="userPwd" name="userPwd" value="${ loginUser.userPwd }" >
                            <label id="p_title" for="">이름</label>
                            <input type="text" id="userName" name="userName" value="${loginUser.userName }"><br>
                            
                            <label id="p_title" for="">사번</label>
                            <label for="">${ loginUser.employeeNo }</label>
                            <br>

                            <label id="p_title" for="">입사일</label>
                            <label for="">${ loginUser.hireDate }</label>
                            <br>
                            
                            <label id="p_title" for="">소속</label>
                            <label for="">${loginUser.position }</label>
                            <br>

                            <label id="p_title" for="">직위</label>
                            <label for="">${loginUser.position }</label>
                            <br>

                            <label id="p_title" for="">이메일</label>
                            <label for="">${loginUser.mail }</label>
                            <br>

                            <label id="p_title" for="">휴대전화</label>
                            <input type="text" id="phone" name="phone" value="${loginUser.phone }"><br>

                            <label id="p_title" for="">주소</label>
                            <input type="text" id="address" name="address" value="${loginUser.address }"><br>
                            
                        </div>
                        <br>
                        <div class="btns" align="center">
                            <button type="submit" class="btn-purple">수정하기</button>
                            
                        </div>
                    </form>

                </div>
                
            </div>
        </div>
    </div>

</body>
</html>