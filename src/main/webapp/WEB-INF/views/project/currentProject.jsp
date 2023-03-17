<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업무</title>
 <!-- Link Swiper's CSS -->
 <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
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

  /* swiper 슬라이드 */
  .swiper{
      width:100%;
      height:200px;
      margin-left:10px !important;
      z-index:0 !important;
  }
  .swiper-slide{
    text-align:center;
    font-size:18px;
    background:#ffffff;
    display:flex;
    justify-content:center;
    align-items:center;
    border:0.5px solid #ececee;
    width:320px;
    height:140px;
    box-shadow:12px 12px 15px -5px #dddddd;
  }
  .swiper-slide:hover{cursor:pointer;}
  .swiper-pagination, .swiper-button-next, .swiper-button-prev{z-index:1 !important;}

  /* 프로젝트 박스 */
  .project-box div{margin:5px; font-size:13px;}
  .project-title{font-size:16px !important; font-weight:700;}
  .swiper-slide.active{border:1px solid #6F50F8;}

  /* 진행률 */
  .progress {
    background:#f3f3f3;
    justify-content:flex-start;
    border-radius:100px !important;
    align-items:center;
    position:relative;
    padding:0 5px;
    display:flex;
    height:24px !important;
    width:100%;
  }
  .progress-bar {
    animation: load 2s normal forwards;
    box-shadow: 0 10px 30px -10px #6F50F8 !important;
    border-radius: 100px;
    background:linear-gradient(to right, #00b5d1 60%, #FFCECE);
    height: 16px;
    width: 0;
  }
  @keyframes load {
    0% { width: 0; }
    100% { width: 95%; }
  }

  .p-summary{
    font-size:13px;
  }
  #p-detail{
    line-height:20px;
  }

  /* 작업 추가 버튼 */
  #add-task{
    margin: 0 20px;
  }
  /* 상태 레이블 */
  .circle{display:inline-block; width:20px; height:20px; border-radius:20px; background:#ecd718; margin-right:10px;}
  /* 작업분류박스 */
  .column{
    border: 1px solid #e4e4e4;
    padding-top: 20px;
    padding-bottom: 10px;
    min-height: calc(70vh);
  }

  /* 작업 목록 */
  #task-category{font-size:14px; margin-bottom:15px;}
  .task-box{
    border:1px solid #e4e4e4;
    width:300px;
    font-size:14px;
    margin:auto;
    margin-bottom:12px;
    border-radius:3px;
    box-shadow: 10px 10px 10px -10px lightgray;
  }
  .task-box:hover{cursor:pointer;}
  .task-box div{margin:12px 15px;}
  .task-title{
    font-weight:800;
    text-overflow:ellipsis;
    overflow:hidden;
    word-break: break-word;
    display:-webkit-box;
    -webkit-line-clamp:2;
    -webkit-box-orient: vertical;
  }
  .file{color:gray; margin-bottom:10px;}
  .ref-people{display:inline-block; width:180px; text-align:right; font-size:12px;}
  .status{display:inline-block; color:white; width:50px; border-radius:5px; text-align:center; font-size:12px;}

  /* 상태 */
  .status-wait{background:#ecd718; }
  .status-working{background:#04b43f;}
  .status-done{background:#00b5d1;}
  .status-hold{background:lightgray;}

  /* 작업이동시 그림자 */
  .move-task{
    margin:0 1em 1em 0;
    height:50px;
    margin-left:auto;
    margin-right:auto;
    background-color: rgba(240, 240, 240, 0.671);
  }
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	
	<div id="content">
        <h2 class="title"><b>업무</b></h2>
        <br><br>
        <div class="sub-menu">
            <a href="#" class="active">프로젝트 현황</a>
            <!-- 관리자일 때만 보여야 함 -->
            <a href="#">프로젝트 관리</a>
        </div>
        <hr>
        <br>
        
        <!-- Swiper -->
        <div class="swiper mySwiper">
          <div class="swiper-wrapper">
	          <c:forEach var="p" items="${pList}">
	            <div class="swiper-slide" onclick="detailLoad(this);">
	              <div class="project-box">
                  <input type="hidden" name="projectNo" value="${p.projectNo}">
                  <input type="hidden" name="projectDetail" value="${p.detail}">
	                <div class="project-title">${p.projectName}</div>
	                <div class="project-manager">PM : ${p.projectManager} / ${p.projectParticipants[0].departmentName}</div>
	                <div class="project-schedule">기간: ${p.startDate} ~ ${p.endDate}</div>
	              </div>
	            </div>
	          </c:forEach>
          </div>
          <div class="swiper-pagination"></div>
        </div>
        <br>
        <hr>
        
        <!-- Swiper JS -->
        <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

        <!-- Initialize Swiper -->
        <script>
          $(function(){
            let option = {
                slidesPerView: 4,
                spaceBetween: 30,
                // slidesPerGroup: 4,
                // loopFillGroupWithBlank: true,
                freeMode: true,
                direction: 'horizontal',
                loop: true,
                autoplay: {
                  delay: 3500,
                  disableOnInteraction: false,
                },
                // If we need pagination
                pagination: {
                  el: ".swiper-pagination",
                  clickable: true,
                },
                // And if we need scrollbar
                scrollbar: {
                  el: '.swiper-scrollbar'
                }
            };

            if($(".swiper-slide").length <= 4){
              option.loop = false;
            }

            const swiper = new Swiper('.swiper', option)
          })
      </script>
      
      <!-- 프로젝트 클릭 -->
      <script>
        $(function(){
          var firstSlide = $(".swiper-slide-active");
          detailLoad(firstSlide);
        })

        function detailLoad(e){

            $(e).addClass("active");
            $(e).siblings().removeClass("active");
            
            let projectName = $(e).find(".project-title").text();
            $("#p-title").html("<b>" + projectName + "</b>");

            let projectDetail = $(e).find("input[name=projectDetail]").val();
            $("#p-detail").text(projectDetail);

            let pm = $(e).find(".project-manager").text();
            $("#pm").text(pm);
            
            let projectNo = $(e).find("input[name=projectNo]").val();
            
            $.ajax({
              url:"detail.pr",
              data:{"projectNo":projectNo},
              success:function(obj){
                let ppList = obj.ppList;
                let tList = obj.tList
                
                let member = "";
                for(let i=0; i<ppList.length; i++){
                  member += ppList[i].userName + " / " + ppList[i].departmentName + ", ";
                }
                member = "참여자 : " + member.substring(0, member.lastIndexOf(","));
                $("#member-list").html(member);

                let status = "";
                let task = "";
                for(let i=0; i<tList.length; i++){
                  task += "<div class='task-box'>"
                        + "<div class='task-title'>" + tList[i].taskName + "</div>"
                        + "<div class='file'>파일명.jpg</div>";
                  
                  status = tList[i].taskStatus;
                  switch(status){
                    case "1": status = "대기";
                            task += "<div class='status status-wait'>";
                            break;
                    case "2": status = "진행중";
                            task += "<div class='status status-working'>";
                            break;
                    case "3": status = "완료";
                            task += "<div class='status status-done'>";
                            break;
                    case "4": status = "보류";
                            task += "<div class='status status-hold'>";
                            break;
                  }

                  task += status + "</div>"
                        + "<div class='ref-people'>참조인 18명</div>"
                        + "</div>";
                  
                  $("#task-list .wait-list").append(task);
                  
                }


              }, error:function(){
                console.log("정보 가져오기 실패");
              }
            })

        }
      </script>

      <h5 id="p-title"></h5>
      <div class="p-summary">
        <div id="p-detail"></div>
        <br>
        <div id="pm"></div>
        <div id="member-list"></div>
      </div>
      <br>
      <div id="progress-area">
        <span style="font-size:14px;"><b>진행률</b></span>
        <br><br>
        <div class="progress">
          <div class="progress-bar" role="progressbar" style="width: 95%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">75%</div>
        </div>
      </div>
      <br><br><br>
      <div id="task-area">
        <span style="font-size:16px;"><b>작업 현황</b></span>
        <button id="add-task" class="btn-purple">+ 작업 만들기</button>
        <br><br>
        <div class="row" id="task-category">
          <div class="col" id="wait"><div class="circle status-wait"></div>대기</div>
          <div class="col" id="working"><div class="circle status-working"></div>작업중</div>
          <div class="col" id="done"><div class="circle status-done"></div>완료</div>
          <div class="col" id="hold"><div class="circle status-hold"></div>보류</div>
        </div>
        <div class="row" id="task-list">
          <div class="col column wait-list">
            <div class="task-box" data-toggle="modal" data-target="#task">
              <div class="task-title">어쩌구저쩌구 작업ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</div>
              <div class="file">파일명.jpg</div>
              <div class="status status-wait">대기중</div>
              <div class="ref-people">참조인 18명</div>
            </div>
            <div class="task-box">
              <div class="task-title">어쩌구저쩌구 작업</div>
              <div class="file">파일명.jpg</div>
              <div class="status status-wait">대기중</div>
              <div class="ref-people">참조인 18명</div>
            </div>
          </div>
          
          <div class="col column working-list">
            <div class="task-box">
              <div class="task-title">어쩌구저쩌구 작업</div>
              <div class="file">파일명.jpg</div>
              <div class="status status-working">작업중</div>
              <div class="ref-people">참조인 18명</div>
            </div>
            <div class="task-box">
              <div class="task-title">어쩌구저쩌구 작업</div>
              <div class="file">파일명.jpg</div>
              <div class="status status-working">작업중</div>
              <div class="ref-people">참조인 18명</div>
            </div>
          </div>

          <div class="col column done-list">
            <div class="task-box">
              <div class="task-title">어쩌구저쩌구 작업</div>
              <div class="file">파일명.jpg</div>
              <div class="status status-done">완료</div>
              <div class="ref-people">참조인 18명</div>
            </div>
            <div class="task-box">
              <div class="task-title">어쩌구저쩌구 작업</div>
              <div class="file">파일명.jpg</div>
              <div class="status status-done">완료</div>
              <div class="ref-people">참조인 18명</div>
            </div>
          </div>
          
          <div class="col column hold-list">
            <div class="task-box">
              <div class="task-title">어쩌구저쩌구 작업</div>
              <div class="file">파일명.jpg</div>
              <div class="status status-hold">보류</div>
              <div class="ref-people">참조인 18명</div>
            </div>
            <div class="task-box">
              <div class="task-title">어쩌구저쩌구 작업</div>
              <div class="file">파일명.jpg</div>
              <div class="status status-hold">보류</div>
              <div class="ref-people">참조인 18명</div>
            </div>
          </div>
        </div>
      </div>
      <br><br><br>

      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
      <script>
        $(function() {
          $(".column").sortable({
            // 그룹
            connectWith: ".column",
            // 움직일 요소
            handle: ".task-title",
            // 이동 시 배경
            placeholder: "move-task"
          });
        });
      </script>

      <!-- The Modal -->
      <div class="modal" id="task">
        <div class="modal-dialog">
          <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">작업 상세</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
              <div class="task-title">어쩌구저쩌구 작업</div>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>

        </div>
      </div>
    </div>


    </div>

    
</body>
</html>