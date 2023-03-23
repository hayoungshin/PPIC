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
	    <a href="list.noti" class="btn btn-sm" style="float:right;"><small>전체조회</small></a>
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
		 		console.log('Info : alarm connection opened.');
		 	}
			 	
	   		function onMessage(evt){
	   			if(evt.data == "새채팅"){
	   				if(sockChat == null){
	   					chatAlarm();
	   				}
	   			}else{
	   				selectAlarm();
	   			}
			}
	   		
	    	function onClose(){
	    		console.log('Info : alarm connection closed.');
			}
		}
	    
	    function selectListNoti(){
    		$.ajax({
    			url:"selectList.noti",
    			data:{
    				receiveNo:${loginUser.userNo},
    				catNo:$("input[name=kind]:checked").val()
    			},
    			success:function(list){
    				$("#alarm-name").text($("input[name=kind]:checked").next().text())
    				let value = "";
    				if(list.length == 0){
    					value = "<tr><td colspan='2'>조회된 알림이 없습니다.</td></tr>"
    				}else{
    					for(let i=0; i<list.length; i++){
        					value += "<tr class='line'>"
        							+ "<td>"
        							if(list[i].checkSta == 'N'){
        								value += "🔔"
        							}else{
        								value += "✔️"
        							}
        					value += list[i].nfContent + "&nbsp;"
        							+ list[i].nfDate + "</td>"
        							+ '<td><img src="resources/icons/delete.png" width="8px" height="8px" class="delete-img" id="' + list[i].nfNo + '"></td>'
        							+ "</tr>"
        					alarmList.push(list[i].nfNo);
        				}
    				}
    				$("#alarm-content").html(value);
    			},error:function(){
    				console.log("알림 리스트 조회용 ajax통신 실패")
    			}
    		})
    	}
	    
	    $("#allRead").click(function(){
	    	if(newAlarm.length != 0){
	    		$.ajax({
					url:"update.noti",
					data:{nfArr:newAlarm},
					success:function(result){
						if(result == "success"){
							selectAlarm();
							selectListNoti();
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