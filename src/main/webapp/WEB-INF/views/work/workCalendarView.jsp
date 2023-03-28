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

	<!-- 카테고리 css -->
	
	.workcategory{
	    width: 100%;
	    margin-bottom: 10px;
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
	
	
	#calender{
		color:black;
	}
	:root {
	  --fc-color: black;
	  --fc-daygrid-event-dot-width: 10px;
	  --fc-neutral-text-color: black;
	  --fc-more-link-text-color: #808080;
	  --fc-button-bg-color: #9a87ed;
  	  --fc-button-border-color: #9a87ed;
  	  --fc-button-hover-bg-color: #9a87ed;
  	  --fc-button-hover-border-color: #9a87ed;
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
	
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />	
	
	<div class="outer">


        <div id="content" style=" " >

            <div onclick="workback();">
				<h2 style="font-weight:bold">근무</h2>
				    <br>
			</div>
			
			<script>
				function workback(){
					location.href="workMain.wo?no="+${loginUser.userNo }
				}
			</script>
           
            <div class="workcategory" style="float:left;  " >
                <a href="workList.wo?no=${loginUser.userNo }" style="color:black;">출퇴근기록</a>
				<a href="holiInfo.ho?no=${loginUser.userNo }" >휴가현황</a>
                <a href="holiApply.ho?no=${loginUser.userNo }">휴가신청</a>
                
                
                
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
			
			<br><br>
			
	
			
			<!-- calendar 태그 -->
			<div id='calendar' style="float:left; width:90%; height:200px;"></div>
			 
			
			<script>

			    document.addEventListener('DOMContentLoaded', function() {
			    	
			    	$.ajax({
	       				url: "workCalendar.wo",
	       				data:{no:${loginUser.userNo}},
	       				async: false, 
	       				dataType:'JSON',
	       				success: function(map) {
	       					
	       					var events = [];
	       					var list1 = map.list1
	       					var list2 = map.list2
	       					
	       					for (i=0; i<list1.length; i++){
	       						if(list1[i].title != null){
	       							events.push({
			       						title:list1[i].title,
			       						start:list1[i].start,
			       						color:'#BE81F7'
			       					});
	       						}else{
	       							events.push({
			       						title:"출근전",
			       						start:list1[i].start,
			       						color:'#BE81F7'
			       					});
	       						}
		       					
	       					}
	       					
	       					for (i=0; i<list2.length; i++){
	       						if(list2[i].title != null){
	       							events.push({
			       						title:list2[i].title,
			       						start:list2[i].start,
			       						color:'#F5A9A9'
			       					});
	       						}else{
	       							events.push({
			       						title:"퇴근 전",
			       						start:list2[i].start,
			       						color:'#F5A9A9'
			       					});
	       						}
	       						
	       					}
	       					
	       					console.log(events);
	       					
	       					
	       					var calendarEl = document.getElementById('calendar');
	    			    	var calendar = new FullCalendar.Calendar(calendarEl, {
	    			    		themeSystem: 'bootstrap5',
	    			    		initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
	    			    		headerToolbar : { // 헤더에 표시할 툴 바
	    			    			start : 'prev next today',
	    			    			center : 'title',
	    			    			end : 'dayGridMonth,dayGridWeek'
	    			    		},
	    			    		titleFormat : function(date) {
	    			    			return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
	    			    		},
	    			    		//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
	    			    		nowIndicator: true, // 현재 시간 마크
	    			    		locale: 'ko', // 한국어 설정
	    			   			events:events,
	    			    		weekNumbers:true,
	    			    		eventDisplay:'list-item',
	    			    		height: 670
	    			    	});
	    			    	calendar.render();
	    			    	
	       					
	       					
	       					
	       					
	       					
	       					
	       				}
       				});
			    	
			    	
			    	
			    	
			    	
			    	
			    	
			    	
			    	
			    	
			    	
			    	
			    });
			    
			    
    		</script>  

        </div>
    </div>	
	
</body>
</html>