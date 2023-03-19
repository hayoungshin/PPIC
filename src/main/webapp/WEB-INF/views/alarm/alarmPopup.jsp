<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<style>
    #alarm-popup{
    	background:white;
        border: 1px solid rgb(202, 199, 199);
        width:250px;
        height:450px;
        border-radius:5px;
        padding:15px;
        font-size: 12px;
        overflow: auto;
        position:fixed;
        z-index:100;
        top:120px;
        left:250px;
        display:none;
    }
    #alarm-popup::-webkit-scrollbar {
	    width: 8px; 
	}
	
	#alarm-popup::-webkit-scrollbar-thumb {
	    background: lightgray;
	    border-radius: 10px;
	}
    #allRead{
        color:white;
        width:70px;
        height:30px;
        font-size: 12px;
        background: rgb(111, 80, 248);
    }
    #alarm-popup td{
        padding:3px;
    }
    .icon{
        vertical-align: top;
    }
</style>
</head>
<body>
    <div id="alarm-popup">
	    <b style="font-size:17px;">새로운 알림</b>
	    <button class="btn btn-sm" style="float:right" id="allRead">모두 읽음</button>
	    <br><br>
	    <table id="newalarm">
	    </table>
	    <br>
	    <b style="font-size:17px;">지난 알림</b>
	    <a href="" class="btn btn-sm" style="float:right;"><small>전체조회</small></a>
	    <br><br>
	    <table id="checkalarm">
	    </table>
    </div>
    <script>
	    function connectAlarm(){
			const sock = new SockJS("${pageContext.request.contextPath}/alarm"); 
				socket = sock;
			
			sock.onopen = onOpen;
			sock.onmessage = onMessage; 
			sock.onclose = onClose; 
			 	
	   		function onOpen(){
			 		console.log('Info : connection opened.');
			 	}
			 	
	   		function onMessage(evt){
	   			console.log(evt.data + '\n');
	   			selectAlarm();
			}
	   		
	    	function onClose(){
	    		console.log('Info : connection closed.');
			}
		}
	    $("#allRead").click(function(){
	    	if(newAlarm.length != 0){
	    		$.ajax({
					url:"update.noti",
					data:{nfArr:newAlarm},
					success:function(result){
						if(result == "success"){
							selectAlarm();
						}
					},error:function(){
						console.log("모두읽음 처리용 ajax통신 실패")
					}
	    		})
	    	}
	    })
	    
    </script>
    
</body>
</html>