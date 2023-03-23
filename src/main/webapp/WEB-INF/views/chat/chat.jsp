<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #chat, #participantList{
        border: 1px solid rgb(202, 199, 199);
        border-radius:5px;
        font-size: 13px;
        background:white;
        position:fixed;
        z-index:100;
        display:none;
    }
    #chat{
    	width:300px;
        height:510px;
        top:70px;
        left:250px;
    }
    #participantList{
        width:200px;
        height:430px;
        top:150px;
        left:550px;
        padding:15px;
    }
    #participants>div{margin-bottom:15px;}
    #participants>div>*{margin-right:5px;}
    #participants{height:320px; overflow:auto;}
	#button-area>img{
		 float:right;
		 margin-top:10px;
	}
	#participants .collegeProfileImg, #button-area>img{cursor:pointer;}
	#chatMe{
		float:right;
		border-radius:50%;
		background:gray;
		color:white;
		height:20px;
		width:20px;
		text-align:center;
		line-height:20px;
		font-size:10px;
	}
	
    /* chat header 스타일 */
    #chat-header{
     position:sticky;
    }
    #chat-logo{padding:10px;}
    #chat .profileImg, #chat .collegeProfileImg{cursor:pointer;} 
	.pro-small{width: 25px; height:25px;}
	.pro-middle{width: 70px; height:70px;}
	.pro-big{width: 150px; height:150px;}
	.pro-chat{width:40px; height:40px;}
	.pro-group{width:20px; height:20px;}

    /* chat 메뉴 스타일 */
    #chat-menu{
        height:35px;
        line-height: 30px; 
        background:linear-gradient( to right, #6F50F8 5%, #FFCECE);;
    }
    #chat-menu>*{padding-left:18px;}
    .menuClicked{filter: brightness(85%)}
    #chat-menu>img{cursor: pointer;}
    #chat-menu>img:active{cursor: pointer; filter: brightness(85%)}

    /* chat 검색 스타일 */
    #search-area tr{border-bottom:1px solid lightgray;} 
    #chat input[type=text]{
        height:30px;
        width:250px;
        border:none; 
    }
    #search-area button{
        box-sizing:border-box;
        border:none;
        background:none;
        cursor:pointer;
    } 

    /* chat body 스타일 */
    #chat-body{
        height:380px;
        overflow:auto;
    }
    #chat-body::-webkit-scrollbar {width: 8px;}
	
	#chat-body::-webkit-scrollbar-thumb {
	    background: lightgray; 
	    border-radius: 10px;
	}

    /* 주소록&채팅생성 스타일 */
    #college-area, #chatRoomCreate{padding:10px;}
    #college-area>div, #chatRoomCreate>div{padding:5px; cursor:pointer;} 
    #college-area img, #chatRoomCreate img{margin-right:5px;}
    .detail>div{padding:5px;}
    .detail>div>span:hover, #chatRoomList-area tr:hover{opacity:0.7;}
    .detail{display: none;} 
    .detail>div>span{
        display:inline-block; 
        width:190px;
    }
    .detail label{
        cursor: pointer; 
        width:80%;
    }
    .conn, .conn-my{
        display:inline-block;
        margin-bottom:10px;
        height:5px;
        width:5px;
        border-radius: 50%;
    }
    .online{background: rgb(60, 220, 60);}
    .offline{background: rgb(236, 69, 69);}
    .out{background: rgb(245, 203, 89);}

    /* chatRoomList 스타일 */
    #chatRoomList-area{padding:10px;}
    #chatRoomList-area td{padding:5px 3px;}
    #chatRoomList-area tr{cursor: pointer;}
    #chatRoomList-area span{
        float:right; 
        height:18px; 
        width:18px; 
        border-radius:50%; 
        text-align: center; 
        line-height: 17px; 
        background:red; 
        color:white;
        margin-top:3px;
    }
    .table-time{
        text-align: right;
        width:60px;
    }

    /* 채팅방 생성 스타일 */
    #plus-btn, #createChat{
        background: rgb(111, 80, 248);
        position:fixed;
        z-index:100;
        cursor:pointer;
        text-align: center;
        color:white;
    }
    #plus-btn{
        width:30px;
        height:30px;
        border-radius: 50%;
        font-size: 30px;
        font-weight: 100;
        line-height: 25px;
        top:540px;
        left:510px;
    }
    #plus-btn:active{opacity:0.7;}
    #createChat{
        font-size: 10px;
        width:70px;
        border:none;
        border-radius: 5px;
        top:540px;
        left:470px;
        line-height: 20px;
    }
    #chat input[type=checkbox]{
        width:10px;
        height:10px;
    }

    /* 모달 스타일 */
    #collegeProfile p{margin:5px;}
    #myProfile img{
        margin-left:10px;
        margin-right:20px
    }
    #myProfile select{
        width: 90px;
        border: 1px solid rgb(202, 199, 199);
        height: 30px;
        border-radius: 5px;
        cursor: pointer;
        margin-left:10px;
    }
    #update-btn, #exit-btn{
        color:white;
        width:70px;
        height:30px;
        font-size: 12px;
        background: rgb(190, 190, 190);
    }
    #update-btn{background: rgb(111, 80, 248);}
    #like-img{
    	width:20px; 
    	margin-bottom:5px;
    	cursor:pointer;
    }
    
    /* 채팅영역 스타일 */
    .chat-area{
        height:280px; 
        overflow: auto; 
        display: flex;
        flex-direction: column;
    }
    .chat-area::-webkit-scrollbar, #participants::-webkit-scrollbar {width: 8px;}
	
	.chat-area::-webkit-scrollbar-thumb, #participants::-webkit-scrollbar-thumb {
	    background: lightgray; 
	    border-radius: 10px;
	}
    .chat-area::before, #participants::before {
        content: "";
        display: block;
        flex: 1;
    }
    .chat-area img{cursor:pointer}
    .send-user{margin-left:10px;}
    .send-user>*{margin-right:5px;}
    .chat-message.mine{display: flex; justify-content:flex-end;}
    .chat-message.other{display: flex; justify-content:flex-start;}
    .chat-message{margin:5px 15px;}
    .chat-message .send-message{
        padding: 5px 7px;
        border-radius: 5px;
        max-width: 180px;
        font-size:0.9em;
        white-space: pre-line;
    }
    .chat-message.other .send-message{background: rgb(240, 240, 240); margin-top:3px; margin-left:25px;;}
    .chat-message.mine .send-message{background: rgb(111, 80, 248); color:white;}
    .form-group{padding:10px 0px 10px 10px;}
    .form-group>*{float: left;}
    .form-group>textarea{margin-right:5px;}
    .form-group button{
        width:54px;
        height:87px;
        border: none;
        background:rgb(111, 80, 248); 
        color:white;
        border-radius:5px;
    }
    .notreadCount{
    	display:flex; 
    	align-items: flex-end;
    	font-size:10px;
    	margin:0px 5px;
    }
    
    /* chat profile-area 스타일 */
    #profile-area{padding:5px; line-height: 30px; border-bottom: 1px solid lightgray;}
    #profile-area button{border:none; background:none;}
    #profile-area>img{
    	margin:0px 5px;
    	height:15px;
    	width:15px;
   	}
    #profile-area>span>img{
    	float: right; 
    	margin-top:5px;
    	margin-left:5px;
    	height:20px;
    	width:20px;
    	opacity:0.8;
   	}
   	#profile-area img{cursor:pointer;}
</style>
</head>
<body>

	<div id="chat">
        <div id="chat-header">
            <div id="chat-logo">
                <b style="font-size:17px;">PPIC CHAT 💬</b>
                <span style="float:right;">
                    ${ loginUser.userName }&nbsp;
                    <img class="profileImg pro-small rounded-circle" src="<c:out value='${ loginUser.profileImg }' default='resources/icons/profile.png' />">
                    <span class="conn-my"></span> 
                    <input type="hidden" name="openChatRoomNo">
                </span>
            </div>
    
            <div id="chat-menu">
                <img src="resources/icons/user.png" style="height:25px; width:45px;" id="member-btn" onclick="showUser();"> 
                <img src="resources/icons/chat.png" style="height:25px; width:45px;" id="chat-btn" onclick="showChatting();"> 
            </div> 
            
            <div id="search-div">
            </div>
			
        </div>
        <div id="chat-body">
        	
        </div>
    </div>
    <div id="participantList">
    	<b style="font-size:15px;">대화상대</b><br><br>
    	<div id="participants">
    	</div>
    	<div id="button-area"></div>
    </div>
    <script>
	   	$(function(){
	   		// chatheader에 표시되는 내 접속상태
	   		myConnSta(${loginUser.connSta});
	   		
	   		// 주소록 불러오기
	   		showUser();
	   		
	   		if(sockChat){
        		onClose();
        	}
	   	})
	   	
	   	// 채팅 메뉴바 클릭 (주소록)
        function showUser(){
        	memList();
        	$("#member-btn").addClass("menuClicked");
        	$("#chat-btn").removeClass("menuClicked");
        	$("input[name=keyword]").val("");
        	if(sockChat){
        		onClose();
        	}
        }

        // 채팅 메뉴바 클릭 (채팅목록)
        function showChatting(){
            chatRoomList();
        	$("#chat-btn").addClass("menuClicked");
        	$("#member-btn").removeClass("menuClicked");
        	$("input[name=keyword]").val("");
        	if(sockChat){
        		onClose();
        	}
        }
	   	
	   	// 주소록 불러오기 => ajax
   		function memList(){
   			$.ajax({
	   			url:"memList.chat",
	   			data:{userNo:${loginUser.userNo}},
        		success:function(map){
        			console.log(map)
        			let value1 = "<div class='detailView' id='memberList'>"
		    					+ "<img src='resources/icons/up-arrow.png' height='15px' width='15px'>&nbsp;"
		    					+ "내 부서"
		    					+ "</div>"
		    					+ "<div class='detail' style='display:block;'>";
        			let value2 = "";
        			let value3 = "<div id='college-area'><div class='detailView'>"
		    					+ "<img src='resources/icons/up-arrow.png' height='15px' width='15px'>&nbsp;"
		    					+ "즐겨찾기"
		    					+ "</div>"
		    					+ "<div class='detail' style='display:block;'>";
		    		let value4 = "<table id='search-area'>"
		    					+	"<tr>"
		    					+		"<td width='300px' id='search-change'>"
		    					+			"<input type='text' name='keyword' placeholder='&nbsp;이름으로 검색하세요'>"
                    			+ 			"<button id='nameSearch-btn'><img src='resources/icons/search.png' height='25px' width='25px'></button>"
                    			+		"</td></tr></table>"
		    		let likeCount = 0; // 즐겨찾는 사람수
		    		
        			for(let i=0; i<map.deptList.length; i++){
        				if(map.deptList[i].departmentName == "${loginUser.department}"){
	        				for(let j=0; j<map.memList.length; j++){
	        					if(map.memList[j].userNo != ${loginUser.userNo }){ // 본인 제외
	        						if(map.memList[j].department == map.deptList[i].departmentName){
		        						value1 += "<div><input type='hidden'><img src='";
		        						if(map.memList[j].profileImg != undefined){
		        							value1 += map.memList[j].profileImg
		        						}else{
		        							value1 += "resources/icons/profile.png"
		        						}
		        						value1 += "' class='rounded-circle collegeProfileImg pro-small'>"
		        							+ "<input type='hidden' value='" + map.memList[j].userNo +"'>"
		        							+ "<input type='hidden' value='" + map.memList[j].userName +"'>"
		        							+ "<input type='hidden' value='" + map.memList[j].department +"'>"
		        							+ "<input type='hidden' value='" + map.memList[j].position +"'>"
		        							+ "<input type='hidden' value='" + map.memList[j].mail +"'>"
		        							+ "<input type='hidden' value='" + map.memList[j].phone +"'>"
		        							+ "<input type='hidden' value='" + map.memList[j].chatLike +"'>"
		        							+ "<span ondblclick='chatOne(" + map.memList[j].roomNo + ", " + map.memList[j].userNo + ")'>" + map.memList[j].userName + "&nbsp;<span class='conn";
		        						if(map.memList[j].connSta == 0){
		        			        		value1 += " online";
		        			       		} else if(map.memList[j].connSta == 1){
		        			       			value1 += " offline";
		        			       		} else if(map.memList[j].connSta == 2){
		        			       			value1 += " out";
		        			       		}
		        						console.log(map.memList[1].connSta)
		        						value1 += "'></span></span></div>";
		        					}
	        					}
	        				}
	        				value1 += "</div>";
        				} else{
        					value2 += "<div class='detailView'>"
	        					+ "<img src='resources/icons/right-arrow.png' height='15px' width='15px'>&nbsp;"
	        					+ map.deptList[i].departmentName
	        					+ "</div>"
	        					+ "<div class='detail'>";
	        				for(let j=0; j<map.memList.length; j++){
	        					if(map.memList[j].department == map.deptList[i].departmentName){
	        						value2 += "<div><input type='hidden'><img src='";
	        						if(map.memList[j].profileImg != undefined){
	        							value2 += map.memList[j].profileImg
	        						}else{
	        							value2 += "resources/icons/profile.png"
	        						}
	        						value2 += "' class='rounded-circle collegeProfileImg pro-small'>"
	        							+ "<input type='hidden' value='" + map.memList[j].userNo +"'>"
	        							+ "<input type='hidden' value='" + map.memList[j].userName +"'>"
	        							+ "<input type='hidden' value='" + map.memList[j].department +"'>"
	        							+ "<input type='hidden' value='" + map.memList[j].position +"'>"
	        							+ "<input type='hidden' value='" + map.memList[j].mail +"'>"
	        							+ "<input type='hidden' value='" + map.memList[j].phone +"'>"
	        							+ "<input type='hidden' value='" + map.memList[j].chatLike +"'>"
	        							+ "<span ondblclick='chatOne(" + map.memList[j].roomNo + ", " + map.memList[j].userNo + ")'>" + map.memList[j].userName + "&nbsp;<span class='conn";
	        						if(map.memList[j].connSta == 0){
	        			        		value2 += " online";
	        			       		} else if(map.memList[j].connSta == 1){
	        			       			value2 += " offline";
	        			       		} else if(map.memList[j].connSta == 2){
	        			       			value2 += " out";
	        			       		}
	        						value2 += "'></span></span></div>";
	        					}
	        				}
	        				value2 += "</div>"
        				}
        			}
        			for(let k=0; k<map.memList.length; k++){
    					if(map.memList[k].chatLike != undefined){
    						value3 += "<div><input type='hidden'><img src='";
    						if(map.memList[k].profileImg != undefined){
    							value3 += map.memList[k].profileImg
    						}else{
    							value3 += "resources/icons/profile.png"
    						}
    						value3 += "' class='rounded-circle collegeProfileImg pro-small'>"
    							+ "<input type='hidden' value='" + map.memList[k].userNo +"'>"
    							+ "<input type='hidden' value='" + map.memList[k].userName +"'>"
    							+ "<input type='hidden' value='" + map.memList[k].department +"'>"
    							+ "<input type='hidden' value='" + map.memList[k].position +"'>"
    							+ "<input type='hidden' value='" + map.memList[k].mail +"'>"
    							+ "<input type='hidden' value='" + map.memList[k].phone +"'>"
    							+ "<input type='hidden' value='" + map.memList[k].chatLike +"'>"
    							+ "<span ondblclick='chatOne(" + map.memList[k].roomNo + ", " + map.memList[k].userNo + ")'>" + map.memList[k].userName + "&nbsp;<span class='conn";
    						if(map.memList[k].connSta == 0){
    			        		value3 += " online";
    			       		} else if(map.memList[k].connSta == 1){
    			       			value3 += " offline";
    			       		} else if(map.memList[k].connSta == 2){
    			       			value3 += " out";
    			       		}
    						value3 += "'></span></span></div>";
    						likeCount += 1;
    					}
    				}
        			if(likeCount == 0){
        				value3 += "<div><small>즐겨찾는 멤버가 없습니다.</small></div>"
        			}
        			value2 += "</div>";
    				value3 += "</div>";
        			$("#chat-body").html(value3 + value1 + value2);
        			$("#search-div").html(value4);
        		},error:function(){
        			console.log("주소록 불러오기용 ajax 통신 실패");
        		}
	   		})
   		}
	   	
        // 내 프로필 보기
        $(".profileImg").click(function(){
        	// 접속 상태 selected
        	$("#myProfile option").each(function(){
        		if($(this).val() == "${ loginUser.connSta}"){
        			$(this).attr("selected", true);
        		}
        	})
            $("#myProfile").modal("show");
        })
        
       	// 내 접속상태 표시/변경
        function myConnSta(no){
        	if(no == 0){
        		$(".conn-my").addClass("online");
        		$(".conn-my").removeClass("offline");
        		$(".conn-my").removeClass("out");
       		} else if(no == 1){
       			$(".conn-my").addClass("offline");
       			$(".conn-my").removeClass("online");
        		$(".conn-my").removeClass("out");
       		} else if(no == 2){
       			$(".conn-my").addClass("out");
       			$(".conn-my").removeClass("offline");
        		$(".conn-my").removeClass("online");
       		}
        }

        // 내 프로필 접속상태 변경 => ajax
        $(document).on("click", "#update-btn", function(){
        	$.ajax({
        		url:"updateConn.chat",
        		data:{
        			userNo:${loginUser.userNo},
        			userId:"${loginUser.userId}",
        			connSta:$("#myProfile select").val()
        		},success:function(updateUser){
        			if(updateUser != null){
        				myConnSta(updateUser.connSta);
        				$("#myProfile").modal("hide");
        			}
        		},error:function(){
        			console.log("내 접속상태 변경용 ajax 통신 실패");
        		}
        	})
        })
        
        // 주소록 펼쳐보기
        $(document).on("click", ".detailView", function(){
            $(this).next().slideToggle();
           	$img = $(this).children("img")
           	if($img.attr("src") == "resources/icons/up-arrow.png"){
           		$img.attr("src", "resources/icons/right-arrow.png")
           	}else{
           		$img.attr("src", "resources/icons/up-arrow.png")
           	}
        })

        // 동료 프로필 보기
       	$(document).on("click", ".collegeProfileImg", function(){
       		let $this = $(this).siblings();
       		let info = "<p>💻 " + $this.eq(3).val() + "부 (" + $this.eq(4).val() + ")</p><p>✉️ " + $this.eq(5).val() + " </p><p>📞 " + $this.eq(6).val() + " </p>";
            $("#collegeName").html($this.eq(2).val());
            $("#collegeInfo").html(info);
            $("#modal-profile").attr("src", $(this).attr("src"));
            if($this.eq(7).val() == "undefined"){
            	$("#like-img").attr("src", "resources/icons/star.png");
            	$("#like-img").attr("class", "n");
            }else{
            	$("#like-img").attr("src", "resources/icons/star-y.png");
            	$("#like-img").attr("class", "y");
            }
            $("#userNo").val($this.eq(1).val());
       		$("#collegeProfile").modal("show");
        })
        
        // 멤버 즐겨찾기 => ajax
        $(document).on("click", "#like-img", function(){
        	$.ajax({
        		url:"likeMember.chat",
	   			data:{
	   				userNo:${loginUser.userNo},
	   				chatLike:$(this).next().val(),
	   				star:$("#like-img").attr("class")
        		},success:function(result){
        			if(result == "success"){
        				if($("#like-img").attr("class") == "n"){
        					$("#like-img").attr("class", "y");
        					$("#like-img").attr("src", "resources/icons/star-y.png");
        				} else{
        					$("#like-img").attr("class", "n");
        					$("#like-img").attr("src", "resources/icons/star.png");
        				}
        				if($("#chat-body").html().includes("memberList")){
        					memList();
        				}else if($("#chat-body").html().includes("chatRoomCreate")){
        					plusChatRoom();
        				}else{
        					nameSearch();
        				}
        			}
        		},error:function(){
        			console.log("멤버 즐겨찾기용 ajax 통신 실패");
        		}
        	})
        })
        
        // 주소록 이름 검색
        function nameSearch(){
        	$.ajax({
        		url:"searchName.chat",
        		data:{
        			userName:$("input[name=keyword]").val().replace(/ /g, ''), // 공백제거
        			userNo:${loginUser.userNo}
        		},success:function(list){
        			let value = "";
        			for(let i=0; i<list.length; i++){
        				value += "<div class='detail' style='display:block;'>"
        					+ "<div><input type='hidden'><img src='"
        					if(list[i].profileImg != undefined){
    							value += list[i].profileImg
    						}else{
    							value += "resources/icons/profile.png"
    						}
    						value += "' class='rounded-circle collegeProfileImg pro-small'>"
    							+ "<input type='hidden' value='" + list[i].userNo +"'>"
    							+ "<input type='hidden' value='" + list[i].userName +"'>"
    							+ "<input type='hidden' value='" + list[i].department +"'>"
    							+ "<input type='hidden' value='" + list[i].position +"'>"
    							+ "<input type='hidden' value='" + list[i].mail +"'>"
    							+ "<input type='hidden' value='" + list[i].phone +"'>"
    							+ "<input type='hidden' value='" + list[i].chatLike +"'>"
    							+ "<span ondblclick='chatOne(" + list[i].roomNo + ", " + list[i].userNo + ")'>" + list[i].userName + "&nbsp;<span class='conn";
    						if(list[i].connSta == 0){
    			        		value += " online";
    			       		} else if(list[i].connSta == 1){
    			       			value += " offline";
    			       		} else if(list[i].connSta == 2){
    			       			value += " out";
    			       		}
    						value += "'></span></span></div></div>";
        			}
        			$("#college-area").html(value);
        		},error:function(){
        			console.log("주소록 검색용 ajax 통신 실패");
        		}
        	})
        }
        $(document).on("click", "#nameSearch-btn", function(){
        	if($("input[name=keyword]").val().replace(/ /g, '') != ""){ // 공백 입력시
        		nameSearch();
        	} else{
        		memList();
        	}
        })
        
        // 채팅 리스트
        function chatRoomList(){
        	$.ajax({
        		url:"chatRoomList.chat",
        		data:{participantNo:${loginUser.userNo}},
        		success:function(list){
        			let value = "<div id='chatRoomList-area'><table width='270'>";
        			let value2 = "<table id='search-area'>"
	    					+	"<tr>"
	    					+		"<td width='300px' id='search-change'>"
	    					+			"<input type='text' name='keyword' placeholder='&nbsp;이름 또는 채팅방이름으로 검색하세요'>"
	            			+ 			"<button id='chatRoomSearch-btn'><img src='resources/icons/search.png' height='25px' width='25px'></button>"
	            			+		"</td></tr></table>"
        			let party = "";
        			if(list.length == 0){
        				value += "<tr><td>채팅 내역이 없습니다.</td></tr>"
        			}
        			for(let i=0; i<list.length; i++){
        				value += "<tr ondblclick='openChat(" + list[i].roomNo + "," + list[i].notreadChat + ")'><td style='width:50px'>"
        				
       						if(list[i].groupCount <= 2){
       							for(let j=0; j<list[i].memList.length; j++){
	       							value += "<img src='"
	       							if(list[i].memList[j].profileImg != undefined){
	           							value += list[i].memList[j].profileImg
	           						}else{
	           							value += "resources/icons/profile.png"
	           						}
	       							value += "' class='rounded-circle chatProfileImg pro-chat'>"
       							}
       						} else if(list[i].groupCount > 2 && list[i].groupCount <= 5){
       							for(let j=0; j<list[i].memList.length; j++){
   									value += "<img src='"
          							if(list[i].memList[j].profileImg != undefined){
              							value += list[i].memList[j].profileImg
              						}else{
              							value += "resources/icons/profile.png"
              						}
          							value += "' class='rounded-circle chatProfileImg pro-group'>"
       							}
       						}else{
       							for(let j=0; j<4; j++){
   									value += "<img src='"
          							if(list[i].memList[j].profileImg != undefined){
              							value += list[i].memList[j].profileImg
              						}else{
              							value += "resources/icons/profile.png"
              						}
          							value += "' class='rounded-circle chatProfileImg pro-group'>"
       							}
       						}
        				for(let j=0; j<list[i].memList.length; j++){
        					party += list[i].memList[j].userName + ","
        				}
        				value += "</td><td><b>"
        				if(list[i].roomName != undefined){
        					value += list[i].roomName
        				}else{
        					let sub = party.substring(0, party.length - 1).split(",")
        					if(i != list.length - 1){
        						if(sub.slice(sub.length - list[i].groupCount + 1).length < 4){
        							value += sub.slice(sub.length - list[i].groupCount + 1)
        						}else{
        							value += sub.slice(sub.length - list[i].groupCount + 1).slice(0, 3) + ",..."
        						}
        					}else{
        						if(list.length != 1){
        							if(sub.slice(sub.length - list[i].groupCount + 1).length < 4){
            							value += sub.slice(sub.length - list[i].groupCount + 1)
            						}else{
            							value += sub.slice(sub.length - list[i].groupCount + 1).slice(0, 3) + ",..."
            						}
        						}else{
        							if(sub.length < 4){
            							value += sub
            						}else{
            							value += sub.slice(0, 3) + ",..."
            						}
        						}
        					}
        				}
        				value += "</b><br>"
        				if(list[i].chatContent != undefined){
        					if(list[i].chatContent.length > 20){
        						value += list[i].chatContent.substr(0,21) + "..."
        					}else{
        						value += list[i].chatContent
        					}
        				}else{
        					value += "<br>"
        				}
       						value += "</td>"
        							+ "<td class='table-time'><small>"
        					if(list[i].sendDate != undefined){
				        		if(list[i].sendDate.includes(dateFormat(1))){
									value += list[i].sendDate.substring(list[i].sendDate.indexOf("오")) 
								}else if(list[i].sendDate.includes(dateFormat(2))){
									value += "어제"
								} else{
									value += list[i].sendDate.substring(0, list[i].sendDate.indexOf("오"))
								}
								value += "</small><br>"
								if(list[i].notreadChat != 0){
									value += "<span>" + list[i].notreadChat + "</span>"
								}else{
									value += "<span style='background:none;'></span>"
								}
        					}
        				value += "</td></tr>"
        			}
        			value += "</table><div id='plus-btn'>+</div></div>"
        			$("#chat-body").html(value);
        			$("#search-div").html(value2);
        			console.log(value)
        		},error:function(){
        			console.log("채팅 리스트 조회용 ajax 통신 실패");
        		}
        	})
        }
  
     	// 채팅 리스트 검색
        function chatRoomSearch(){
        	$.ajax({
        		url:"searchChatRoom.chat",
        		data:{
        			roomName:$("input[name=keyword]").val().replace(/ /g, ''), // 공백제거
        			participantNo:${loginUser.userNo}
        		},success:function(list){
        			let value = "<div id='chatRoomList-area'><table width='270'>";
        			let party = "";
        			if(list.length == 0){
        				value += "<tr><td>검색 내역이 없습니다.</td></tr>"
        			}
        			for(let i=0; i<list.length; i++){
        				value += "<tr ondblclick='openChat(" + list[i].roomNo + "," + list[i].notreadChat + ")'><td style='width:50px'>"
        				
       						if(list[i].groupCount <= 2){
       							for(let j=0; j<list[i].memList.length; j++){
	       							value += "<img src='"
	       							if(list[i].memList[j].profileImg != undefined){
	           							value += list[i].memList[j].profileImg
	           						}else{
	           							value += "resources/icons/profile.png"
	           						}
	       							value += "' class='rounded-circle chatProfileImg pro-chat'>"
       							}
       						} else if(list[i].groupCount > 2 && list[i].groupCount <= 5){
       							for(let j=0; j<list[i].memList.length; j++){
   									value += "<img src='"
          							if(list[i].memList[j].profileImg != undefined){
              							value += list[i].memList[j].profileImg
              						}else{
              							value += "resources/icons/profile.png"
              						}
          							value += "' class='rounded-circle chatProfileImg pro-group'>"
       							}
       						}else{
       							for(let j=0; j<4; j++){
   									value += "<img src='"
          							if(list[i].memList[j].profileImg != undefined){
              							value += list[i].memList[j].profileImg
              						}else{
              							value += "resources/icons/profile.png"
              						}
          							value += "' class='rounded-circle chatProfileImg pro-group'>"
       							}
       						}
        				for(let j=0; j<list[i].memList.length; j++){
        					party += list[i].memList[j].userName + ","
        				}
        				value += "</td><td><b>"
        				if(list[i].roomName != undefined){
        					value += list[i].roomName
        				}else{
        					let sub = party.substring(0, party.length - 1).split(",");
        					if(i != list.length - 1){
        						if(sub.slice(sub.length - list[i].groupCount + 1).length < 4){
        							value += sub.slice(sub.length - list[i].groupCount + 1)
        						}else{
        							value += sub.slice(sub.length - list[i].groupCount + 1).slice(0, 3) + ",..."
        						}
        					}else{
        						if(list.length != 1){
        							if(sub.slice(sub.length - list[i].groupCount + 1).length < 4){
            							value += sub.slice(sub.length - list[i].groupCount + 1)
            						}else{
            							value += sub.slice(sub.length - list[i].groupCount + 1).slice(0, 3) + ",..."
            						}
        						}else{
        							if(sub.length < 4){
            							value += sub
            						}else{
            							value += sub.slice(0, 3) + ",..."
            						}
        						}
        					}
        				}
        				value += "</b><br>"
        				if(list[i].chatContent != undefined){
        					if(list[i].chatContent.length > 20){
        						value += list[i].chatContent.substr(0,21) + "..."
        					}else{
        						value += list[i].chatContent
        					}
        				}else{
        					value += "<br>"
        				}
       						value += "</td>"
        							+ "<td class='table-time'><small>"
        					if(list[i].sendDate != undefined){
				        		if(list[i].sendDate.includes(dateFormat(1))){
									value += list[i].sendDate.substring(list[i].sendDate.indexOf("오")) 
								}else if(list[i].sendDate.includes(dateFormat(2))){
									value += "어제"
								} else{
									value += list[i].sendDate.substring(0, list[i].sendDate.indexOf("오"))
								}
								value += "</small><br>"
								if(list[i].notreadChat != 0){
									value += "<span>" + list[i].notreadChat + "</span>"
								}else{
									value += "<span style='background:none;'></span>"
								}
        					}
        				value += "</td></tr>"
        			}
        			value += "</table><div id='plus-btn'>+</div></div>"
        			$("#chat-body").html(value);
        		},error:function(){
        			console.log("채팅 리스트 검색용 ajax 통신 실패");
        		}
     		})
     	}
     	
     	$(document).on("click", "#chatRoomSearch-btn", function(){
     		if($("input[name=keyword]").val().replace(/ /g, '') != ""){ // 공백 입력시
        		chatRoomSearch();
        	} else{
        		chatRoomList();
        	}
     	})
     	
        // 채팅방 생성 플러스 버튼
        $(document).on("click", "#plus-btn", function(){
        	plusChatRoom();
        })
        function plusChatRoom(){
        	$.ajax({
        		url:"memList.chat",
       			data:{userNo:${loginUser.userNo}},
        		success:function(map){
        			let value1 = "<div class='detailView'>"
    	    					+ "<img src='resources/icons/up-arrow.png' height='15px' width='15px'>&nbsp;"
    	    					+ "내 부서"
    	    					+ "</div>"
    	    					+ "<div class='detail' style='display:block;'>";
        			let value2 = "";
        			let value3 = "<form action='' id='chatRoomCreate'><div class='detailView'>"
    	    					+ "<img src='resources/icons/up-arrow.png' height='15px' width='15px'>&nbsp;"
    	    					+ "즐겨찾기"
    	    					+ "</div>"
    	    					+ "<div class='detail' style='display:block;'>";
    	    		let likeCount = 0; // 즐겨찾는 사람수
    	    		
        			for(let i=0; i<map.deptList.length; i++){
        				if(map.deptList[i].departmentName == "${loginUser.department}"){
            				for(let j=0; j<map.memList.length; j++){
            					if(map.memList[j].userNo != ${loginUser.userNo }){ // 본인 제외
            						if(map.memList[j].department == map.deptList[i].departmentName){
    	        						value1 += "<div><input type='checkbox' id='" + map.memList[j].userNo + "' name='userNo' class='" + map.memList[j].userNo + "' value='" + map.memList[j].userNo + "'>&nbsp;&nbsp;<img src='";
    	        						if(map.memList[j].profileImg != undefined){
    	        							value1 += map.memList[j].profileImg
    	        						}else{
    	        							value1 += "resources/icons/profile.png"
    	        						}
    	        						value1 += "' class='rounded-circle collegeProfileImg pro-small'>"
    	        							+ "<input type='hidden' value='" + map.memList[j].userNo +"'>"
    	        							+ "<input type='hidden' value='" + map.memList[j].userName +"'>"
    	        							+ "<input type='hidden' value='" + map.memList[j].department +"'>"
    	        							+ "<input type='hidden' value='" + map.memList[j].position +"'>"
    	        							+ "<input type='hidden' value='" + map.memList[j].mail +"'>"
    	        							+ "<input type='hidden' value='" + map.memList[j].phone +"'>"
    	        							+ "<input type='hidden' value='" + map.memList[j].chatLike +"'>"
    	        							+ "<label for='" + map.memList[j].userNo + "'><span>" + map.memList[j].userName + "&nbsp;<span class='conn";
    	        						if(map.memList[j].connSta == 0){
    	        			        		value1 += " online";
    	        			       		} else if(map.memList[j].connSta == 1){
    	        			       			value1 += " offline";
    	        			       		} else if(map.memList[j].connSta == 2){
    	        			       			value1 += " out";
    	        			       		}
    	        						value1 += "'></span></label></span></div>";
    	        					}
            					}
            				}
            				value1 += "</div>";
        				} else{
        					value2 += "<div class='detailView'>"
            					+ "<img src='resources/icons/right-arrow.png' height='15px' width='15px'>&nbsp;"
            					+ map.deptList[i].departmentName
            					+ "</div>"
            					+ "<div class='detail'>";
            				for(let j=0; j<map.memList.length; j++){
            					if(map.memList[j].department == map.deptList[i].departmentName){
            						value2 += "<div><input type='checkbox' id='" + map.memList[j].userNo + "' name='userNo' class='" + map.memList[j].userNo + "' value='" + map.memList[j].userNo + "'>&nbsp;&nbsp;<img src='";
            						if(map.memList[j].profileImg != undefined){
            							value2 += map.memList[j].profileImg
            						}else{
            							value2 += "resources/icons/profile.png"
            						}
            						value2 += "' class='rounded-circle collegeProfileImg pro-small'>"
            							+ "<input type='hidden' value='" + map.memList[j].userNo +"'>"
            							+ "<input type='hidden' value='" + map.memList[j].userName +"'>"
            							+ "<input type='hidden' value='" + map.memList[j].department +"'>"
            							+ "<input type='hidden' value='" + map.memList[j].position +"'>"
            							+ "<input type='hidden' value='" + map.memList[j].mail +"'>"
            							+ "<input type='hidden' value='" + map.memList[j].phone +"'>"
            							+ "<input type='hidden' value='" + map.memList[j].chatLike +"'>"
            							+ "<label for='" + map.memList[j].userNo + "'><span>" + map.memList[j].userName + "&nbsp;<span class='conn";
            						if(map.memList[j].connSta == 0){
            			        		value2 += " online";
            			       		} else if(map.memList[j].connSta == 1){
            			       			value2 += " offline";
            			       		} else if(map.memList[j].connSta == 2){
            			       			value2 += " out";
            			       		}
            						value2 += "'></span></label></span></div>";
            					}
            				}
            				value2 += "</div>"
        				}
        			}
        			for(let k=0; k<map.memList.length; k++){
    					if(map.memList[k].chatLike != undefined){
    						value3 += "<div><input type='checkbox' id='" + map.memList[k].userNo + "' name='userNo' class='" + map.memList[k].userNo + "' value='" + map.memList[k].userNo + "'>&nbsp;&nbsp;<img src='";
    						if(map.memList[k].profileImg != undefined){
    							value3 += map.memList[k].profileImg
    						}else{
    							value3 += "resources/icons/profile.png"
    						}
    						value3 += "' class='rounded-circle collegeProfileImg pro-small'>"
    							+ "<input type='hidden' value='" + map.memList[k].userNo +"'>"
    							+ "<input type='hidden' value='" + map.memList[k].userName +"'>"
    							+ "<input type='hidden' value='" + map.memList[k].department +"'>"
    							+ "<input type='hidden' value='" + map.memList[k].position +"'>"
    							+ "<input type='hidden' value='" + map.memList[k].mail +"'>"
    							+ "<input type='hidden' value='" + map.memList[k].phone +"'>"
    							+ "<input type='hidden' value='" + map.memList[k].chatLike +"'>"
    							+ "<label for='" + map.memList[k].userNo + "'><span>" + map.memList[k].userName + "&nbsp;<span class='conn";
    						if(map.memList[k].connSta == 0){
    			        		value3 += " online";
    			       		} else if(map.memList[k].connSta == 1){
    			       			value3 += " offline";
    			       		} else if(map.memList[k].connSta == 2){
    			       			value3 += " out";
    			       		}
    						value3 += "'></span></span></div>";
    						likeCount += 1;
    					}
    				}
        			if(likeCount == 0){
        				value3 += "<div><small>즐겨찾는 멤버가 없습니다.</small></div>"
        			}
        			value2 += "</div>";
    				value3 += "</div>";
        			$("#chat-body").html(value3 + value1 + value2).append("<button type='submit' id='createChat'>채팅방 생성</button></form>");
        		},error:function(){
        			console.log("주소록 불러오기용 ajax 통신 실패");
        		}
        	})
        }
        
     	// 채팅 생성 체크박스 이벤트
        $(document).on("click", "chat input[type=checkbox]", function(){
            const $class = $(this).attr("class");
            if($(this).prop("checked")){
                $.each($("chat input[type=checkbox]"), function(){
                    if($(this).attr("class") == $class){
                        $(this).prop("checked", true);
                    }
                });
            }else{
                $.each($("chat input[type=checkbox]"), function(){
                    if($(this).attr("class") == $class){
                        $(this).prop("checked", false);
                    }
                });
            }
        })
        
        // 단체 채팅방 생성
        $(document).on("click", "#createChat", function(){
        	let arr = [];
        	$("input[name=userNo]:checked").each(function(){
        		arr.push($(this).val());
            })
            arr.push(${loginUser.userNo});
            let arrDup = [...new Set(arr)]
        	newChat(arrDup);
        })

        // 주소록 더블클릭시 이벤트
        function chatOne(no, clickNo){
     		if(no == 0){ // 전에 생성된 1:1 채팅이 없을 때
     			let arr = [];
            	arr.push(${loginUser.userNo});
            	arr.push(clickNo);
     			newChat(arr);
     		}else{ // 이미 생성된 1:1 채팅이 있을 때
     			$.ajax({
     				url:"notReadRoom.chat",
     				data:{
     					participantNo:${loginUser.userNo},
     					roomNo:no
     				},success:function(notread){
     					openChat(no, notread);
     				}
     			})
     		}
     	}
     	
     	// 새로운 채팅 생성
     	function newChat(arr){
            $.ajax({
   				url:"create.chat",
       			data:{
       				participant:arr
           		},success:function(boardNo){
           			$("input[name=openChatRoomNo]").val(boardNo);
           			openChat(boardNo, 0);
           		},error:function(){
           			console.log("새로운 채팅 생성용 ajax 통신 실패")
           		}
   			})
     	}
    	
     	// 채팅방 열기
     	let $groupCount = "";
     	let $roomName = "";
		let receiveList = "";
		let $notread = 0;
     	function openChat(no, notread){
     		$.ajax({
   				url:"open.chat",
       			data:{
       				roomNo:no
           		},success:function(list){
           			$("input[name=openChatRoomNo]").val(no);
           			let value1 = "<div class='chat-area'>"
           			let value2 = "";
           			for(let i=0; i<list.length; i++){
           				if(list[i].sendNo != ${loginUser.userNo}){
           					value1 += "<div><span class='send-user'>"
	           						+		 "<img src='"
	       							if(list[i].sendProfile != undefined){
	           							value1 += list[i].sendProfile
	          						}else{
	          							value1 += "resources/icons/profile.png"
	          						}
	      							value1 += "' class='rounded-circle chatProfileImg pro-small'>"
	    									+ list[i].sendName + "</span>"
           									+ "<div class='chat-message other'>"
               								+ "<div class='send-message'>" + list[i].chatContent + "</div>"
               						if(list[i].notRead != 0){
               							value1 += "<span class='notreadCount' id='" + list[i].chatNo + "'>" + list[i].notRead + "</span>"
               						}
               						value1 += "</div></div>"
           				}else{
           					value1 += "<div class='chat-message mine'>"
       						if(list[i].notRead != 0){
       							value1 += "<span class='notreadCount' id='" + list[i].chatNo + "'>" + list[i].notRead + "</span>"
       						}
           					value1 += "<div class='send-message'>" + list[i].chatContent + "</div></div>"
           				}
           				if(list[i].chatContent == undefined){
           					value1 = "<div class='chat-area'>";
           				}
           				for(let j=0; j<list[i].memList.length; j++){
           					if(list[i].groupCount == 2){
           						if(list[i].memList[j].userNo != ${loginUser.userNo}){
           							value2 = "<div id='profile-area'><img src='resources/icons/left-arrow.png' id='toList-btn' onclick='onClose();'>"
           									+ "<span id='roomName-area'><span id='roomName'>" 
           							if(list[i].roomName == undefined){
           								value2 += list[i].memList[j].userName;
           							}else{
           								value2 += list[i].roomName;
           							}
           							value2 += "</span></span>";
           						}
           					}else{
           						value2 = "<div id='profile-area'><img src='resources/icons/left-arrow.png' id='toList-btn' onclick='onClose();'>"
           						if(list[i].roomName == undefined){
           							value2 += "<span id='roomName-area'><span id='roomName'>그룹채팅";
           						}else{
           							value2 += "<span id='roomName-area'><span id='roomName'>" + list[i].roomName;
           						}
           						value2 += "</span> <span id='groupCount'>"+ list[i].groupCount + "</span></span></span>"
           					}
           				}
           			}
           			value1 += "</div><div class='input-area'>"
               			   	+ "<div class='form-group'>"
                   			+ "<textarea class='form-control' rows='3' id='message' style='resize:none; width:220px;' onKeyPress='check_enter();'></textarea>"
                    		+ "<button type='button' id='send-btn' onclick='sendMessage(" + no + "," + list[0].groupCount + ");'>전송</button>"
                			+ "</div></div>";
                	value2 += "<span><img src='resources/icons/dots.png' onclick='partiList(1, " + no + ");'><img src='resources/icons/setting.png' onclick='updateRoomName(" + no + ");'></span><input type='hidden' id='roomNo' value='" + no + "'</div>"
                	$("#chat-body").html(value1);
           			$('.chat-area').scrollTop($('.chat-area')[0].scrollHeight);
           			$("#search-div").html(value2);
           			connectChat(no);
           			$groupCount = $("#groupCount").text();
 		     		$roomName = $("#roomName").text();
 		     		partiList(2, no);
           			readChat(notread);
           		},error:function(){
          			console.log("채팅 열기용 ajax 통신 실패")
          		}
  			})
    	}
     	
     	// 대화상대 리스트 보기
     	function partiList(num, no){
     		$.ajax({
     			url:"partiList.chat",
     			data:{
     				roomNo:no,
     				participantNo:${loginUser.userNo}
     			},success:function(list){
     				if(num == 1){
     					let me = "<div><img src='";
         				let others = "";
         				let button = "<img src='resources/icons/sign_out.png' width='25' height='25'>"
         					/* onclick='chatOut(" + list[0].roomNo + ")' */
         				for(let i=0; i<list.length; i++){
         					if(list[i].userNo == ${loginUser.userNo}){
         						if(list[i].profileImg != undefined){
         							me += list[i].profileImg
        						}else{
        							me += "resources/icons/profile.png"
        						}
         						me += "' class='rounded-circle pro-small'>"
        							+ list[i].userName + "<span class='conn";
        						if(list[i].connSta == 0){
        							me += " online";
        			       		} else if(list[i].connSta == 1){
        			       			me += " offline";
        			       		} else if(list[i].connSta == 2){
        			       			me += " out";
        			       		}
        						me += "'></span><span id='chatMe'>나</span></div>";
         					}else{
         						others += "<div><input type='hidden'><img src='"
         						if(list[i].profileImg != undefined){
         							others += list[i].profileImg
        						}else{
        							others += "resources/icons/profile.png"
        						}
         						others += "' class='rounded-circle collegeProfileImg pro-small'>"
        							+ "<input type='hidden' value='" + list[i].userNo +"'>"
        							+ "<input type='hidden' value='" + list[i].userName +"'>"
        							+ "<input type='hidden' value='" + list[i].department +"'>"
        							+ "<input type='hidden' value='" + list[i].position +"'>"
        							+ "<input type='hidden' value='" + list[i].mail +"'>"
        							+ "<input type='hidden' value='" + list[i].phone +"'>"
        							+ "<input type='hidden' value='" + list[i].chatLike +"'>"
        							+ list[i].userName + "<span class='conn";
        						if(list[i].connSta == 0){
        							others += " online";
        			       		} else if(list[i].connSta == 1){
        			       			others += " offline";
        			       		} else if(list[i].connSta == 2){
        			       			others += " out";
        			       		}
        						others += "'></span></div>";
         					}
         				}
     					$("#participants").html(me + others);
     					$("#button-area").html(button);
     					$("#participantList").toggle();
     				}else{
     					for(let i=0; i<list.length; i++){
         					if(list[i].userNo != ${loginUser.userNo}){
         						receiveList += "/" + list[i].userNo
         					}
         				}
     					receiveList = receiveList.substring(1);
     				}
     			},error:function(){
     				
     			}
     		})
     	}
     	
     	// 설정 아이콘 클릭 (채팅방 이름 변경)
     	function updateRoomName(no){
     		if(!$("#roomName-area").html().includes("input")){
         		let value = "<input type='text' name='roomName' style='width:140px;'>"
         					+ "<button class='updateRoomName-btn' id='" + no + "'><img src='resources/icons/check.png' width='20px' height='20px' style='margin-bottom:5px;'></button>"
         					+ "<button onclick='cancelChange();'><img src='resources/icons/cancel.png' width='20px' height='20px' style='margin-bottom:5px;'></button>";
         		$("#roomName-area").html(value);
         		$("#roomName-area input[name=roomName]").focus();
         		$("#roomName-area input[name=roomName]").val($roomName);
     		}
     	}
     	
     	// 체크 아이콘 클릭 (채팅방 이름 변경)
     	$(document).on("click", ".updateRoomName-btn", function(){
     		let newRoomName = $("input[name=roomName]").val();
     		let roomNo = $(this).attr("id");
     		$.ajax({
     			url:"updateRoomName.chat",
     			data:{
     				roomName:newRoomName,
     				roomNo:roomNo
     			},success:function(result){
     				if(result == "success"){
     					let value = "<span id='roomName'>" + newRoomName + "</span>"
     								+ " <span id='groupCount'>" + $groupCount + "</span>"
     					$("#roomName-area").html(value);
     				}
     			}
     		})
     	})
     	
     	// 취소 아이콘 클릭 (채팅방 이름 변경 취소)
     	function cancelChange(){
     		let value = "<span id='roomName'>" + $roomName + "</span>"
						+ " <span id='groupCount'>" + $groupCount + "</span>"
			$("#roomName-area").html(value); 
     	}
     	
     	// 방 나가기
     	/* function chatOut(no){
     		$.ajax({
     			url:"out.chat",
     			data:{
     				roomNo:no,
     				userNo:${loginUser.userNo}
     			},success:function(result){
     				console.log(result)
     			}
     		})
     	} */
     	
     	function readChat(notread){
     		let $chatCount = Number($("#chat-count").text());
	 		if($chatCount - notread == 0){
	 			$("#chat-count").css("display", "none");
	 		}
	 		$("#chat-count").text($chatCount - notread);
     	}
     	
     	// 웹소켓
     	let sockChat = null;
     	
     	function connectChat(no){
     		const sock2 = new SockJS("${pageContext.request.contextPath}/chat"); 
			sockChat = sock2;
			
			sockChat.onopen = onOpen;
			sockChat.onmessage = onMessage;
     	}
     	
     	// 전송버튼클릭
     	function sendMessage(no, groupCount){ 
     		if($("#message").val() != ""){
     			if(sockChat){
         			let chatMsg = no + ",${loginUser.userNo}," + $("#message").val() + "," + (groupCount - 1);
         			sockChat.send(chatMsg);
        			$("#message").val("");
         		}
     		}
		}
     	
     	// 방 입장
     	function onOpen(){
	 		if(sockChat){
     			let chatMsg = $("input[name=openChatRoomNo]").val() + ",${loginUser.userNo},ENTER-CHAT,1";
     			sockChat.send(chatMsg);
     		}
	 	}
	 	
		function onMessage(evt){
			let msgArr = evt.data.split(",");
			let $chatAllDiv;
			let $msg;
			let $chatDiv;
			if(msgArr[2] == "ENTER-CHAT"){
				$(".notreadCount").each(function(){
					if($(this).attr("id") > msgArr[5] && $(this).attr("id") <= msgArr[4]){
						if(msgArr[1] == ${loginUser.userNo}){
							if(!$(this).parent().attr("class").includes("mine")){
								if((Number($(this).text()) - 1) == 0){
									$(this).text("");
								}else{
									$(this).text(Number($(this).text()) - 1);
								}
							}
						}else{
							if($(this).parent().attr("class").includes("mine")){
								if((Number($(this).text()) - 1) == 0){
									$(this).text("");
								}else{
									$(this).text(Number($(this).text()) - 1);
								}
							}else{
								if((Number($(this).text()) - 1) == 0){
									$(this).text("");
								}else{
									$(this).text(Number($(this).text()) - 1);
								}
							}
						}
					}
				})
			} else{
				if(msgArr[1] == ${loginUser.userNo}){
					if(msgArr[6] != 0){
						$msg = "<span class='notreadCount' id='" + msgArr[7] + "'>" + msgArr[6] + "</span>"
							+ "<div class='send-message'>" + msgArr[2] + "</div>"
					}else{
						$msg = "<div class='send-message'>" + msgArr[2] + "</div>"
					}
					$chatDiv = $("<div class='chat-message'>").append($msg);
					$chatDiv.addClass("mine");
					$chatAllDiv = $chatDiv;
				}else{
					$msg = "<div class='send-message'>" + msgArr[2] + "</div>"
					if(msgArr[6] != 0){
						$msg += "<span class='notreadCount' id='" + msgArr[7] + "'>" + msgArr[6] + "</span>"
					}
					$chatDiv = $("<div class='chat-message'>").append($msg);
					let userVal = "<img src='";
					if(msgArr[5] != "null"){
						userVal += msgArr[5]
					}else{
						userVal += "resources/icons/profile.png"
					}
					userVal += "' class='rounded-circle chatProfileImg pro-small'>"
							+ msgArr[4]
					let $userSpan = $("<span class='send-user'>").html(userVal);
					$chatDiv.addClass("other");
					$chatAllDiv = $("<div>").append($chatDiv);
					$chatAllDiv = $chatAllDiv.prepend($userSpan);
				}
				$(".chat-area").append($chatAllDiv);
				$('.chat-area').scrollTop($('.chat-area')[0].scrollHeight);
				if(socket){
					let socketMsg2 = "newchat, , ," + receiveList + ", , ";
					socket.send(socketMsg2);
				}
			}
		}
		
		// shift+enter 시 줄바꿈 / enter시 메세지 전송
		function check_enter(){
			if(event.keyCode==13){
				if(!event.shiftKey){
					event.preventDefault();
					if($("#message").val() != ""){
						document.getElementById("send-btn").click();
					}
				}
			}
		}
		
		// 방 퇴장
		function onClose(){
			sockChat.close();
			if($(".chat-area").html() == ""){ // 채팅 안쳤을 때 room자체도 삭제
				deleteChatRoom($("#roomNo").val());
			} else{
				chatRoomList();
			}
			$("#participantList").hide();
			receiveList = "";
		}
		
		// 새로고침 시에도 socket close
		window.onbeforeunload = function(){
			onClose();
		}
		
		// 채팅 안쳤을 때 room자체도 삭제
		function deleteChatRoom(no){
			$.ajax({
				url:"delete.chat",
				data:{roomNo:no},
				success:function(result){
					if(result == "success"){
						chatRoomList();
					}
				}
			})
		}
    </script>
    
    <!-- 내 프로필 Modal -->
    <div class="modal" id="myProfile" data-backdrop='static' data-keyboard='false'>
        <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <b>내 프로필</b><br><br>
                    <img class="profileImg pro-middle rounded-circle" src="<c:out value='${ loginUser.profileImg }' default='resources/icons/profile.png' />">
                    <b>${ loginUser.userName }</b>
                    <select name="connSta">
                        <option value="0">
                            온라인
                        </option>
                        <option value="2">
                            부재중
                        </option>
                        <option value="1">
                            오프라인
                        </option>
                    </select>
                    <br><br>
                    <div align="center">
                        <button class="btn" id="update-btn">확인</button>
                        <button class="btn" data-dismiss="modal" id="exit-btn">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 동료 프로필 Modal -->
    <div class="modal" id="collegeProfile" data-backdrop='static' data-keyboard='false'>
        <div class="modal-dialog modal-dialog-centered modal-sm">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal">&times;</button><br>
                <div align="center">
                    <img class="rounded-circle pro-big" id="modal-profile"><br><br>
                    <b style="font-size:18px;" id="collegeName"></b>
                    <img src="resources/icons/star.png" id="like-img" style="width:20px; margin-bottom:5px;">
                    <input type="hidden" id="userNo">
                    <br>
                </div>
                <div id="collegeInfo">
                </div>
            </div>
        </div>
        </div>
    </div>

</body>
</html>