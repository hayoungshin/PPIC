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
                <a href="memberList.me" style="color:black;" >구성원</a>
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
                        
                        <tbody align="center">
                        	<c:forEach var="m" items="${ list1 }" >
	                            <tr>
	                                <td > ${ m.userName } </td>
	                                <td >재직|퇴직</td>
	                                <td >${ m.employeeNo }</td>
	                                <td >${ m.hireDate }</td>
	                                <td >${ m.resignDate }</td>
	                                <td >${ m.department }부</td>
	                                <td >${ m.position }</td>
	                                <td >${ m.phone }</td>
	                                <td >${ m.mail }</td>
	                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    <script>
					    /* td 클릭시 모달창 */
					</script>
					
				</div>
				
			</div>

            <div class="v-line"></div>
            
            <div class="organizationchart" style="float:left">
                <div id="org">조직도</div>
				<div class="depttitle"> 전체 구성원 (00) </div>
                <div class="deptlist">
                  	<c:forEach var="d" items="${ list2 }" >
						 <div> ${ d.departmentName }부 (00) </div>
					</c:forEach>
                </div>
            </div>
                
            
			

            </div>
			
	</div>
    	
	
</body>
</html>