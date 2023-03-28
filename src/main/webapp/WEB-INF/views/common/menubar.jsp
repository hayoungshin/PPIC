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

<!-- Alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
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
	    width:
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
	#alarm-count, #chat-count{
		 border-radius:50%; 
		 left:170px; 
		 text-align:center; 
		 background:rgb(244, 89, 89);
		 color:white;
		 font-size:11px;
		 display:none;
	}
	#alarm-count{
		height:25px;
		width:25px;
		line-height:25px;
	}
	
	#chat-count{
		position:fixed;
        z-index:100;
        top:74px;
        left:210px;
        height:22px;
		width:22px;
		font-size:5px;
		line-height:22px;
	}
	
	#profileImg1{
        width:50px;
        height:50px;
        background: rgb(111, 80, 248);
        border-radius: 25%;
    }
    
    .pro1{
        width:50px;
        height:50px;
        background: rgb(111, 80, 248);
        color: white;
        border: none;
        border-radius: 25%;
        font-size:12px;
        font-weight: bold;
        padding-top:15px;
        padding-left:7px
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
        	<div id='clockmain' align="center" style="color:white; font-size:18px; font-weight:600; margin-top:2px;"></div>
			<script>
				$(function(){
					initMain();
					
				});
				
				function getClockMain() {
					
				    var date = new Date();

				    var year = date.getFullYear();
				    var month = date.getMonth();
				    var day = date.getDate();
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
				    
				    document.getElementById("clockmain").innerHTML =year + "년" +month + "월" +day + "일&nbsp;&nbsp;" + hours + ":" + minutes + ":" + seconds;
				    //return hours + ":" + minutes + ":" + seconds;
				    
				}
				
				function initMain() {
					getClockMain();
				    setInterval(getClockMain, 1000); //1초
				}					
			</script>
        </div>
        
        <div id="side-menubar">
            <div>
                <table >
                    <tr >
                        <td  style="width:35px; height:35px; cursor:pointer;" onclick="toMyPage();">
                        		<c:choose>
			                		<c:when test="${ empty loginUser.profileImg }">
			                			<div class="pro1" style="float:left" >${ loginUser.userName }</div>
			                    	</c:when>
			                    	<c:otherwise>
			                    		<img class="nametag-name" id="profileImg1" src="${ loginUser.profileImg }" >
			                    	</c:otherwise>
			                    </c:choose>
                        </td>
                        <td id="side-my-name" style="" onclick="toMyPage();">${loginUser.userName}</td>
                        <td style="cursor:pointer">
                        	<img src="resources/icons/messenger.png" style="width:25px;" onclick="chatPopup();">
                        	<span id="chat-count"></span>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="side-menu" onclick="alarmPopup();" style="margin-top:20px;">
                <img src="resources/icons/bell.png" style="margin:5px 10px; width:23px;">
                <span style="left:50px;">새로운 알림</span>
                <span id="alarm-count"></span>
            </div>

            <hr style="margin:20px 0px;">

            <div class="side-menu" onclick="location.href='main.me'">
                <img src="resources/icons/home.png">
                <span>홈 피드</span>
            </div>

            <div class="side-menu" onclick="location.href='recieveList.ml'">
                <img src="resources/icons/mail.png">
                <span>메일</span>
            </div>

            <div class="side-menu" onclick="location.href='workMain.wo?no=${loginUser.userNo}'">
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

            <div class="side-menu" onclick="location.href='list.pr?no=${loginUser.userNo}'">
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
            
            /* 새로운 알림 클릭 */
            function alarmPopup(){
           		$("#alarm-popup").toggle();
           		if($("#chat").css("display") == "block"){
           			$("#chat").css("display", "none");
           		}
            }
            
            /* 채팅 아이콘 클릭 */
            function chatPopup(){
            	if($("#chat").css("display") == "none"){
            		memList();
            		$("#member-btn").addClass("menuClicked");
                	$("#chat-btn").removeClass("menuClicked");
            		$("#chat").css("display", "block");
            		if($("#alarm-popup").css("display") == "block"){
               			$("#alarm-popup").css("display", "none");
               		}
            	}else{
            		$("#chat").css("display", "none");
            		$("#search-div").html("");
            		$("#chat-body").html("");
            	}
            	if(sockChat){
            		onClose();
            	}
            }
        </script>
        <script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
        <script>
	        let socket = null;
	        let newAlarm = [];
	        
	        function connectAlarm(){
				const sock = new SockJS("${pageContext.request.contextPath}/alarm"); 
					socket = sock;
				
				sock.onopen = onOpen;
				sock.onmessage = onMessage; 
				sock.onclose = onClose; 
				 	
		   		function onOpen(){
			 		console.log('Info : alarm connection opened.');
			 	}
				 	
		   		function onMessage(evt){
		   			let msgArr = evt.data.split(",");
		   			if(msgArr[0] == "새채팅"){
		   				if(sockChat == null || sockChat.readyState != 1 || $("#search-div input").val() != msgArr[1]){
				     		let $chatCount = Number($("#chat-count").text());
				     		if($chatCount == 0){
				     			$("#chat-count").css("display", "block");
				     		}
				     		$("#chat-count").text($chatCount + 1);
				     		if($("#chat-btn").hasClass("menuClicked") && (sockChat == null || sockChat.readyState != 1)){
				     			chatRoomList();
			   				}
		   				}
		   				
		   			}else{
		   				selectAlarm();
		   			}
				}
		   		
		    	function onClose(){
		    		console.log('Info : alarm connection closed.');
				}
			}
	        
	     	// 날짜 포맷
	        function dateFormat(no){
	        	const d = new Date();
	        	if(no == 1){
	        		return d.getFullYear() + "." + ((d.getMonth() + 1) > 9 ? (d.getMonth() + 1).toString() : "0" + (d.getMonth() + 1)) + "." + (d.getDate() > 9 ? d.getDate().toString() : "0" + d.getDate().toString());
	        	} else if(no == 2){
	        		return d.getFullYear() + "." + ((d.getMonth() + 1) > 9 ? (d.getMonth() + 1).toString() : "0" + (d.getMonth() + 1)) + "." + ((d.getDate() - 1) > 9 ? (d.getDate()-1).toString() : "0" + (d.getDate()-1).toString());
	        	} else{
	        		return d.getFullYear() + "년 " + ((d.getMonth() + 1) > 9 ? (d.getMonth() + 1).toString() : "0" + (d.getMonth() + 1)) + "월 " + (d.getDate() > 9 ? d.getDate().toString() : "0" + d.getDate().toString()) + "일 "
	        				+ (d.getHours() < 12 ? " 오전 " + (d.getHours() >= 10 ? d.getHours() : '0' + d.getHours()) : " 오후 " + (d.getHours() - 12 >= 10 ? d.getHours() - 12 : '0' + (d.getHours() - 12))) + ":" + (d.getMinutes() >= 10 ? d.getMinutes() : '0' + d.getMinutes());
	        	}
	        }
	     	
			$(function(){
				connectAlarm();
				selectAlarm();
				chatNotRead();
			})
			
			// 알람 조회
	     	function selectAlarm(){
				$.ajax({
					url:"select.noti",
					data:{userNo:${loginUser.userNo}},
					success:function(list){
						let result1 = "";
						let result2 = "";
						for(let i=0; i<list.length; i++){
							if(list[i].checkSta == "N"){
								result1 += "<tr>"
						            + "<td class='icon'>🔔</td>"
						            + "<td>"
						            + list[i].nfContent + "<br>"
						            + "<small>";
						            if(list[i].nfDate.includes(dateFormat(1))){
						            	result1 += list[i].nfDate.substring(list[i].nfDate.indexOf("오")) 
									}else if(list[i].nfDate.includes(dateFormat(2))){
										result1 += "어제"
									} else{
										result1 += list[i].nfDate.substring(0, list[i].nfDate.indexOf("오"))
									}
						            result1 += "</small>"
						            	+ "</td>"
						        		+ "</tr>";
						        	newAlarm.push(list[i].nfNo);
							}else{
								result2 += "<tr>"
						            + "<td class='icon'>✔️</td>"
						            + "<td>"
						            + list[i].nfContent + "<br>"
						            + "<small>"
						            if(list[i].nfDate.includes(dateFormat(1))){
						            	result2 += list[i].nfDate.substring(list[i].nfDate.indexOf("오")) 
									}else if(list[i].nfDate.includes(dateFormat(2))){
										result2 += "어제"
									} else{
										result2 += list[i].nfDate.substring(0, list[i].nfDate.indexOf("오"))
									}
						            result2 += "</small>"
						            	+ "</td>"
						        		+ "</tr>"
							}
						}
						if(result1 == ""){
							result1 += "<tr><td colspan='2'>새로운 알림이 없습니다.</td></tr>";
							$("#alarm-count").css("display", "none");
						}else{
							$("#alarm-count").text(list[0].nfCount);
							$("#alarm-count").css("display", "block");
						}
						if(result2 == ""){
							result2 += "<tr><td colspan='2'>지난 알림이 없습니다.</td></tr>";
						}
						$("#newalarm").html(result1);
						$("#checkalarm").html(result2);
					},error:function(){
						console.log("알람 조회용 ajax통신실패")
					}
				})
	     	}
	     	
	     	function chatNotRead(){
	     		$.ajax({
	     			url:"notRead.chat",
	     			data:{
	     				userNo:${loginUser.userNo}
	     			},success:function(count){
	     				if(count > 0){
	     					$("#chat-count").css("display", "block");
	     					$("#chat-count").text(count)
	     				}else{
	     					$("#chat-count").css("display", "none");
	     				}
	     			}
	     		})
	     	}
        </script>
		
</body>
</html>