<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Alertify 쓸 건지..? 아무도 안쓰면 나중에 삭제하기 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	
	
	/* 모든 div : boxsize, 글씨색상 통일 */
	div{box-sizing: border-box; color:rgb(60,60,60);}
	/* 버튼 모양 통일 */
	button{
	    border:none;
	    border-radius:5px;
	    background:rgb(230,230,230);
	    color:rgb(60,60,60);
	    padding:3px 7px;
	}
	button:hover{
	    cursor:pointer;
	    font-weight:600;
	    background-color: rgb(220,220,220);
	    transition: background 0.3s;
	}
	.btn-purple{
	    border:none;
	    border-radius:5px;
	    background:#6F50F8;
	    color:white;
	    padding:3px 7px;
	}
	.btn-purple:hover{
	    cursor:pointer;
	    font-weight:600;
	    background-color: rgb(98, 69, 230);
	    transition: background 0.3s;
	}
	
	.outer{
	    width:100%;
	    margin:auto;
	    position:relative;
	}
	.outer>div{float:left;}
	#header{
	    width:100%;
	    height:30px;
	    position:fixed;
	    background:linear-gradient( to right, #6F50F8 60%, #FFCECE);
	    z-index:1;
	}
	
	#content{
	    width:1450px;
	    position:absolute;
	    left:250px;
	    top:30px;
	    padding:40px;
	}
	
	#side-menubar{
	    height:100vh;
	    width:250px;
	    margin-top:30px;
	    position:fixed;
	    background:rgb(250,250,250);
	    padding:40px 20px;
	}
	
	.nametag-background{
	    background-color:#6F50F8;
	    border-radius:7px;
	    text-align:center;
	}
	.nametag-name{
	    color:white;
	    font-weight:700;
	    letter-spacing:1px;
	}
	
	#side-my-name{
	    width:120px;
	    font-size:20px;
	    font-weight:600;
	    padding-left:20px;
	}
	#side-my-name:hover{
	    cursor:pointer;
	    font-weight:900;
	    background: linear-gradient(to right, #6F50F8, #FFCECE);
	    color: transparent;
	    -webkit-background-clip:text;
	    transition: all 0.3s;
	}
	
	.side-menu{
	    height:35px; width:210px;
	    margin-top: 10px;
	    cursor:pointer;
	    position:relative;
	}
	.side-menu img{
	    margin:7px 20px;
	    width:18px;
	}
	.side-menu span{
	    position:absolute;
	    left:65px;
	    top:6px;
	    font-size:15px;
	}
	.side-menu:hover{
	    background:rgb(230,230,230);
	    border-radius:5px;
	    font-weight:600;
	}
	
</style>
</head>
<body>

	<c:if test="${ not empty alertMsg }">
		<script>
			swal('', "${ alertMsg }", 'success')
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	
	<div class="outer">

        <div id="header">

        </div>
        
        <div id="side-menubar">
            <div>
                <table>
                    <tr>
                        <td class="nametag-background" style="width:35px; height:35px; cursor:pointer;" onclick="toMyPage();">
                            <span class="nametag-name" style="font-size:12px;">이름</span>
                        </td>
                        <td id="side-my-name" style="" onclick="toMyPage();">김이름</td>
                        <td style="cursor:pointer"><img src="resources/icons/messenger.png" style="width:25px;" onclick="chatPopup();"></td>
                    </tr>
                </table>
            </div>

            <div class="side-menu" onclick="alarmPopup();" style="margin-top:20px;">
                <img src="resources/icons/bell.png" style="margin:5px 10px; width:23px;">
                <span style="left:50px;">새로운 알림</span>
            </div>

            <hr style="margin:20px 0px;">

            <div class="side-menu" onclick="location.href=''">
                <img src="resources/icons/home.png">
                <span>홈 피드</span>
            </div>

            <div class="side-menu" onclick="location.href='recieveList.ml'">
                <img src="resources/icons/mail.png">
                <span>메일</span>
            </div>

            <div class="side-menu" onclick="location.href='workMain.wo'">
                <img src="resources/icons/time.png">
                <span>근무</span>
            </div>

            <div class="side-menu" onclick="location.href='list.no'">
                <img src="resources/icons/office.png">
                <span>회사소식</span>
            </div>

            <div class="side-menu" onclick="location.href='memberMain.me'">
                <img src="resources/icons/group.png">
                <span>구성원</span>
            </div>

            <div class="side-menu" onclick="location.href='list.ap?myi=1'">
                <img src="resources/icons/approval.png">
                <span>전자결재</span>
            </div>

            <div class="side-menu" onclick="location.href='commonList.doc'">
                <img src="resources/icons/folder.png">
                <span>문서</span>
            </div>

            <div class="side-menu" onclick="location.href=''">
                <img src="resources/icons/booking.png">
                <span>예약</span>
            </div>

            <div class="side-menu" onclick="location.href='list.pr'">
                <img src="resources/icons/monitor.png">
                <span>업무</span>
            </div>

            <hr style="margin:30px 0px;">

            <div class="side-menu" onclick="location.href=''">
                <img src="resources/icons/setting.png">
                <span>설정</span>
            </div>
        </div>
        
        <jsp:include page="../chat/chat.jsp"/>
		<jsp:include page="../alarm/alarmPopup.jsp"/>

        <script>
        
        	/* 마이페이지 url로 이동 */
            function toMyPage(){
            	location.href="myPage.me"
                
            }
            
            /* 새로운 알람 클릭 */
            function alarmPopup(){
            	if($("#alarm-popup").css("display") == "none"){
            		$("#alarm-popup").css("display", "block");
            	}else{
            		$("#alarm-popup").css("display", "none");
            	}
            }
            
            /* 채팅 아이콘 클릭 */
            function chatPopup(){
            	if($("#chat").css("display") == "none"){
            		$("#chat").css("display", "block");
            	}else{
            		$("#chat").css("display", "none");
            	}
            }
        </script>
		
</body>
</html>