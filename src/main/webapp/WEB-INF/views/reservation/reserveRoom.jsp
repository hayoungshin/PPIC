<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의실 예약</title>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
  
  <style>
   
  /* 서브메뉴 */
  .sub-menu a{
      font-size:18px;
      color:rgb(143, 143, 143);
      text-decoration:none;
      margin-right:30px;
  }
  .sub-menu a.active, .sub-menu a:hover {
      color:rgb(0, 0, 0);
      font-weight:600;
  }
  /* 내 예약 */
  .circle{
    width:16px;
    height:16px;
    background:rgb(250, 82, 82);
    border-radius:20px;
    display:inline-block;
  }
  .my-res{
    font-size:13px;
    margin-right:30px;
  }
  #my-res-list{
    margin-right:30px;
    overflow:auto;
  }
  .modal{
    font-size:14px;
  }
  .modal tr{height:30px;}
  .modal th{width:140px;}
  .modal td{width:300px;}
  
  #selected-area{
    width:280px;
    height:150px;
    border:0.5px solid gray;
    overflow:auto;
  }
  .select-user{
    font-size:13px;
    display:inline-flex;
    align-items:center;
    margin:5px;
    background:rgb(240, 240, 240);
    border-radius:3px;
    justify-content:center;
    cursor:pointer;
  }
  .select-user>img{
    width:12px;
    margin:3px;
  }

  .invalidMsg{
    font-size:12px;
    color:red;
    display:none;
  }

  .btn-outline-red{
    border:1px solid red;
    border-radius:5px;
    background:#ffffff;
    color:red;
    padding:2px 6px;
  }

  /* 캘린더 */
  #calendar-container{
    width:70%;
  }
  #calendar *{
    font-size:12px;
  }
  /* 캘린더 헤더 */
  .fc-header-toolbar{
      padding-top: 1em;
      padding-left: 1em;
      padding-right: 1em;
  }
  #calendar .fc-toolbar-title{
    font-size:24px;
  }
  </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>

    
    <div id="content">
      <h2 class="title"><b>예약</b></h2>
      <br><br>
      <div class="sub-menu">
        <a href="#" class="active">회의실</a>
        <!-- <a href="#" class="active">법인차량</a> -->
      </div>
      <hr>
      <br>
      <div class="my-list">
        <h6><b>내 예약</b></h6>
        <br>
        <div id="my-res-list">
        </div>
      </div>
      <br><br><br>
      
      <!-- calendar 태그 -->
      <div id='calendar-container'>
        <div id='calendar'></div> 
      </div>
      <br><br>
      
        <!-- 일정 추가 modal -->
        <div class="modal" id="add-event-modal">
          <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                  <h5 class="modal-title"><b>예약하기</b></h5>
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                  <table>
                    <tr>
                      <th>예약날짜</th>
                      <td>
                        <input type="date" name="reserveDate">
                        하루종일<input id="allDay" type="checkbox">
                      </td>
                    </tr>
                    <tr>
                      <th>예약 시작시간</th>
                      <td>
                        <select class="select-time" name="startTime" id="startTime-hour">
                          <option value="">08:00</option>
                          <option value="">09:00</option>
                          <option value="">10:00</option>
                          <option value="">11:00</option>
                          <option value="">12:00</option>
                          <option value="">13:00</option>
                          <option value="">14:00</option>
                          <option value="">15:00</option>
                          <option value="">16:00</option>
                          <option value="">17:00</option>
                          <option value="">18:00</option>
                          <option value="">19:00</option>
                          <option value="">20:00</option>
                          <option value="">21:00</option>
                          <option value="">22:00</option>
                        </select>
                    </td>
                    </tr>
                    <tr>
                      <th>예약 종료시간</th>
                      <td>
                        <select class="select-time" name="endTime" id="endTime-hour">
                          <option value="">08:00</option>
                          <option value="">09:00</option>
                          <option value="">10:00</option>
                          <option value="">11:00</option>
                          <option value="">12:00</option>
                          <option value="">13:00</option>
                          <option value="">14:00</option>
                          <option value="">15:00</option>
                          <option value="">16:00</option>
                          <option value="">17:00</option>
                          <option value="">18:00</option>
                          <option value="">19:00</option>
                          <option value="">20:00</option>
                          <option value="">21:00</option>
                          <option value="">22:00</option>
                        </select>
                      </td>
                    </tr>
                    <tr>
                      <th>* 회의실</th>
                      <td>
                        <select name="room" id="">
                          <option value="none">선택</option>
                          <c:forEach var="r" items="${rooms}">
                            <option value="${r.roomNo}">${r.roomName}</option>
                          </c:forEach>
                        </select>
                      </td>
                    </tr>
                    <tr>
                      <th>*  회의명</th>
                      <td><input type="text" name="subject" size="30" placeholder="회의명 또는 사용목적을 입력해주세요."></td>
                    </tr>
                    <tr>
                      <th>참석자</th>
                      <td>
                        <select name="userNo" id="member-select">
                          <option value="none">선택</option>
                          <c:forEach var="m" items="${members}">
                            <option value="${m.userNo}">${m.userName}&nbsp${m.position}(${m.department})</option>  
                          </c:forEach>
                        </select>
                      </td>
                    </tr>
                    <tr>
                      <th></th>
                      <td>
                        <div id="selected-area"></div>
                      <div class="invalidMsg">이미 선택된 직원입니다.</div>
                      </td>
                    </tr>
                  </table>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                  <button type="button" class="btn-outline-red" data-dismiss="modal">취소</button>
                  <button type="submit" class="btn-purple">저장</button>
                </div>

              </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
      </div><!-- /.modal -->
      
      <!-- <div class="popover" style="max-width:600px;" >
        <div class="arrow"></div>
        <div class="popover-header">
        <button id="closepopover" type="button" class="close" aria-hidden="true">&times;</button>
        <h3 class="popover-title"></h3>
      </div>
      <div class="popover-content"></div>
    </div> -->
    
    </div><!-- content -->
  
    <!-- 데이터 가져오기 -->
    <script>
      let loginUserNo = ${loginUser.userNo};
    
      $(function(){
        loadCalendar();
      })
    </script>

    <!-- 모달 관련 -->
    <script>
      var startDate = "";
      var startTime = "";

      var endDate = "";
        $("#allDay").change(function(){
          if($(this).is(":checked")){
            $(".select-time").prop("disabled", true);

          }else{
            $(".select-time").prop("disabled", false);
          }
        })

        // 선택한 정보 selected-area에 추가하기
        let selectedEl = ""; // 선택된 요소
        let projectUser = ""; // 추가할 요소
        let selectUserDept = ""; // 유저 부서번호
        let selectUserName = ""; // 유저명
        let selectUserNo = ""; // 유저번호
        let selectUserPs = ""; // 유저직위
        let selectUserAssign = "" ; // 작업담당여부
        $("#member-select").change(function(){
          $(".invalidMsg").css("display", "none");
          selectedEl = $("#member-select option:selected");
          selectUserName = selectedEl.text();
          selectUserNo = selectedEl.attr("value");

          if($("#selected-area").text().includes(selectUserName)){
            $(".invalidMsg").css("display", "block");
          }else{
            projectUser = "<div class='select-user' onclick='deleteUser(this);'>" + selectUserName + "<img src='resources/icons/delete-red.png'>"
                        + "<input type='hidden' name='selectUserNo' value='" + selectUserNo + "'>"
                        + "</div>";
            $("#selected-area").append(projectUser);
            $(".invalidMsg").css("display", "none");
          }
        })


        // 선택유저 삭제하기
        function deleteUser(e){
          $(e).remove();
        }

    </script>
  

  <script>
    let rList;
    let rpList;
    let eventList = [];
    function loadCalendar(){
      
      $.ajax({
          url:"resRoomList.rs",
          success:function(obj){
            rList = obj.list;

           for(let i=0; i<rList.length; i++){
            if(rList.res_user != userNo){
              eventList.push(
                {
                  title:rList[i].subject,
                  start:rList[i].startDate,
                  end:rList[i].endDate,
                  backgroundColor:"#6F50F8",
                  textColor:"#ffffff"
                }
              )
            }else{
              eventList.push(
                {
                  title:rList[i].subject,
                  start:rList[i].startDate,
                  end:rList[i].endDate,
                  backgroundColor:"red",
                  textColor:"white"
                }
              )
            }
           }

           let myRes = "";
           for(let i=0; i<rList.length; i++){
            for(let j=0; j<rList[i].rParticipants.length; j++){
              if(rList[i].resUser == loginUserNo /*|| rList[i].rParticipants[j].userNo == loginUserNo*/){
                let startDate = rList[i].startDate.substring(0,10) + " " + rList[i].startDate.substring(11,16);
                myRes = "<div class='circle'></div>"
                      + "<span class='my-res'>" + "<b>" + rList[i].subject + "</b> " + rList[i].rooms[0].roomName + " " + startDate + "</span>";
              }
            }
           }
           $("#my-res-list").append(myRes);

           var calendarEl = $('#calendar')[0];
           var calendar = new FullCalendar.Calendar(calendarEl, {
            height: '700px',
            expandRows: true,
            slotMinTime: '08:00',
            slotMaxTime: '20:00',
            
            headerToolbar: {
              left: 'prev,next today',
              center: 'title',
              right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
            },
            events: eventList,
            initialView: 'dayGridMonth', 
            navLinks: true, 
            editable: true, 
            selectable: true, 
            nowIndicator: true, 
            dayMaxEvents: true, 
            locale: 'ko', 
            
            dateClick: function(obj){
              $("#add-event-modal input[type=date]").val(obj.dateStr);
              $("#add-event-modal").modal("show")
              
              $();
            },
            select: function(arg) {
              $("#add-event-modal").modal("show");
              // if (title) {
              //   calendar.addEvent({
              //     title: title,
              //     start: arg.start,
              //     end: arg.end,
              //     allDay: arg.allDay
              //   })
              // }
              calendar.unselect()
            }
          });
          // 캘린더 랜더링
          calendar.render();
           
            
        }, error:function(){
          console.log("예약리스트 조회 실패")
        }
      })
        
      
    };
  </script>
</body>
</html>