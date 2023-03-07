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
   .solarLunar{
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
       padding:5px 10px; 
       margin-right:8px;
   }
   .boardOuter img{
       margin-bottom: 5px; 
       margin-right:5px;
       cursor:pointer;
   }

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
   input[name=name], input[name=date], input[name=location]{width: 300px;}
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
   #period, #period2{margin-left:150px;}
   .checkPeriod, .allDay, #add-comSchedule{display:none;}
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
        <div align="right">
            <a href="" class="btn" id="modal-btn" data-toggle="modal" data-target="#addModal">추가</a>
        </div>
        <!-- ajax -->
        <input type="radio" id="allSchedule" name="category" checked><label for="allSchedule">전체</label><input type="radio" id="restDay" name="category"><label for="restDay">쉬는 날</label><input type="radio" id="comSchedule" name="category"><label for="comSchedule">회사 일정</label>
        <table class="table">
            <tbody>
              <tr>
                <td class="date">
                    <b>1월 1일</b><br>
                    <span class="solarLunar" style="background: rgb(241, 196, 15);">양</span><span class="date">1월 1일</span>
                </td>
                <td width="1000px" class="schedule" style="text-align: right;">
                    <span style="background:rgb(204, 228, 244);">매년</span>
                    <span style="background:rgb(224, 224, 224);">휴일</span>
                    <img src="resources/icons/modify.png" width="20px" height="20px" class="modify-img">
                    <img src="resources/icons/bin.png" width="20px" height="25px" class="delete-img">
                </td>
              </tr>
              <tr>
                <td class="date">
                    <b>설날</b><br>
                    <span class="solarLunar" style="background: rgb(155, 89, 182);">음</span><span class="date">12월 30일 - 1월 2일</span>
                </td>
                <td width="700px" class="schedule" style="text-align: right;">
                    <span style="background:rgb(204, 228, 244);">매년</span>
                    <span style="background:rgb(224, 224, 224);">휴일</span>
                    <img src="resources/icons/modify.png" width="20px" height="20px" class="modify-img">
                    <img src="resources/icons/bin.png" width="20px" height="25px" class="delete-img">
                </td>
              </tr>
            </tbody>
        </table>
        <script>
            $(document).on("click", ".modify-img", function(){
                // 일정 번호 넘기면서
                $('#modifyModal').modal('show'); 
            })
            $(document).on("click", ".delete-img", function(){
                // 일정 번호 넘기면서
                $('#deleteModal').modal('show'); 
            })
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
                    <a href="" class="btn" id="delete-btn">확인</a>
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
                        <small>* 법정 공휴일은 삭제만 가능합니다.</small><br><br> <!-- 법정 공휴일은 input 요소들 비활성화 + 삭제버튼 -->
                        <form action="" id="modify-form">
                            <table>
                                <!-- 해당 일정 내용 checked & 입력해놓기 -->
                                <!-- 쉬는날 -->
                                <tr>
                                    <td width="100px"><b>이름</b></td>
                                    <td>
                                        <input type="text" value="1월 1일" name="name">
                                    </td>
                                </tr>
                                <tr>
                                    <td><br><br><b>날짜</b></td>
                                    <td>
                                        <input type="radio" id="solar" name="solarLunar" checked>
                                        <label for="solar">양력</label>
                                        <input type="radio" id="lunar" name="solarLunar">
                                        <label for="lunar">음력</label>
                                        <input type="checkbox" id="period" class="period">
                                        <label for="period">기간 입력</label>
                                        <!-- 기간 입력 미체크시 -->
                                        <div class="uncheckPeriod">
                                            <input type="text" class="datepicker inpType" name="date" value="2023-01-01">
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
                                            <input type="checkbox" checked/>
                                            <span class="onoff-switch"></span>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>휴일 여부</b></td>
                                    <td>
                                        <input type="radio" id="holiday" name="restDay" checked>
                                        <label for="holiday">휴일</label>
                                        <input type="radio" id="anniversary" name="restDay">
                                        <label for="anniversary">기념일</label>
                                    </td>
                                </tr>
                                <!-- 회사 일정 
                                <tr>
                                    <td width="100px"><b>이름</b></td>
                                    <td>
                                        <input type="text" value="창립기념일" name="name">
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>날짜</b><br><br><br></td>
                                    <td>
                                        <div class="notAllDay">
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
                                        <div class="allDay">
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
                                            <label for="allDay">종일</label>
                                            <label class="switch-button">
                                                <input type="checkbox" name="allDay" id="allDay" checked/>
                                                <span class="onoff-switch"></span>
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>장소</b></td>
                                    <td>
                                        <input type="text" name="location">
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>내용</b></td>
                                    <td>
                                        <textarea name="" style="resize: none;"></textarea>
                                    </td>
                                </tr>
                                -->
                            </table>
                            <div align="center">
                                <a class="btn" data-dismiss="modal" id="reset-btn">취소</a>
                                <a href="" class="btn" id="modify-btn">수정</a>
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
                        <form action="" id="add-form">
                            <table>
                                <tr>
                                    <td width="100px"><b>종류</b></td>
                                    <td>
                                        <input type="radio" id="restDay-modal" name="sch-cat" checked>
                                        <label for="restDay-modal">쉬는 날</label>
                                        <input type="radio" id="comSchedule-modal" name="sch-cat">
                                        <label for="comSchedule-modal">회사 일정</label>
                                    </td>
                                </tr>
                            </table>
                            <table id="add-restDay">
                                <!-- 쉬는날 -->
                                <tr>
                                    <td width="100px"><b>이름</b></td>
                                    <td>
                                        <input type="text" name="name">
                                    </td>
                                </tr>
                                <tr>
                                    <td><br><br><b>날짜</b></td>
                                    <td>
                                        <input type="radio" id="solar" name="solarLunar" checked>
                                        <label for="solar">양력</label>
                                        <input type="radio" id="lunar" name="solarLunar">
                                        <label for="lunar">음력</label>
                                        <input type="checkbox" id="period2" class="period">
                                        <label for="period2">기간 입력</label>
                                        <!-- 기간 입력 미체크시 -->
                                        <div class="uncheckPeriod">
                                            <input type="text" class="datepicker inpType" name="date">
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
                                            <input type="checkbox"/>
                                            <span class="onoff-switch"></span>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>휴일 여부</b></td>
                                    <td>
                                        <input type="radio" id="holiday" name="restDay" checked>
                                        <label for="holiday">휴일</label>
                                        <input type="radio" id="anniversary" name="restDay">
                                        <label for="anniversary">기념일</label>
                                    </td>
                                </tr>
                            </table>
                            <table id="add-comSchedule">
                                <tr>
                                    <td width="100px"><b>이름</b></td>
                                    <td>
                                        <input type="text" name="name">
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>날짜</b><br><br><br></td>
                                    <td>
                                        <div class="notAllDay">
                                            <span class="dset">
                                                <input type="text" class="datepicker inpType" name="startDate2" id="startDate5">
                                                <a href="#none" class="btncalendar dateclick"></a>
                                            </span>
                                            <input type="time" name="startTime">
                                            <div align="center"><b>-</b></div>
                                            <span class="dset">
                                                <input type="text" class="datepicker inpType" name="endDate2" id="endDate5">
                                                <a href="#none" class="btncalendar dateclick"></a>
                                            </span>
                                            <input type="time" name="endTime">
                                        </div> 
                                        <div class="allDay">
                                            <span class="dset">
                                                <input type="text" class="datepicker inpType" name="startDate3" id="startDate6" >
                                                <a href="#none" class="btncalendar dateclick"></a>
                                            </span>
                                            <span class="demi">-</span>
                                            <span class="dset">
                                                <input type="text" class="datepicker inpType" name="endDate3" id="endDate6" >
                                                <a href="#none" class="btncalendar dateclick"></a>
                                            </span>
                                        </div> 
                                        <div align="right" style="width:290px; margin-top:5px">
                                            <label for="allDay">종일</label>
                                            <label class="switch-button">
                                                <input type="checkbox" name="allDay" id="allDay"/>
                                                <span class="onoff-switch"></span>
                                            </label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>장소</b></td>
                                    <td>
                                        <input type="text" name="location">
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>내용</b></td>
                                    <td>
                                        <textarea name="" style="resize: none;"></textarea>
                                    </td>
                                </tr>
                            </table>
                            <div align="center">
                                <a class="btn" data-dismiss="modal" id="resetadd-btn">취소</a>
                                <a href="" class="btn" id="add-btn">추가</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
   	</div>
    <script>
        // datePicker
        $(function() {
            $.datepicker.setDefaults($.datepicker.regional['ko']);
            $(".datepicker").datepicker(); 
        });

        // 수정 취소 버튼 클릭 이벤트
        $("#reset-btn").click(function(){
            $("#modify-form")[0].reset();
        })
        $("#resetadd-btn").click(function(){
            $("#add-form")[0].reset();
            $("#add-restDay").show();
            $("#add-comSchedule").hide();
        })

        // 기간 입력 클릭 이벤트
        $(".period").click(function(){
            if($(this).is(":checked")){
                $(".checkPeriod").show();
                $(".uncheckPeriod").hide();
            }else{
                $(".checkPeriod").hide();
                $(".uncheckPeriod").show();
            }
        })

        // 종일 스위치 클릭 이벤트
        $(function(){
            allDayCheck();
        })
        $("#allDay").click(function(){
            allDayCheck();
        })
        function allDayCheck(){
            if($("#allDay").is(":checked")){
                $(".allDay").show();
                $(".notAllDay").hide();
            } else{
                $(".allDay").hide();
                $(".notAllDay").show();
            }
        }

        // 일정 추가 모달 쉬는날/회사일정 선택 이벤트
        $("input[name=sch-cat]").click(function(){
            if($("#restDay-modal").is(":checked")){
                $("#add-restDay").show();
                $("#add-comSchedule").hide();
            }else{
                $("#add-restDay").hide();
                $("#add-comSchedule").show();
            }
        })
    </script>

</body>
</html>