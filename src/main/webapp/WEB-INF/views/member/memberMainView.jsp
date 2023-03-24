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
	
	.memberCategory{width: 100%; margin-bottom: 30px;}
	
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
	
	.mpro{
        width: 50px;
        height: 50px;
        background: rgb(111, 80, 248);
        color: white;
        border: none;
        border-radius: 10px;
        padding-top: 13px;
        margin-left:5px
    }
    
    #profileImg{
        width:50px;
        height:50px;
        background: rgb(111, 80, 248);
        border-radius: 10px;
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

    .member{width: 100%; margin-right: 30px;}
    
    .memberList {overflow:auto; height:500px;}
    .memberList::-webkit-scrollbar { width: 8px; }
	.memberList::-webkit-scrollbar-thumb {background: lightgray; border-radius: 10px;}
	
    #list th td{width:25%;}
    #list thead tr {height:50px;}
    #list tbody tr {height:70px;}

    .v-line{
        border-left: thin solid lightgray;
        height:70%;
        left: 50%;
        position: absolute;
        margin-left: 275px;
    }

    
    
	
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
               <a href="memberList.me" >구성원</a>
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
				    
				</div>
			               
				<div class="memberList">
					<table id="list">
						<tbody >
							<c:forEach var="d" items="${ list2 }" >
								<tr>
		                            <th colspan="2" style="font-size:20px;">${ d.departmentName }부</th>
		                        </tr>
								<c:forEach var="m" items="${ list1 }" >
									<c:if test="${ d.departmentName eq m.department }">
									<tr align="center" class="mlist">
										<td width="80%">
											<div class="bno" style="display:none;">${ m.userNo }</div>
											<c:choose>
							              		<c:when test="${ empty m.profileImg }">
							              			<div class="mpro" style="float:left" >${ m.userName }</div>
							                  	</c:when>
							                  	<c:otherwise>
							                  		<img id="profileImg" src="${ m.profileImg }" style="float:left" >
							                  	</c:otherwise>
							                </c:choose>
											<div class="proname" >${ m.userName }</div>
										</td>
										<td>
										    <div class="position" style="float:right" > ${ m.department }부 | ${ m.position } </div>
										</td>
									</tr>
									</c:if>
								</c:forEach>
							</c:forEach>
			        	</tbody>
			    	</table>
			    	
			    	<script>
		            	$(function(){
		            		$(".mlist").click(function(){
		            			location.href = 'memberDetail.me?no=' + $(this).find(".bno").text(); ;
		            		})
		            	})
		            </script>
			    	
				</div> 
			    
			
			
			</div>

                
              
                
            </div>
			
			
			  

        </div>
    	
	
</body>
</html>