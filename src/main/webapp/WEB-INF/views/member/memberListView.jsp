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
        width: 70%;
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

	.organizationchart{ width:25%; padding: 10px; }

    #org{
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 30px;
    }

    .depttitle{ font-size: 15px; font-weight: 600; }

    .deptlist{
        font-size: 15px;
        font-weight: 600;
        margin-top:20px;
        margin-left: 20px;
    }

    .deptlist div{ margin-bottom: 10px; }
	
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
                
                <!-- 관리자만 보이게 할거임 -->
                <a href="memberList.me" style="color:black;" >구성원</a>
                <a href="memberAuth.me">권한설정</a>
               
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
				
					<div style="float:right; margin-right:20px;">
						
					</div>
					
					<div style="float:right; margin-right:10px;">
						
					</div>
					
					<br><hr>
				</div>
			               
			<div class="memberList">
				<table id="list">
                        <thead align="center">
                            <tr>
                               <td width="150" rowspan="2">이름</td>
                               <td colspan="4">기본정보</td>
                               <td colspan="2">인사정보</td>
                               <td colspan="2">개인정보</td>
                            </tr>
                            <tr>
                                <td width="150">상태</td>
                                <td width="150">사번</td>
                                <td width="150">입사일</td>
                                <td width="150">퇴사일</td>
                                <td width="150">소속</td>
                                <td width="150">직위</td>
                                <td width="150">전화번호</td>
                                <td width="150">이메일</td>
                            </tr>
                        </thead>
                        
                        <tbody id="ajaxmember" align="center">
                        	
                        </tbody>
                    </table>
                    </div>
				
			</div>
			
			

            <div class="v-line" style="float:left"></div>
            
            <div class="organizationchart" style="float:left">
                <div id="org">사용승인</div>
                <div class="deptlist">
                  	<table >
	                		<tr  align="center">
	                   			<td width="80px">이름</td>
	                   			<td width="80px">부서</td>
	                   			<td width="80px">직위</td>
	                   			<td width="150px">승인</td>
	                    	</tr>
	                    	<c:forEach var="m" items="${ list1 }" >
	                    		
	                    		<tr height="50px" align="center">
	                    			<td>${ m.userName } </td>
	                    			<td>${ m.department }</td>
	                    			<td>${ m.position }</td>
	                    			<td> 
	                    				<button type="button" onclick="newMember(${ m.userNo},'Y');" class="btn-purple" style="float:none">승인</button> 
	                    				<button type="button" onclick="newMemberdelete(${ m.userNo},'N');">거절</button> 
	                    			</td>
	                    		</tr>
		                    		
							</c:forEach>
							
						</table>
                </div>
            </div>
            
            <script>
				$(function(){
					selectMemberList();
					
					trans();
				});
				
				function selectMemberList(){
					$.ajax({
						url:"ajaxMemberList.me",
						async: false, 
						success:function(map){
							
							let value=""
							if(map.list1.length == 0 ){
								value += "<div id='listnone' align='center'>"
									+		"<img id='none' src='resources/icons/smile.png' width='200'>" + "<br>"
									+		"구성원 목록이 없습니다"
									+	 "</div>";
							}else {
								for(let i=0; i<map.list1.length; i++){
									value += "<tr onclick='memberdetail("+ map.list1[i].userNo +");'>" 
										+		"<td>"
				                        +    		map.list1[i].userName + "<div class='bno' style='display:none;'>" + map.list1[i].userNo + "</div>"
										+		"</td>"
										+		"<td>";
										 			if(map.list1[i].status == 'Y'){
										 				value += "재직"; 	
										 			}else{
										 				value += "퇴직";
										 			}
									value += 	"</td>"
					                    +       "<td>";
					                				if(map.list1[i].employeeNo != null){
					                					value += map.list1[i].employeeNo ;
					                				}else{
					                					value += "-";
					                				}
					                value +=	"</td>"
					                	+       "<td>";
	                								if(map.list1[i].hireDate != null){
	                									value += map.list1[i].hireDate ;
	                								}else{
	                									value += "-";
	                								}
	                				value +=	"</td>"	
	                					+       "<td>";
				    								if(map.list1[i].resignDate != null){
				    									value += map.list1[i].resignDate ;
				    								}else{
				    									value += "-";
				    								}
				    				value +=	"</td>"	
					                    +       "<td>"+ map.list1[i].department +"</td>"
					                    +       "<td>"+ map.list1[i].position +"</td>"
					                    +       "<td>";
													if(map.list1[i].phone != null){
														value += map.list1[i].phone ;
													} else {
														value += "-";	
													}
									value +=	"</td>"
					                    +       "<td>"+ map.list1[i].mail +"</td>"
										+ 	"</tr>";
									}
							}	
						
							$("#ajaxmember").html(value);
							
						},error:function(){
							console.log("기록조회실패")
						}
					});
				};
				
				function memberdetail(a){
					var a = a;
					location.href = 'managerDetail.me?no=' + a;
				}
				
				
				
				
			</script>
                
		</div>
			
	</div>
	
	
	
    <div class="modal" id="updateForm" style="position: fixed; top: 300px; right: 600px; ">
      		<div class="modal-dialog">
          		<div class="modal-content">
                
                <!-- Modal Header -->
                <div >
	                <button type="button" class="close" data-dismiss="modal" style="padding:10px;">&times;</button>
                </div>
           		
                <!-- Modal body -->
                <div class="modal-body" align="center">
                	
	                    				
						<b>
				                        사용 <span name="status"></span> 전입니다 <br>   
				                        정말로 <span name="status"></span>하시겠습니까? <br><br>
	                    </b>
						<br>
	                    <form action="newMemberUpdate.me" method="post">
	                        
	                        <input type="hidden" name="userNo" value="">
	                        <input type="hidden" name="memberSign" value="">
							
	                        <button type="submit" class="btn-purple" >확인</button>
	                    </form>
	                    	
                </div>
               
           	</div>
       	</div>
   	</div>	
   	
   	<div class="modal" id="deleteForm" style="position: fixed; top: 300px; right: 600px; ">
      		<div class="modal-dialog">
          		<div class="modal-content">
                
                <!-- Modal Header -->
                <div >
	                <button type="button" class="close" data-dismiss="modal" style="padding:10px;">&times;</button>
                </div>
           		
                <!-- Modal body -->
                <div class="modal-body" align="center">
                	
	                    				
						<b>
				                        가입자 <span name="status"></span> 전입니다 <br>   
				                        정말로 <span name="status"></span>하시겠습니까? <br><br>
	                    </b>
						<br>
	                    <form action="newMemberDelete.me" method="post">
	                        
	                        <input type="hidden" name="userNo" value="">
	                        <input type="hidden" name="memberSign" value="">
							
	                        <button type="submit" class="btn-purple" >확인</button>
	                    </form>
	                    	
                </div>
               
           	</div>
       	</div>
   	</div>	
	
	<script>
		function newMember(a,b){
			var a = a;
			var b = b;
			$('#updateForm').show();
			
			$(document).on("click",".close",function(){ 
				$('#updateForm').hide();
			});
	  			
	  		
	  		$('input[name=userNo]').attr('value',a);
	  		$('input[name=memberSign]').attr('value',b);
	  		
	  		if(b=='Y'){
	  			$('span[name=status]').text('승인');
	  		}else {
	  			$('span[name=status]').text('거절');
	  		}
	  		
		}
		
		function newMemberdelete(a,b){
			var a = a;
			var b = b;
			$('#deleteForm').show();
			
			$(document).on("click",".close",function(){ 
				$('#deleteForm').hide();
			});
	  			
	  		$('input[name=userNo]').attr('value',a);
	  		$('input[name=memberSign]').attr('value',b);
	  		
	  		if(b=='Y'){
	  			$('span[name=status]').text('승인');
	  		}else {
	  			$('span[name=status]').text('삭제');
	  		}
	  		
		}
	</script>

	
	
</body>
</html>