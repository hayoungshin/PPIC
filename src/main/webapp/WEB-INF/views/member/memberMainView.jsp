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

    .member{width: 70%; margin-right: 30px;}
    
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

    .organizationchart{ width:25%; padding: 20px;}

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
               <a href="memberList.me" >구성원</a>
               <a href="memberAuth.me">권한설정</a>
               
                <br>
            </div>

			
			<br><br><br>
	
			
                
			<div class="member" style="float:left">
			
				<div>
				    <div style="float:left; font-size: 18px; font-weight: bold; width:200px;">전체</div>
				
					<div style="float:right; margin-right:20px;">
						<img src="resources/icons/up-down.png" style="width:25px; ">
					</div>
					
					<div style="float:right; margin-right:10px;">
						<img src="resources/icons/search.png" style="width:25px; ">
					</div>
					
					<br><hr>
				</div>
			               
				<div class="memberList">
					<table id="list">
						<tbody align="center">
							<c:forEach var="m" items="${ list }" >
								<tr>
									<td width="80%">
										<div class="pro" style="float:left" >${ m.userName }</div>
										<div class="proname" >${ m.userName }</div>
									</td>
									<td>
									    <div class="position" style="float:right" > ${ m.department } | ${ m.position } </div>
									</td>
								</tr>
							</c:forEach>
							
							<script>
								function proname(){
									
								}
							</script>
			        	</tbody>
			    	</table>
				</div> 
			    
			
			
			</div>

                <div class="v-line"></div>
                
                <div class="organizationchart" style="float:left">
                    <div id="org">조직도</div>
					<div class="depttitle"> 전체 구성원 (00) </div>
                    <div class="deptlist">
                        <div> 00부 (00) </div>
                        <div> 00부 (00) </div>
                        <div> 00부 (00) </div>
                    </div>
                </div>
                
            
                <script>
                    /* td 클릭시 모달창 */
                </script>

            </div>
			
			
			  

        </div>
    	
	
</body>
</html>