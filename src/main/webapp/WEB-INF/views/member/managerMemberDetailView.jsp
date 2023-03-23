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

   
    .member label, #deleteForm label{font-size:18px;margin:5px 50px 30px 5px;}
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
    .memnev{
        margin-bottom:30px;
        font-size: 18px;
        font-weight: bold;
    }
    #phonepop{width:80%; margin:1px 3px 3px 3px;}
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
	<div class="outer">


        <div id="content" style=" " >

            <div class="memnev">
                <a href="memberList.me" style="color:lightgray"> 구성원 </a>
                <a> | ${ m.userName }</a>
            </div>
           
            <div class="profile">
            
                <div class="profileImg" style="float:left">
                	<c:choose>
                		<c:when test="${ empty m.profileImg }">
                			<div class="pro" style="float:left" onclick="$('#profileImgFile').click();">${ m.userName }</div>
		                    <input type="file" id="profileImgFile" style="display:none;">
                    	</c:when>
                    	<c:otherwise>
                    		<img id="profileImg" src="${ m.profileImg }" onclick="$('#profileImgFile').click();">
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
                    <h4>${m.userName }</h4>
                    <h5>${m.department }부</h5>
                    
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
                <a style="color:lightgray">문서</a>
                <hr>
            </div>

            <div class="" style="float:right">
            	<button type="button"  data-toggle="modal" class="btn-purple" data-target="#deleteForm">퇴사처리</button>
                <img src="resources/icons/approval.png" data-toggle="modal" data-target="#updateForm" style="width:20px; margin:1px 3px 3px 20px;">
           </div>

            <div class="member" >
                <label id="p_title" for="">사번</label>
                <label for="">${ m.employeeNo }</label>
                <br>
                
                <label id="p_title" for="">상태</label>
                <label for="">
	                <c:choose>
	               		<c:when test="${ m.status eq 'Y'}">
	               			재직
	               		</c:when>
	               		<c:otherwise>
	               			퇴사
	               		</c:otherwise>
	               	</c:choose>
                </label>
                <br>

                <label id="p_title" for="">입사일</label>
                <label for="">${ m.hireDate }</label>
                <br>
                
                <label id="p_title" for="">소속</label>
                <label for="">${m.department }부</label>
                <br>

                <label id="p_title" for="">직위</label>
                <label for="">${m.position }</label>
                <br>

                <label id="p_title" for="">이메일</label>
                <label for="">${m.mail }</label>
                <br>

                <label id="p_title" for="">휴대전화</label>
                <label for="">${m.phone }</label>
                <br>

                <label id="p_title" for="">주소</label>
                <label for="">${m.address }</label>
                <br>

            </div>
            <br>

        </div>
    </div>

    <!-- 아이콘 클릭시 보여질 프로필변경 Modal -->
    <div class="modal" id="updateForm">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">회원정보수정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" align="center">
                
                    <form action="detailUpdate.me" method="post">
                        <div class="form-group" align="center" style="float:none;">
                            
                            <input type="hidden" id="userPwd" name="userNo" value="${ m.userNo }" >
                            
                            <table style="float:none;" >
                            	<tr height="40px">
                            		<td width="100px">이름</td>
                            		<td><input type="text" id="userName" name="userName" value="${m.userName }"></td>
                            	</tr>
                            	<tr height="40px">
                            		<td>사번</td>
                            		<td>${ m.employeeNo }</td>
                            	</tr>
                            	<tr height="40px">
                            		<td>상태</td>
                            		<td> 
                            			<c:choose>
						               		<c:when test="${ m.status eq 'Y'}">
						               			재직
						               		</c:when>
						               		<c:otherwise>
						               			퇴사
						               		</c:otherwise>
						               	</c:choose>
                            		</td>
                            	</tr>
                            	<tr height="40px">
                            		<td>입사일</td>
                            		<td>${ m.hireDate }</td>
                            	</tr>
                            	<tr height="60px">
                            		<td>소속</td>
                            		<td width="400px">
                            			${m.department }
                            			<input type="number" id="department" name="department" value="${m.departmentNo }" style="width:50px; margin-right:20px; ;"> <br>
								    	<a style="font-size:10px; height:12px">
								    		<c:forEach var="d" items="${ list2 }">
							            	${ d.departmentNo } : ${ d.departmentName } 
							            	</c:forEach>
								    	</a>
                            		</td>
                            	</tr>
                            	<tr height="60px">
                            		<td>직위</td>
                            		<td>
                            			${m.position }
                            			<input type="number" id="position" name="position" value="${m.positionNo }" style="width:50px; margin-right:20px;" ><br>
								    	<a style="font-size:10px; height:12px">
								    		<c:forEach var="p" items="${ list1 }">
							            	${ p.positionNo } : ${ p.positionName } 
							            	</c:forEach>
								    	</a>
                            		</td>
                            	</tr>
                            	<tr height="40px">
                            		<td>이메일</td>
                            		<td>${m.mail }</td>
                            	</tr>
                            	<tr height="40px">
                            		<td>휴대전화</td>
                            		<td><input type="text" id="phone" name="phone" value="${m.phone }"></td>
                            	</tr>
                            	<tr height="40px">
                            		<td>주소</td>
                            		<td><input type="text" id="address" name="address" value="${m.address }"></td>
                            	</tr>
                            </table>
                        </div>
                        
                        <br>
                        
                        <div class="btns" align="center" style="float:none; ">
                            <button type="submit" class="btn-purple">수정하기</button>
                        </div>
                    </form>

                </div>
                
            </div>
        </div>
    </div>
    
    <!-- 퇴사처리 버튼 클릭시 보여질 Modal -->
    <div class="modal" id="deleteForm" style="position: fixed; top: 300px; right: 600px; ">
      		<div class="modal-dialog">
          		<div class="modal-content">
                 <button type="button" class="close" style="font-size:18px; width:30px; height:30px; margin:10px; margin-left:450px;" data-dismiss="modal">X</button>
           
                <!-- Modal body -->
                <div class="modal-body" align="center">
                
                    <b>
			                        퇴사처리 후 복구가 불가능합니다. <br>   
			                        정말 퇴사처리 하겠습니까? <br><br>
                    </b>
					<br>
                    <form action="delete.me" method="post">
                        <input type="hidden" name="userNo" value="${ m.userNo }">
                        <button type="submit" class="btn-purple" > 승인하기</button>
                    </form>

                </div>
               
           	</div>
       	</div>
   	</div>
    
    
    
    
</body>
</html>