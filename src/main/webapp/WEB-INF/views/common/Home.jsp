<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PPIC</title>
<style>
	 /* 출퇴근 기록 */
	 .workRecord{
		position: absolute;
        right:0px;
        top: 50px;
	 }
	 #workRecord {
	 	background:rgb(236, 236, 236);
	 	width:400px;
	 	height:250px;
		padding: 10px;
		border-radius: 10px;
	 }
	 #workInfo{ 
		font-size:18px;
		margin-bottom:15px;
	 }
	 #work img{width:80px; height:80px;}
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

<jsp:include page="../common/menubar.jsp" />
	
	<div class="outer">
        <div id="content" >
        
			
            <!-- 출퇴근 기록 -->
			<div class="workRecord" >
				<div><h4 style="font-weight:bold">근무체크</h4></div>
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
							<td width='150px' height='100'>
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
							
				</div>
			</div>
			
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
				    
					if(hours < 9 ) {
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
				    
				    if(hours <18){
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

    

</body>
</html>


