<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PPIC</title>
<style>

	<!-- 카테고리 css -->
	
	.memberCategory{
	    width: 100%;
	    margin-bottom: 30px;
	}
	.memberCategory>a{
	    font-size: 20px;
	    font-weight: bold;
	    margin-right: 20px;
	    color: lightgray;
	    text-decoration:none;
	}
	
	.memberCategory a:link {color:lightgray; text-decoration:none;}
    .memberCategory a:visited {color:lightgray; text-decoration:none;}
	.memberCategory a:hover{color: black; text-decoration:none;}
	
	/* content */
	
	.pro{
        width: 50px;
        height: 50px;
        background: rgb(111, 80, 248);
        color: white;
        border: none;
        border-radius: 10px;
        padding-top: 13px;
        margin-left:5px
    }

    .proname{
    	float:left; 
    	margin-top: 10px; 
    	margin-left: 10px; 
    	font-size: 20px; 
    	font-weight: bold;"
    }

    .position{
        width: 200px;
        height: 50px;
        background: rgb(221, 221, 221);
        color: black;
        border: none;
        border-radius: 35px;
        padding-top: 13px;
        margin-left:5px;
        margin-right:20px;
    }

    .member{
        width: 100%;
        margin-right: 30px;
    }
    
    .memberList { overflow:auto; height:500px; white-space: nowrap;}
    .memberList::-webkit-scrollbar { width: 8px; }
	.memberList::-webkit-scrollbar-thumb {background: lightgray; border-radius: 10px;}
    
    #list {width:95%; margin-left:10px;}
   
    #list thead td{border: 1px solid darkgray;}
	#list thead td:first-child {border-left: 0;}
	#list thead td:last-child {border-right: 0;}
    
    #list thead tr {height:30px; }
    #list tbody tr {height:70px; }
    
    #list tbody{ overflow:auto; height:450px; white-space: nowrap; }
  
	.v-line{
        border-left: thin solid lightgray;
        height:70%;
        left: 50%;
        position: absolute;
        margin-left: 275px;
    }

	
	
	/* modal */
	
	.form-group select { width:150px; margin-left:20px;}
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />	
	
	<div class="outer">


        <div id="content" style=" " >

            <div onclick="workback();">
				<h2 style="font-weight:bold">구성원</h2>
				    <br>
			</div>
			
			<script>
				function workback(){
					location.href="memberMain.me"
				}
			</script>
           
			<div class="memberCategory" style="float:left;" >
	                <a href="memberList.me" >구성원</a>
	                <a href="memberAuth.me" style="color:black;" >권한설정</a>
                <br>
            </div>
            
            <script>
				$(function(){
	        		
	        		$(".memberCategory").hide();
	        		
	        		var a = "${loginUser.authorityNo}";
	        		
	
	        		if (a.includes('4') || a.includes('0')) {
	        			$(".memberCategory").show();
	       			} else {
	       				
	       			}
	        	})
			</script>

			<br><br><br>
			
			<div class="member" style="float:left">
			
				<div>
				    <div style="float:left; font-size: 18px; font-weight: bold; width:200px;">전체</div>
				
					<button class="btn-purple" style="float:right; margin-right:20px;" data-toggle="modal" data-target="#authUpdate">권한추가</button>
					
					<div style="float:right; margin-right:20px;">
						
					</div>
					
					<div style="float:right; margin-right:10px;">
						
					</div>
					
					
					
					<br><hr>
				</div>
			               
				<div class="memberList">
					
					<table id="list"  style="width:95%">
                        <thead>
                            <tr style="height:50px">
                                <th width="20%">이름</th>
                                <th width="10%">소속</th>
                                <th width="10%">직급</th>
                                <th width="40%">권한</th>
                            </tr>
                        </thead>
                        <tbody style="height:60px">
	                        <c:forEach var="m" items="${ list2 }">
								<tr>
	                                <td>
	                                    <div class="proname"> ${m.userName }</div>
	                                </td>
	                                <td> ${m.department }</td>
	                                <td> ${m.position }</td>
	                                <td> 
	                                	<c:forEach items="${m.authority}" var="auth">
	                                		<c:choose>
	                                			<c:when test="${auth eq '0'}"> all </c:when>
	                                			<c:when test="${auth eq '1'}"> 메일 </c:when>
	                                			<c:when test="${auth eq '2'}"> 근무 </c:when>
	                                			<c:when test="${auth eq '3'}"> 회사소식 </c:when>
	                                			<c:when test="${auth eq '4'}"> 구성원 </c:when>
	                                			<c:when test="${auth eq '5'}"> 전자결재 </c:when>
	                                			<c:when test="${auth eq '6'}"> 문서 </c:when>
	                                			<c:when test="${auth eq '7'}"> 예약 </c:when>
	                                			<c:when test="${auth eq '8'}"> 업무 </c:when>
	                                			<c:otherwise>없음</c:otherwise>
	                                		</c:choose>
	                                	</c:forEach>
	                                </td>
	                            </tr>
							</c:forEach>
                        </tbody>
                    </table>
					
				</div>
				
			</div>

              
		</div>
			
	</div>
	
	<!-- 권한 추가 Modal -->
	    <div class="modal" id="authUpdate">
	        <div class="modal-dialog">
	            <div class="modal-content">
	            
	                <!-- Modal Header -->
	                <div class="modal-header">
	                <h4 class="modal-title">권한추가</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                </div>
	                
	                <!-- Modal body -->
	                <div class="modal-body" style="padding:50px; font-size:18px;">
	                
	                    <form action="authUpdate.me" method="post" >
	                        <div class="form-group">
	                        	<input type="hidden" id="userId" name="userId" value="${ loginUser.userId }" >
                            	<input type="hidden" id="userPwd" name="userPwd" value="${ loginUser.userPwd }" >
	                            <label>이름 </label>
	                            <select class="dept" name="dept" id="dept">
							    	<option value="">소속</option>
							    	<c:forEach var="d" items="${ list3 }">
						            	<option value="${ d.departmentNo }"> ${ d.departmentName }</option>
						            </c:forEach>
							    </select>
							    
							    <select class="userNo" name="userNo" id="userNo">
							    	<option value="">이름</option>
							    	<c:forEach var="m" items="${ list1 }">
							    			<option value="${m.userNo}" value2="${m.departmentNo}" value3="${m.position}" style="display:none;">[${m.position}] ${m.userName}</option>
							    	</c:forEach>
						        </select>
						        
						        <script>
						        	
							        $("#dept").change(function(){
							          var selectedDept = $("#dept option:selected").val();
							          $("#userNo option").each(function(){
							              if($(this).attr("value2") == selectedDept){
							               $(this).css("display", "block");
							              }else{
							                $(this).css("display", "none");
							              }
							            })
							        })
			
						        </script>
	
	                            <br><br>
	
	                            <label for="">권한</label> <br><br>
		                            <div style="float:none;">
		                            	<table style="font-size:15px;" id="authupdate">
		                            		<tr height="30px">
		                            			<td colspan="4">
		                            				<input type="checkbox" name="auth" value="0"> <label>all</label> 
		                            			</td>
		                            		</tr>
		                            		<tr height="30px">
		                            			<td width="90px">
		                            				 <input type="checkbox" name="auth" value="1"> <label>메일</label> 
		                            			</td>
		                            			<td width="90px">
		                            				<input type="checkbox" name="auth" value="2"> <label>근무</label> 
		                            			</td>
		                            			<td width="90px">
													<input type="checkbox" name="auth" value="3"> <label>회사소식</label>		                            			</td>
		                            			<td width="90px">
		                            				<input type="checkbox" name="auth" value="4"> <label>구성원</label> 
		                            			</td>
		                            		</tr>
		                            		<tr height="30px">
		                            			<td >
		                            				<input type="checkbox" name="auth" value="5"> <label>전자결제</label> 
		                            			</td>
		                            			<td >
		                            				<input type="checkbox" name="auth" value="6"> <label>문서</label> 
		                            			</td>
		                            			<td >
		                            				<input type="checkbox" name="auth" value="7"> <label>예약</label> 
		                            			</td>
		                            			<td >
		                            				<input type="checkbox" name="auth" value="8"> <label>업무</label> 
		                            			</td>
		                            		</tr>
		                            	</table>
		                            	
		                            	<script>
					                      	  $(function(){
						                      		var chk_arr = $("input[name='auth']");
	
						                            var chk_data = [];
						                            for( var i=0; i<chk_arr.length; i++ ) {
						                                if( chk_arr[i].checked == true ) {
						                                    chk_data.push(chk_arr[i].value);
						                                }
						                            }
						                            
						                            console.log(che_data);
					                      	  })
				                     	</script>
		                            	
		                            	
		                            </div>
	                            	
	                        </div>
	                        <br>
	                        <div class="btns" align="center">
	                            <button type="submit" class="btn-purple btn-holi">적용하기</button>
	                        </div>
	                    </form>
						
	                </div>
	                
	            </div>
	        </div>
	    </div>
    	
	
</body>
</html>