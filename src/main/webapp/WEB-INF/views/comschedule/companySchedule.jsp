<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	/* 회사 일정 리스트 */
   .table{text-align: center;}
   .table td{vertical-align: middle;}
   .lunarSolar{
       border-radius:50%; 
       display:inline-block; 
       height: 18px; 
       width:18px; 
       line-height:18px; 
       color:white;
       margin-right:3px;
   }
   .schedule>span{
       border-radius:3px; 
       padding:5px 5px; 
       width:50px;
       text-align:center;
       margin-right:8px;
       display:inline-block;
   }
   .boardOuter img{
       margin-bottom: 5px; 
       margin-right:5px;
       cursor:pointer;
   }
   .schedule{text-align:right;}

   /* 버튼 스타일 */
   #modal-btn, #exit-btn, #delete-btn, #check-btn, #modify-btn, #reset-btn, #add-btn, #resetadd-btn{
       color:white;
       width:70px;
       height:30px;
       font-size: 12px;
       background: rgb(190, 190, 190);
   }
   #modal-btn, #delete-btn, #modify-btn, #add-btn{background: rgb(111, 80, 248);}
   .btn:hover, img:hover{opacity: 0.7;}

   /* modal 스타일 */
   .modal td{
       padding: 5px;
   }
   input[type=text], input[type=time]{
       border: 1px solid rgb(202, 199, 199);
       border-radius: 5px;
       height:30px;
   }
   input[name=schName], .sch-date, input[name=schLocation]{width: 300px;}
   input[type=time]{width:130px; margin-left:15px;}
   input[type=radio]{display:none;}
   input[type=radio]+label{
       display: inline-block;
       cursor: pointer;
       padding: 5px 8px;
       text-align: center;
       border-radius: 5px;
       background-color: rgb(224, 224, 224);
       line-height: 16px;
   }
   input[type=radio]:checked+label, input[type=radio]:hover+label{
       background-color: rgb(158, 158, 158);
       color:white;
   }
   input[name=category]+label{
       width:80px;
       height:30px;
       margin:0px;
       line-height:20px;
       border-bottom-left-radius:0px;
       border-bottom-right-radius:0px;
   }
   .period{margin-left:150px;}
   .checkPeriod, .allday, #add-comSchedule{display:none;}
   textarea{
       border: 1px solid rgb(202, 199, 199);
       border-radius: 5px;
       width: 300px;
       height:100px;
   }

   /* 스위치 버튼 */
   .switch-button {
       position: relative;
       display: inline-block;
       width: 30px;
       height: 20px;
   }
   .switch-button input {
       opacity: 0;
       width: 0;
       height: 0;
   }
   .onoff-switch {
       position: absolute;
       cursor: pointer;
       top: 0;
       left: 0;
       right: 0;
       bottom: 0;
       border-radius:20px;
       background-color: rgb(190, 190, 190);
       -webkit-transition: .4s;
       transition: .4s;
   }
   .onoff-switch:before {
       position: absolute;
       content: "";
       height: 13px;
       width: 13px;
       left: 4px;
       bottom: 3px;
       background-color: #fff;
       -webkit-transition: .5s;
       transition: .4s;
       border-radius:20px;
   }
   .switch-button input:checked + .onoff-switch {
       background-color: rgb(111, 80, 248);
   }
   .switch-button input:checked + .onoff-switch:before {
       -webkit-transform: translateX(10px);
       -ms-transform: translateX(10px);
       transform: translateX(10px);
   }
</style>
</head>
<body>

	<jsp:include page="../board/boardMenubar.jsp"/>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
	
    <script>
        document.getElementsByClassName("menus")[4].className += ' clicked';
    </script>
    <div class="boardOuter"> 
        <div align="right" style="width:1200px;">
            <a href="" class="btn" id="modal-btn" data-toggle="modal" data-target="#addModal">추가</a>
        </div>
        <!-- ajax -->
        <input type="radio" id="restDay" name="category" value="0" checked><label for="restDay">쉬는 날</label><input type="radio" id="comSchedule" name="category" value="1"><label for="comSchedule">회사 일정</label>
        <table class="table" id="schedule-list" style="width:1200px;">
            <tbody>
            </tbody>
        </table>
        <script>
	        $(function(){
	        	comSchedule();
	        })
	        $("input[name=category]").change(function(){
	        	comSchedule();
	        })
	        function comSchedule(){
	        	$.ajax({
	        		url:"comScheduleList.bo",
	        		data:{schKind:$("input[name=category]:checked").val()},
	        		success:function(list){
	        			let value = "";
	        			let value2 = "";
	        			for(let i=0; i<list.length; i++){
	    					value += "<tr>"
	    							+	"<td class='sch-date' width='400px'><b>" + list[i].schName + "</b><br>";
			    				    if(list[i].lunarSolar == 0){
			    				    	value += "<span class='lunarSolar' style='background: rgb(241, 196, 15);'>양";
			    				    } else if(list[i].lunarSolar == 1){
			    				    	value += "<span class='lunarSolar' style='background: rgb(155, 89, 182);'>음";
			    				    }
			    			value += 		"</span><span class='sch-date'>" + list[i].startDate.substring(5,7) + "월 " + list[i].startDate.substring(8) + "일";
			    					if(list[i].startTime != null){
			    						value += " " + list[i].startTime;
			    					}
			    			        if(list[i].endDate != null){
			    			        	value += " - " + list[i].endDate.substring(5,7) + "월" + list[i].endDate.substring(8) + "일" 
			    			        	if(list[i].endTime != null && list[i].allday == 'N'){
				    						value += " " + list[i].endTime;
				    					}
			    			        }
			    			        if(list[i].allday == 'Y'){
			    			        	value += " 종일";
			    			        }
	    				    		value += "</span></td><td class='schedule'>";
	    				    		if(list[i].schKind == 0){
	    				    			if(list[i].annual != 'N'){
		    				    	    	value += "<span style='background:rgb(204, 228, 244);'>매년</span>";
		    				    	    }
		    				    	    if(list[i].restdayKind == '0'){
		    				    	    	value += "<span style='background:rgb(224, 224, 224);'>휴일</span>";
		    				    	    } else{
		    				    	    	value += "<span style='background:rgb(224, 224, 224);'>기념일</span>";
		    				    	    }
		    				    	    
	    				    		}
	    				    		value += "<img src='resources/icons/modify.png' width='20px' height='20px' class='modify-img'>"
			                    		+ "<img src='resources/icons/bin.png' width='20px' height='25px' class='delete-img' onclick='deleteSchedule(" + list[i].schNo + ");'></td></tr>"
			                    		+ "<tr style='display:none;'>"
			                    		+	"<td>" + list[i].schNo + "</td>"
			                    		+	"<td>" + list[i].legalholiday + "</td>"
			                    		+	"<td>" + list[i].schKind + "</td>"
			                    		+	"<td>" + list[i].restdayKind + "</td>"
			                    		+	"<td>" + list[i].schContent + "</td>"
			                    		+	"<td>" + list[i].schLocation + "</td>"
			                    		+	"<td>" + list[i].lunarSolar + "</td>"
			                    		+	"<td>" + list[i].startDate + "</td>"
			                    		+	"<td>" + list[i].endDate + "</td>"
			                    		+	"<td>" + list[i].allday + "</td>"
			                    		+	"<td>" + list[i].annual + "</td>"
			                    		+	"<td>" + list[i].startTime + "</td>"
			                    		+	"<td>" + list[i].endTime + "</td>"
	    				    			+ "</tr>"
	    				}
	    				$("#schedule-list").html(value);
	        		}, error:function(){
	        			console.log("전체 조회용 ajax 통신 실패");
	        		}
	        	})
	        }
        </script>
        
        <script>
        	// 일정 수정
	        $(document).on("click", ".modify-img", function(){
	        	// 법정 공휴일일 경우 모달 내 input 요소 비활성화 / 버튼 숨기기
	        	if($(this).parents("tr").next().children().eq(1).text() == 'Y'){
	            	$('#modifyModal input').prop("disabled", true);
	            	$('#modify-btn').hide();
	            } else{
	            	$('#modifyModal input').prop("disabled", false);
	            	$('#modify-btn').show();
	            }
	        	
	        	$this = $(this).parents("tr").next().children();
	        	if($this.eq(2).text() == 0){ // 쉬는 날일 경우 
	        		$("#restday-table").show();
	                $("#comschedule-table").hide();
	                hide($("#comschedule-table"));
	                // 음력 양력 버튼 checked
	                $("#modifyModal input[name=lunarSolar]").each(function(){
	                	if($(this).val() == $this.eq(6).text()){
	                		$(this).prop("checked", true);
	                	}
	                })
	                // 기간 입력 선택 여부
	                if($this.eq(8).text() != "undefined"){
	                	$("#modifyModal .period").prop("checked", true);
	                	$("#modifyModal input[name=endDate]").val($this.eq(8).text()); // 종료날짜
	                }else{
	                	$("#modifyModal .period").prop("checked", false);
	                }
	                periodClick(document.querySelector("#modifyModal .period"));
	                
	                // 매년 반복 여부
	                if($this.eq(10).text() == "Y"){
	                	$("#modifyModal input[name=annual]").prop("checked", true);
	                }else{
	                	$("#modifyModal input[name=annual]").prop("checked", false);
	                }
	                
	                // 휴일 여부
	                $("#modifyModal input[name=restdayKind]").each(function(){
	                	if($(this).val() == $this.eq(3).text()){
	                		$(this).prop("checked", true);
	                	}
	                })
	        	}else{ // 회사 일정일 경우
	        		$("#restday-table").hide();
	                $("#comschedule-table").show();
	                hide($("#restday-table"));
	                $("#modifyModal input[name=endDate]").val($this.eq(8).text()); // 종료날짜
	                $("#modifyModal input[name=schLocation]").val($this.eq(5).text()); // 장소
	                $("#modifyModal textarea").val($this.eq(4).text()); // 내용
	                
	                // 종일여부
	                if($this.eq(9).text() == 'Y'){
	                	$("#modifyModal .allday-btn").prop("checked", true);
	                } else{
	                	$("#modifyModal .allday-btn").prop("checked", false);
	                	$("#modifyModal input[name=startTime]").val($this.eq(11).text());
	                	$("#modifyModal input[name=endTime]").val($this.eq(12).text());
	                }
	                alldayClick(document.querySelector("#modifyModal .allday-btn"));
	        	}
	            $("#modifyModal input[name=schName]").val($(this).parent().prev().children("b").text());
	            $("#modifyModal input[name=startDate]").val($this.eq(7).text());
	            $("#modifyModal input[name=schKind]").val($this.eq(2).text());
	            $("#modifyModal input[name=schNo]").val($this.eq(0).text());
	            $('#modifyModal').modal('show');
	        })
	        
	        function deleteSchedule(no){
	        	$("#delete-btn").attr("href", "delete.sch?no=" + no);
		        $('#deleteModal').modal('show'); 
        	}
        </script>

        <!-- 삭제 확인용 Modal -->
        <div class="modal" id="deleteModal" data-backdrop='static' data-keyboard='false'>
            <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-body">
                <b>일정 삭제</b> <br><br>
                <div align="center">
                    삭제하시겠습니까?<br><br>
                    <a class="btn" data-dismiss="modal" id="exit-btn">취소</a>
                    <a class="btn" id="delete-btn">확인</a>
                </div>
                </div>
            </div>
            </div>
        </div>

        <!-- 일정 수정용 Modal -->
        <div class="modal" id="modifyModal" data-backdrop='static' data-keyboard='false'>
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <b>일정수정</b>
                        <form action="update.sch" id="modify-form">
                        <input type="hidden" name="schNo">
                        <input type="hidden" name="schKind">
                        <small>* 법정 공휴일은 삭제만 가능합니다.</small><br><br>
                            <table id="restday-table">
                                <!-- 해당 일정 내용 checked & 입력해놓기 -->
                                <!-- 쉬는날 -->
                                <tr>
                                    <td width="100px"><b>이름</b></td>
                                    <td>
                                        <input type="text" name="schName">
                                    </td>
                                </tr>
                                <tr>
                                    <td><br><br><b>날짜</b></td>
                                    <td>
                                        <input type="radio" id="solar" name="lunarSolar" value="0">
                                        <label for="solar">양력</label>
                                        <input type="radio" id="lunar" name="lunarSolar" value="1">
                                        <label for="lunar">음력</label>
                                        <input type="checkbox" id="period1" class="period" onclick="periodClick(this);">
                                        <label for="period1">기간 입력</label>
                                        <!-- 기간 입력 미체크시 -->
                                        <div class="uncheckPeriod">
                                            <input type="text" class="datepicker inpType date" name="startDate" style="width:300px">
                                        </div>
                                        <a href="#none" class="btncalendar dateclick"></a>
                                        <!-- 기간 입력 체크시 -->
                                        <div class="checkPeriod">
                                            <span class="dset">
                                                <input type="text" class="datepicker inpType" name="startDate" id="startDate1" >
                                                <a href="#none" class="btncalendar dateclick"></a>
                                            </span>
                                            <span class="demi">-</span>
                                            <span class="dset">
                                                <input type="text" class="datepicker inpType" name="endDate" id="endDate1" >
                                                <a href="#none" class="btncalendar dateclick"></a>
                                            </span>
                                        </div> 
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>매년 반복</b></td>
                                    <td>
                                        <label class="switch-button">
                                            <input type="checkbox" name="annual"/>
                                            <span class="onoff-switch"></span>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>휴일 여부</b></td>
                                    <td>
                                        <input type="radio" id="holiday" name="restdayKind" value="0">
                                        <label for="holiday">휴일</label>
                                        <input type="radio" id="anniversary" value="1" name="restdayKind">
                                        <label for="anniversary">기념일</label>
                                    </td>
                                </tr>
                               </table>
                               <table id="comschedule-table">
                                <tr>
                                    <td width="100px"><b>이름</b></td>
                                    <td>
                                        <input type="text" name="schName">
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>날짜</b><br><br><br></td>
                                    <td>
                                        <div class="notallday">
                                            <span class="dset">
                                                <input type="text" class="datepicker inpType" name="startDate" id="startDate2">
                                                <a href="#none" class="btncalendar dateclick"></a>
                                            </span>
                                            <input type="time" name="startTime">
                                            <div align="center"><b>-</b></div>
                                            <span class="dset">
                                                <input type="text" class="datepicker inpType" name="endDate" id="endDate2">
                                                <a href="#none" class="btncalendar dateclick"></a>
                                            </span>
                                            <input type="time" name="endTime">
                                        </div> 
                                        <div class="allday">
                                            <span class="dset">
                                                <input type="text" class="datepicker inpType" name="startDate" id="startDate3" >
                                                <a href="#none" class="btncalendar dateclick"></a>
                                            </span>
                                            <span class="demi">-</span>
                                            <span class="dset">
                                                <input type="text" class="datepicker inpType" name="endDate" id="endDate3" >
                                                <a href="#none" class="btncalendar dateclick"></a>
                                            </span>
                                        </div> 
                                        <div align="right" style="width:290px; margin-top:5px">
                                            <label for="allday">종일</label>
                                            <label class="switch-button">
                                                <input type="checkbox" name="allday" id="allday" class="allday-btn" onclick="alldayClick(this);">
                                                <span class="onoff-switch"></span>
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>장소</b></td>
                                    <td>
                                        <input type="text" name="schLocation">
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>내용</b></td>
                                    <td>
                                        <textarea name="schContent" style="resize: none;"></textarea>
                                    </td>
                                </tr>
                            </table>
                            <div align="center">
                                <button type="button" class="btn" data-dismiss="modal" id="reset-btn">취소</button>
                                <button type="submit" class="btn" id="modify-btn">수정</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- 일정 추가용 Modal -->
        <div class="modal" id="addModal" data-backdrop='static' data-keyboard='false'>
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <b>일정 추가</b>
                        <form action="insert.sch" id="add-form">
                            <table>
                                <tr>
                                    <td width="100px"><b>종류</b></td>
                                    <td>
                                        <input type="radio" id="restDay-modal" name="schKind" value="0" onchange="addModal(0);" checked>
                                        <label for="restDay-modal">쉬는 날</label>
                                        <input type="radio" id="comSchedule-modal" value="1" name="schKind" onchange="addModal(1);">
                                        <label for="comSchedule-modal">회사 일정</label>
                                    </td>
                                </tr>
                            </table>
                            <table id="add-restDay">
                                <!-- 쉬는날 -->
                                <tr>
                                    <td width="100px"><b>이름</b></td>
                                    <td>
                                        <input type="text" name="schName" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td><br><br><b>날짜</b></td>
                                    <td>
                                        <input type="radio" id="solar2" name="lunarSolar" value="0" checked>
                                        <label for="solar2">양력</label>
                                        <input type="radio" id="lunar2" value="1" name="lunarSolar">
                                        <label for="lunar2">음력</label>
                                        <input type="checkbox" id="period2" class="period" onclick="periodClick(this);">
                                        <label for="period2">기간 입력</label>
                                        <!-- 기간 입력 미체크시 -->
                                        <div class="uncheckPeriod">
                                            <input type="text" class="datepicker inpType date" name="startDate" style="width:300px">
                                        </div>
                                        <a href="#none" class="btncalendar dateclick"></a>
                                        <!-- 기간 입력 체크시 -->
                                        <div class="checkPeriod">
                                            <span class="dset">
                                                <input type="text" class="datepicker inpType" name="startDate" id="startDate4" >
                                                <a href="#none" class="btncalendar dateclick"></a>
                                            </span>
                                            <span class="demi">-</span>
                                            <span class="dset">
                                                <input type="text" class="datepicker inpType" name="endDate" id="endDate4" >
                                                <a href="#none" class="btncalendar dateclick"></a>
                                            </span>
                                        </div> 
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>매년 반복</b></td>
                                    <td>
                                        <label class="switch-button">
                                            <input type="checkbox" name="annual">
                                            <span class="onoff-switch"></span>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>휴일 여부</b></td>
                                    <td>
                                        <input type="radio" id="holiday3" name="restdayKind" value="0" checked>
                                        <label for="holiday3">휴일</label>
                                        <input type="radio" id="anniversary3" name="restdayKind" value="1">
                                        <label for="anniversary3">기념일</label>
                                    </td>
                                </tr>
                            </table>
                            <table id="add-comSchedule">
                                <tr>
                                    <td width="100px"><b>이름</b></td>
                                    <td>
                                        <input type="text" name="schName" required>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>날짜</b><br><br><br></td>
                                    <td>
                                        <div class="notallday">
                                            <span class="dset">
                                                <input type="text" class="datepicker inpType" name="startDate" id="startDate5">
                                                <a href="#none" class="btncalendar dateclick"></a>
                                            </span>
                                            <input type="time" name="startTime">
                                            <div align="center"><b>-</b></div>
                                            <span class="dset">
                                                <input type="text" class="datepicker inpType" name="endDate" id="endDate5">
                                                <a href="#none" class="btncalendar dateclick"></a>
                                            </span>
                                            <input type="time" name="endTime">
                                        </div> 
                                        <div class="allday">
                                            <span class="dset">
                                                <input type="text" class="datepicker inpType" name="startDate" id="startDate6" >
                                                <a href="#none" class="btncalendar dateclick"></a>
                                            </span>
                                            <span class="demi">-</span>
                                            <span class="dset">
                                                <input type="text" class="datepicker inpType" name="endDate" id="endDate6" >
                                                <a href="#none" class="btncalendar dateclick"></a>
                                            </span>
                                        </div> 
                                        <div align="right" style="width:290px; margin-top:5px">
                                            <label for="allday2">종일</label>
                                            <label class="switch-button">
                                                <input type="checkbox" name="allday" id="allday2" class="allday-btn" onclick="alldayClick(this);">
                                                <span class="onoff-switch"></span>
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>장소</b></td>
                                    <td>
                                        <input type="text" name="schLocation">
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>내용</b></td>
                                    <td>
                                        <textarea name="schContent" style="resize: none;"></textarea>
                                    </td>
                                </tr>
                            </table>
                            <div align="center">
                                <button type="button" class="btn" data-dismiss="modal" id="resetadd-btn">취소</button>
                                <button type="submit" class="btn" id="add-btn">추가</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
   	</div>
    <script>
        $(function() {
        	// datepicker
            $.datepicker.setDefaults($.datepicker.regional['ko']);
            $(".datepicker").datepicker(); 
           	addModal(0);
        });

        // 수정 취소 버튼 클릭 이벤트
        $("#reset-btn").click(function(){
        	$("#modify-form")[0].reset();
            periodClick(document.querySelector("#modifyModal .period"));
           	alldayClick(document.querySelector("#modifyModal .allday-btn"));
        })
        
        // 추가 취소 버튼 클릭 이벤트
        $("#resetadd-btn").click(function(){
            $("#add-form")[0].reset();
            addModal(0);
            periodClick(document.querySelector("#modifyModal .period"));
           	alldayClick(document.querySelector("#modifyModal .allday-btn"));
        })

        // 기간 입력 클릭 이벤트
        function periodClick(a){
        	if(a.checked){
        		$(".checkPeriod").show();
        		$(".uncheckPeriod").hide();
            }else{
            	$(".checkPeriod").hide();
            	$(".uncheckPeriod").show();
            }
            hide($(".checkPeriod"));
            hide($(".uncheckPeriod"));
        }

        // 종일 스위치 클릭 이벤트
        function alldayClick(a){
        	if(a.checked){
        		$(".allday").show();
        		$(".notallday").hide();
        	}else{
        		$(".allday").hide();
        		$(".notallday").show();
        	}
        	hide($(".allday"));
        	hide($(".notallday"));
        }

        // 일정 추가 모달 쉬는날/회사일정 선택 이벤트
        function addModal(num){
        	if(num == 0){
                $("#add-restDay").show();
                $("#add-comSchedule").hide();
            }else{
                $("#add-restDay").hide();
                $("#add-comSchedule").show();
            }
        	hide($("#add-comSchedule"));
            hide($("#add-restDay"));
            hide($(".allday"));
        }
        
        // 숨긴 요소 내 input 비활성화
        function hide(a){
        	if(a.css('display') == 'none'){
        		a.find("input").prop("disabled", true);
        	} else{
        		a.find("input").prop("disabled", false);
        	}
        }
    </script>

</body>
</html>