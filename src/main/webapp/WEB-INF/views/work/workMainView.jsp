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
	
	.workcategory{
	    width: 100%;
	    margin-bottom: 30px;
	}
	.workcategory>a{
	    font-size: 20px;
	    font-weight: bold;
	    margin-right: 20px;
	    color: lightgray;
	    text-decoration:none;
	}
	
	.workcategory>a:link {color:lightgray; text-decoration:none;}
    .workcategory>a:visited {color:lightgray; text-decoration:none;}
	.workcategory>a:hover{color: black; text-decoration:none;}
	
	.wotitle{
	    /* border: 1px solid black; */
	    height: 30px;
	    width: 100%;
	    font-size: 20px;
	    font-weight: bold;
	    margin-bottom: 20px;
	    margin-top: 40px;
	}
	
	.day{
	    border: 1px solid black;
	    padding: 30px 10px 5px 5px ;
	    font-size:18px;
	    width: 250px;
	    height: 250px;
	}
	
	.day>span{
		font-size:23px;
		font-weight: bold;
		
	}
	
	.day>table{
		font-size:23px;
		
	}
	
	#workstatus{
	    background: rgb(111, 80, 248);
	    color: white;
	    width: 60px;
	    font-size: 15px;
	    height: 30px;
	    border-radius: 2px;
	    padding-top: 3px;
	    margin-top: 15px;
	    margin-bottom: 15px;
	}
	
	.workinfod{
	    border: 1px solid black;
	    width: 30%;
	    margin-right: 30px;
	    font-size: 20px;
	    height:200px;
	}
	
	
	.worklist{
	    
	    margin: 100px 5px 5px 50px;
	}
	
	/* 출퇴근 기록 */
	 .workRecord{
		position: absolute;
        right:120px;
        top: 245px;
	 }
	 #workRecord {
	 	background:rgb(236, 236, 236);
	 	width:400px;
	 	height:200px;
		padding: 10px;
		border-radius: 10px;
	 }
	 #workInfo{ 
		font-size:18px;
		margin-bottom:15px;
	 }
	 #work img{width:60px; height:60px;}
	 #worktag{
		background:white; 
		width:60px; 
		height:25px;
		padding-top:2px;
		padding-left:7px;
		border-radius: 5px;
		font-size: 15px;
	 }

</style>
</head>
<body>
	<!--  -->
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="outer">


        <div id="content" style=" " >

			<div onclick="workback();">
				<h2 style="font-weight:bold">근무</h2>
				<br>
			</div>
           
            <div class="workcategory" style="float:left;" >
                <a href="workList.wo?no=${loginUser.userNo }" >출퇴근기록</a>
				<a href="holiInfo.ho?no=${loginUser.userNo }" >휴가현황</a>
                <a href="holiApply.ho?no=${loginUser.userNo }">휴가신청</a>
                
                
                <br>
            </div>
			<div class="workcategory mworkcategory">
				<!-- 관리자만 보이게 할거임 -->
				<a href="memberWork.wo">구성원근무</a>
				<a href="memberHoli.ho">전사원휴가현황</a>
				<a href="holiGive.ho">휴가지급|회수</a>
				<a href="holiApprove.ho">휴가승인</a>
			</div> 
            
            
            <script>
				$(function(){
	        		
	        		$(".mworkcategory").hide();
	        		
	        		var a = "${loginUser.authorityNo}";
	        		
	
	        		if (a.includes('2') || a.includes('0')) {
	        			$(".mworkcategory").show();
	       			} else {
	       				
	       			}
	        	})
			</script>

            <br>
            
            <div class="workinfo" style="margin-top:30px;">
               <table style="float:left;">
                    <tr style="font-size: 20px;" >
                        <th height="50px" width="440px" >월근태현황</th>
                        <th width="445px">휴가현황</th>
                        <th width="300px">출퇴근기록</th>
                    </tr>
               </table>

               <div class="workinfod" style="float:left; margin-top:10px">
                    <table align="center" style="margin-top:10px">
                        <tr align="center">
                            <td height="100px" width="100px"> 지각</td>
                            <td width="100px"> 조기퇴근 </td>
                            <td width="100px">결근</td>
                        </tr>
                        <tr align="center">
                            <td height="50px">${ w. behindtime}회</td>
                            <td>${w.leavearly}회</td>
                            <td>${w.absenteeism}회</td>
                        </tr>
                    </table>
               </div>

               <div class="workinfod" style="float:left; margin-top:10px;" >
                <table align="center" style="margin-top:10px" >
                    <tr align="center">
                        <td height="100px" width="100px"> 지급연차 </td>
                        <td width="100px"> 사용연차 </td>
                        <td width="100px"> 잔여연차 </td>
                       
                    </tr>
                    <tr align="center">
                        <td>${ m.giveDay + m.addDay }일</td>
                        <td>${ m.useDay }일</td>
                        <td>${ m.giveDay + m.addDay + m.useDay }</td>
                        
                    </tr>
                </table>
                </div>

                <!-- 출퇴근 기록 -->
				<div class="workRecord" >
					<div><h4 style="font-weight:bold"></h4></div>
					<div id="workRecord">
						<table style="margin-left:10px;">
							<tr>
								<th id="workDate" style="font-size:20px;"> </th>
							</tr>
							<tr>
								<th style="font-size:20px;"><div id='clock'></div></th>
							</tr>
						</table>
						<table  id='work'  align='center'>
							<tr align='center'>
								<td width='150px' height='70'>
									<img onclick='workIn();' src='resources/icons/working.png'>
								</td>
								<td width='150px'>
									<img onclick='workOut();' src='resources/icons/office-chair.png'>
								</td>
							</tr>
							<tr align='center'>
			                    <td>출근하기</td>
			                    <td>퇴근하기</td></tr>
		                    <tr align='center'>
			                    <td id="workInTime"></td>
			                    <td id="workOutTime"></td>
		                    </tr>
	                    </table>
								<script>
			
									$(function(){
										selectWorkRecord();
										init();
										
									});
									
									function selectWorkRecord(){
										$.ajax({
											url:"workRecord.wo",
											data:{no:${loginUser.userNo}},
											success:function(map){
												
												let date =map.w.workDate
												let workIn =map.w.workIn
												let workOut = map.w.workOut
												
												$("#workDate").html(date);
												$("#workInTime").html(workIn);
												$("#workOutTime").html(workOut);
												
											},error:function(){
												console.log("출근기록조회실패")
											}
										});
										
									}
									
									function getClock() {
										
									    var date = new Date();
									    var hours = date.getHours();
									    var minutes  = date.getMinutes();
									    var seconds  = date.getSeconds();
									    
									    
									    if (("" + hours).length == 1) {
									    	hours = "0" + hours;
									    }
									    if (("" + minutes).length == 1) {
									    	minutes = "0" + minutes;
									    }
									    
									    if (("" + seconds).length == 1) {
									    	seconds = "0" + seconds;
									    }
									    
									    document.getElementById("clock").innerHTML =hours + ":" + minutes + ":" + seconds;
									    //return hours + ":" + minutes + ":" + seconds;
									    
									}
									
									function init() {
										getClock();
									    setInterval(getClock, 1000); //1초
									}
									
									function workIn(){
									  	var date = new Date();
									    var hours = date.getHours();
									    
										if(hours < 10 ) {
											$.ajax({
												url:"workIn.wo",
												data:{no:${loginUser.userNo}},
												success:function(){
												},error:function(){
												}
											});
											
											location.reload();
											alert("${loginUser.userName}님 환영합니다.");
											
										}else {
											$.ajax({
												url:"workInLate.wo",
												data:{no:${loginUser.userNo}},
												success:function(){
												},error:function(){
												}
											});
											
											location.reload();
											alert("[지각]${loginUser.userName}님 환영합니다.");
											
										}
									}
									
									
									function workOut(){
										
										var date = new Date();
									    var hours = date.getHours();
									    
									    if(hours <19){
									    	$.ajax({
												url:"workOutEarly.wo",
												data:{no:${loginUser.userNo}},
												success:function(){
												},error:function(){
												}
											});
											
											location.reload();
											
											alert("[조퇴]${loginUser.userName}님 수고하셨습니다.");
									    }else{
									    	$.ajax({
												url:"workOut.wo",
												data:{no:${loginUser.userNo}},
												success:function(){
												},error:function(){
												}
											});
											
											location.reload();
											
											alert("${loginUser.userName}님 수고하셨습니다.");
									    }
									}
				
								</script>
					</div>
				</div>



            </div>
            <br>

            <div class="wotitle" style="float:left;"> 출퇴근기록</div>
			
			<c:forEach var="list1" items="${ list1 }" end="4">
	            <div class="day"  align="center" style="float:left">
	                <span> ${list1.workDate }</span> <br>
	                <div id="workstatus"> ${list1.status } </div>
	               
	                
	                <table border="1" >
	                    <tr align="center">
	                        <td width="100px" >출근</td>
	                        <td width="100px" >${list1.workIn }</td>
	                    </tr>
	                    <tr align="center">
	                        <td >퇴근</td>
	                        <td>${list1.workOut }</td>
	                    </tr>
	                </table>
	            </div>
            </c:forEach>
           
            
            <div class="worklist" style="float:left" onclick="location.href='workList.wo?no=${loginUser.userNo }'"> 
                
                o o o  
            
            </div>
           

          
		</div>
        
	</div>
</body>
</html>