<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PPIC</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>  
<style>
	 /* 출퇴근 기록 */
	 #calendartitle{
	 	position: absolute;
        left:40px;
        top: 40px;
        font-size : 25px;
        font-weight:bold;
	 }
	 .workRecord{
		position: absolute;
        right:5px;
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
	 
	 /* 회사일정 */
	 :root {
	  --fc-color: black;
	  --fc-daygrid-event-dot-width: 10px;
	  --fc-neutral-text-color: black;
	  --fc-more-link-text-color: #808080;
	  --fc-button-bg-color: #6F50F8;
  	  --fc-button-border-color: #6F50F8;
  	  --fc-button-hover-bg-color: #6F50F8;
  	  --fc-button-hover-border-color: #6F50F8;
  	  --fc-button-active-bg-color: #6F50F8;
  	  --fc-button-active-border-color: #6F50F8;
	}
	.fc-daygrid-day-number{
		text-decoration:none;
		color:black;
	}
	.fc-daygrid-day-number:hover{
		text-decoration:none;
		color:black;
	}
	.fc-col-header-cell-cushion{
		text-decoration:none;
		color:black;
	}
	.fc-col-header-cell-cushion:hover{
		text-decoration:none;
		color:black;
	}
	
	#noticeMainDiv{
		position:absolute; 
		right:5px; 
		top:350px;
	}
	#noticeMainDiv>span{
		float:right;
		font-size:12px;
		line-height:35px;
		cursor:pointer;
	}
	#noticeMainDiv>div{
		background:rgb(236, 236, 236); 
		 height:300px; 
		 width:400px; 
		 border-radius: 10px; 
		 font-size:13px; 
		 margin-top:5px;
		 padding-top:17px;
	}
	#noticeMain{
		width:100%;
		height:80%;
	}
	#noticeMain tr:hover{background:rgb(230,230,230);}
	#noticeMain td{
		padding:5px 15px;
		cursor:pointer;
	}
</style>
</head>	
<body>

<jsp:include page="../common/menubar.jsp" />
	
	<div class="outer">
        <div id="content" >
        
        	<!-- 회사 일정 -->
			<div class="schedule" >
				<div id="calendartitle">회사일정</div>
				<div id='calendar' style="float:left; width:70%; height:200px;"></div>
			 
			
				<script>
				    document.addEventListener('DOMContentLoaded', function() {
				    	
				    	$.ajax({
		       				url: "scheduleCalendar.sch",
		       				async: false, 
		       				dataType:'JSON',
		       				success: function(map) {
		       					
		       					var events = [];
		       					var list = map.list
		       					
		       					for (i=0; i<list.length; i++){
		       						if(list[i].schKind == 0){
		       							events.push({
				       						title:list[i].title,
				       						start:list[i].start,
				       						end:list[i].end,
				       						color:'#F78181',
				       						textColor:'#FFFFFF'
				       					});
		       						}else{
		       							events.push({
				       						title:list[i].title,
				       						start:list[i].start,
				       						end:list[i].end,
				       						color:'#BE81F7'
				       					});
		       						}
			       					
		       					}
		       					
		       					
		       					console.log(events);
		       					
		       					
		       					var calendarEl = document.getElementById('calendar');
		    			    	var calendar = new FullCalendar.Calendar(calendarEl, {
		    			    		themeSystem: 'bootstrap5',
		    			    		initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		    			    		headerToolbar : { // 헤더에 표시할 툴 바
		    			    			start : '',
		    			    			center : 'title',
		    			    			end : 'prev next'
		    			    		},
		    			    		titleFormat : function(date) {
		    			    			return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
		    			    		},
		    			    		//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
		    			    		nowIndicator: true, // 현재 시간 마크
		    			    		locale: 'ko', // 한국어 설정
		    			   			events:events,
		    			   			eventTextColor :'#FFFFFF',
		    			    		height: 670
		    			    	});
		    			    	calendar.render();
		       				}
	       				});
				    	
				    });
	    		</script>  
				
			</div>
        	
			
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
			<div id="noticeMainDiv">
				<b style="font-size:24px;">공지사항</b>
				<span onclick="location.href='list.no'">전체보기</span><br>
				<div>
					<table id="noticeMain">
						<tbody></tbody>
					</table>
				</div>
			</div>
        </div>
    </div>

	<script>
		$(function(){
			$.ajax({
				url:"notice.main",
				success:function(list){
					let value = "";
					for(let i=0; i<list.length; i++){
						value += "<tr id='" + list[i].noticeNo + "'>"
								+ "<td>"
								if(list[i].important == 'Y'){
									value += "📢 "
									  		+ "<b>"
									if(list[i].noticeTitle.length <= 16){
										value += list[i].noticeTitle
									}else{
										value += list[i].noticeTitle.substring(0, 16) + "..."
									} 
									value += "</b>"
								}else{
									if(list[i].noticeTitle.length <= 16){
										value += list[i].noticeTitle
									}else{
										value += list[i].noticeTitle.substring(0, 16) + "..."
									} 
								}
								value += "</td>"
								+ "<td style='text-align:right'>" + list[i].createDate + "</td>"
								+ "</tr>"
					}
					console.log(value)
					$("#noticeMain tbody").html(value)
				}
			})
		})
		
		$(document).on("click", "#noticeMain tr", function(){
			location.href = "detail.no?no=" + $(this).attr("id");
		})
	</script>
</body>
</html>


