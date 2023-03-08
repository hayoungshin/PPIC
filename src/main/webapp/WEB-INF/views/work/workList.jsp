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
    <script>

    document.addEventListener('DOMContentLoaded', function() {
    	var calendarEl = document.getElementById('calendar');
    	var calendar = new FullCalendar.Calendar(calendarEl, {
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
    		selectable : true, // 달력 일자 드래그 설정가능
    		droppable : true,
    		editable : true,
    		nowIndicator: true, // 현재 시간 마크
    		locale: 'ko' // 한국어 설정
    	});
    	calendar.render();
    });

    </script>

<style>
	.calendar{
	    border:1px solid darkgray;
	    border-radius: 3px;
	    margin: 30px ;
	    width: 100%;
	    height: 650px;
	}
	.workcategory{
	    width: 100%;
	    margin-bottom: 30px;
	}
	.workcategory>a{
	    font-size: 20px;
	    font-weight: bold;
	    margin-right: 20px;
	    color: lightgray;
	}
	#calender{
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
					history.back();
				}
			</script>
           
			<div class="workcategory" style="float:left" >
				<a>출퇴근기록</a>
				<a style="color:lightgray;">올해근무정보</a>
				<a style="color:lightgray;">휴가현황</a>
			    <a style="color:lightgray;">휴가신청</a>
			    <br>
			</div>
			
			<br>
	
			
			 <!-- calendar 태그 -->
			
			 <div id='calendar' style="float:left; width:100%;"></div>
			
			  

        </div>
    </div>	
	
</body>
</html>