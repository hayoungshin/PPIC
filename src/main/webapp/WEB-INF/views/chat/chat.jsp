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
    #chat{
        border: 1px solid rgb(202, 199, 199);
        width:300px;
        height:510px;
        border-radius:5px;
        font-size: 12px;
        background:white;
        position:fixed;
        z-index:100;
        top:70px;
        left:250px;
        display:none;
    }

    /* chat header 스타일 */
    #chat-header{
     position:sticky;
    }
    #chat-logo{padding:10px;}
    .profileImg, .collegeProfileImg{cursor:pointer;} 
	.pro-small{width: 25px;}
	.pro-middle{width: 70px;}
	.pro-big{width: 150px;}
	.pro-chat{width:40px;}
	.pro-group{width:20px;}

    /* chat 메뉴 스타일 */
    #chat-menu{
        height:35px;
        line-height: 30px; 
        background:linear-gradient( to right, #6F50F8 5%, #FFCECE);;
    }
    #chat-menu>*{padding-left:18px;}
    .menuClicked{opacity:0.7;}
    #chat-menu>img:hover{cursor: pointer; opacity:0.7;}
    

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
    #college-area, #chatRoomCreate-area{padding:10px;}
    #college-area>div, #chatRoomCreate-area div{padding:5px; cursor:pointer;} 
    #college-area img, #chatRoomCreate-area img{margin-right:5px;}
    .detail>div{padding:5px;}
    .detail>div>span:hover, #chatRoomList-area tr:hover{opacity:0.7;}
    .detail{display: none;} 
    .detail>div>span{
        display:inline-block; 
        width:190px;
    }
    .detail label{
        cursor: pointer; 
        width:100%;
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
    #createChat{
        font-size: 10px;
        width:70px;
        height:25px;
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
                </span>
            </div>
    
            <div id="chat-menu">
                <img src="resources/icons/user.png" height="26px" id="member-btn" onclick="showUser();" class="menu"> 
                <img src="resources/icons/chat.png" height="25px" id="chat-btn" onclick="showChatting();" class="menu"> 
            </div> 
            
            <table id="search-area">
                <tr>
                    <td width="300px">
                        <input type="text" name="keyword" placeholder="&nbsp;이름으로 검색하세요">
                        <button id="nameSearch-btn"><img src="resources/icons/search.png" height="25px" width="25px"></button>
                    </td>
                </tr>
            </table>
        </div>
        <div id="chat-body">

            <!-- chatRoomList
            <div id="chatRoomList-area">
                <table width="270">
                    <tr>
                        <td>
                            <img src="resources/icons/profile.png" class="rounded-circle" width="40" height="40">
                        </td>
                        <td>
                            <b>김혜수</b> <br>
                            고마워요 길동씨~
                        </td>
                        <td class="table-time">
                            <small>지금</small><br>
                            <span>1</span>
                        </td>
                    </tr>
                </table>
                <div id="plus-btn">+</div>
            </div> -->
            
            <!-- chatRoom create -->
            <!-- <div id="chatRoomCreate-area">
                <form action="">
                    <div class="detailView">
                        <img src="resources/icons/up-arrow.png" height="15px" width="15px">&nbsp;
                        즐겨찾기
                    </div>
                    <div class="detail" style="display:block;">
                        <div>
                            <input type="checkbox" id="1" name="" class="1">&nbsp;
                            <img src="resources/icons/profile.png" class="rounded-circle collegeProfileImg" width="25" height="25">
                            <span>
                                <label for="1">
                                    김혜수
                                    <span class="conn online"></span>
                                </label>
                            </span>
                        </div>
                        <div>
                            <input type="checkbox" id="2" name="" class="2">&nbsp;
                            <img src="resources/icons/profile.png" class="rounded-circle collegeProfileImg" width="25" height="25">
                            <span>
                                <label for="2">
                                    김서형&nbsp;
                                    <span class="conn online"></span>
                                </label>
                            </span>
                        </div>
                        <div>
                            <input type="checkbox" id="3" name="" class="3">&nbsp;
                            <img src="resources/icons/profile.png" class="rounded-circle collegeProfileImg" width="25" height="25">
                            <span>
                                <label for="3">
                                    배수지&nbsp;
                                    <span class="conn out"></span>
                                </label>
                                
                            </span>
                        </div>
                        <div>
                            <input type="checkbox" id="4" name="" class="4">&nbsp;
                            <img src="resources/icons/profile.png" class="rounded-circle collegeProfileImg" width="25" height="25">
                            <span>
                                <label for="4">
                                    차은우&nbsp;
                                    <span class="conn offline"></span>
                                </label>
                            </span>
                        </div>
                    </div>
        
                    <div class="detailView">
                        <img src="resources/icons/right-arrow.png" height="15px" width="15px">&nbsp;
                        내 부서
                    </div>
                    <div class="detail">
                        <div>
                            <input type="checkbox" id="1" name="" class="1">&nbsp;
                            <img src="resources/icons/profile.png" class="rounded-circle collegeProfileImg" width="25" height="25">
                            <span>
                                <label for="1">
                                    김혜수
                                    <span class="conn online"></span>
                                </label>
                            </span>
                        </div>
                        <div>
                            <input type="checkbox" id="2" name="" class="2">&nbsp;
                            <img src="resources/icons/profile.png" class="rounded-circle collegeProfileImg" width="25" height="25">
                            <span>
                                <label for="2">
                                    김서형&nbsp;
                                    <span class="conn online"></span>
                                </label>
                            </span>
                        </div>
                        <div>
                            <input type="checkbox" id="3" name="" class="3">&nbsp;
                            <img src="resources/icons/profile.png" class="rounded-circle collegeProfileImg" width="25" height="25">
                            <span>
                                <label for="3">
                                    배수지&nbsp;
                                    <span class="conn out"></span>
                                </label>
                                
                            </span>
                        </div>
                        <div>
                            <input type="checkbox" id="4" name="" class="4">&nbsp;
                            <img src="resources/icons/profile.png" class="rounded-circle collegeProfileImg" width="25" height="25">
                            <span>
                                <label for="4">
                                    차은우&nbsp;
                                    <span class="conn offline"></span>
                                </label>
                            </span>
                        </div>
                    </div>
                    <button type="submit" id="createChat">채팅방 생성</button>
                </form>
            </div> -->
        </div>
    </div>
    <script>
	   	$(function(){
	   		// chatheader에 표시되는 내 접속상태
	   		myConnSta(${loginUser.connSta});
	   		
	   		// 주소록 불러오기
	   		memList();
	   	})
	   	
	   	// 채팅 메뉴바 클릭 (주소록)
        function showUser(){
        	memList();
        	$("#member-btn").addClass("menuClicked");
        	$("#chat-btn").removeClass("menuClicked");
        }

        // 채팅 메뉴바 클릭 (채팅목록)
        function showChatting(){
            chatRoomList();
        	$("#chat-btn").addClass("menuClicked");
        	$("#member-btn").removeClass("menuClicked");
        }
	   	
	   	// 주소록 불러오기 => ajax
   		function memList(){
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
        			let value3 = "<div id='college-area'><div class='detailView'>"
		    					+ "<img src='resources/icons/up-arrow.png' height='15px' width='15px'>&nbsp;"
		    					+ "즐겨찾기"
		    					+ "</div>"
		    					+ "<div class='detail' style='display:block;'>";
		    		let likeCount = 0; // 즐겨찾는 사람수
		    		
        			for(let i=0; i<map.deptList.length; i++){
        				if(map.deptList[i].departmentNo == ${loginUser.department}){
	        				for(let j=0; j<map.memList.length; j++){
	        					if(map.memList[j].userNo != ${loginUser.userNo }){ // 본인 제외
	        						if(map.memList[j].department == map.deptList[i].departmentName){
		        						value1 += "<div><img src='";
		        						if(map.memList[j].profileImg != null){
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
		        							+ "<span>" + map.memList[j].userName + "&nbsp;<span class='conn";
		        						if(map.memList[j].connSta == 0){
		        			        		value1 += " online";
		        			       		} else if(map.memList[j].connSta == 1){
		        			       			value1 += " offline";
		        			       		} else if(map.memList[j].connSta == 2){
		        			       			value1 += " out";
		        			       		}
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
	        						value2 += "<div><img src='";
	        						if(map.memList[j].profilImg != null){
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
	        							+ "<span>" + map.memList[j].userName + "&nbsp;<span class='conn";
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
    					if(map.memList[k].chatLike != null){
    						value3 += "<div><img src='";
    						if(map.memList[k].profilImg != null){
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
    							+ "<span>" + map.memList[k].userName + "&nbsp;<span class='conn";
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
        				value3 += "<div><small>즐겨찾는 멤버가 없습니다.<small></div>"
        			}
        			value2 += "</div>";
    				value3 += "</div>";
        			$("#chat-body").html(value3 + value1 + value2);
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
        			userPwd:"${loginUser.userPwd}", // 지우기
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
       		let info = "<p>💻 " + $this.eq(2).val() + "부 (" + $this.eq(3).val() + ")</p><p>✉️ " + $this.eq(4).val() + " </p><p>📞 " + $this.eq(5).val() + " </p>";
            $("#collegeName").html($this.eq(1).val());
            $("#collegeInfo").html(info);
            $("#modal-profile").attr("src", $(this).attr("src"));
            if($this.eq(6).val() == "undefined"){
            	$("#like-img").attr("src", "resources/icons/star.png");
            	$("#like-img").attr("class", "n");
            }else{
            	$("#like-img").attr("src", "resources/icons/star-y.png");
            	$("#like-img").attr("class", "y");
            }
            $("#userNo").val($this.eq(0).val());
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
        				if($("#college-area").html().includes("detailView")){
        					memList();
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
        					+ "<div><img src='"
        					if(list[i].profileImg != null){
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
    							+ "<span>" + list[i].userName + "&nbsp;<span class='conn";
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
        $("#nameSearch-btn").click(function(){
        	if($("input[name=keyword]").val().replace(/ /g, '') != ""){ // 공백 입력시
        		nameSearch();
        	} else{
        		memList();
        	}
        })
        
        function dateFormat(no){
        	const d = new Date();
        	if(no == 1){
        		return d.getFullYear() + "." + ((d.getMonth() + 1) > 9 ? (d.getMonth() + 1).toString() : "0" + (d.getMonth() + 1)) + "." + (d.getDate() > 9 ? d.getDate().toString() : "0" + d.getDate().toString());
        	} else{
        		return d.getFullYear() + "." + ((d.getMonth() + 1) > 9 ? (d.getMonth() + 1).toString() : "0" + (d.getMonth() + 1)) + "." + ((d.getDate() - 1) > 9 ? (d.getDate()-1).toString() : "0" + (d.getDate()-1).toString());
        	}
            
        }
        
        // 채팅 리스트
        function chatRoomList(){
        	$.ajax({
        		url:"chatRoomList.chat",
        		data:{userNo:${loginUser.userNo}},
        		success:function(map){
        			console.log(map)
        			let value = "<div id='chatRoomList-area'><table width='270'>";
        			let party = "";
        			for(let i=0; i<map.chatList.length; i++){
        				value += "<tr><td style='width:50px'>"
        				for(let j=0; j<map.memList.length; j++){
        					if(map.chatList[i].roomNo == map.memList[j].roomNo){
        						if(map.chatList[i].groupCount <= 2){
        							value += "<img src='"
        							if(map.memList[j].profileImg != null){
            							value += map.memList[j].profileImg
            						}else{
            							value += "resources/icons/profile.png"
            						}
        							value += "' class='rounded-circle chatProfileImg pro-chat'>"
        						} else if(map.chatList[i].groupCount > 2 && map.chatList[i].groupCount <= 4){
    								value += "<img src='"
           							if(map.memList[j].profileImg != null){
               							value += map.memList[j].profileImg
               						}else{
               							value += "resources/icons/profile.png"
               						}
           							value += "' class='rounded-circle chatProfileImg pro-group'>"
        						}else if(map.chatList[i].groupCount > 4){
    								value += "<img src='"
           							if(map.memList[j].profileImg != null){
               							value += map.memList[j].profileImg
               						}else{
               							value += "resources/icons/profile.png"
               						}
           							value += "' class='rounded-circle chatProfileImg pro-group'>"
        						}
        						party += map.memList[j].participantName + ","
        					}
        				}
        				value += "</td><td><b>"
        				if(map.chatList[i].roomName != null){
        					value += map.chatList[i].roomName
        				}else{
        					if(i != map.chatList.length - 1){
        						value += party.substring(0, party.length - 1).split(",").slice(map.chatList[i].groupCount - 2, map.chatList[i+1].groupCount - map.chatList[i].groupCount)
        					}else{
        						value += party.substring(0, party.length - 1).split(",").slice(map.chatList[i].groupCount - map.chatList[i-1].groupCount)
        					}
        				}
        				value += "</b><br>"
        						+ map.chatList[i].chatContent
        						+ "</td>"
        						+ "<td class='table-time'><small>"
        					if(map.chatList[i].sendDate.includes(dateFormat(1))){
        						value += map.chatList[i].sendDate.substring(map.chatList[i].sendDate.indexOf("오")) 
        					}else if(map.chatList[i].sendDate.includes(dateFormat(2))){
        						value += "어제"
        					} else{
        						value += map.chatList[i].sendDate.substring(0, map.chatList[i].sendDate.indexOf("오"))
        					}
        					value += "</small><br>"
        					if(map.chatList[i].notreadChat != null){
        						value += "<span>" + map.chatList[i].notreadChat + "</span>"
        					}
        						
        				value += "</td></tr>"
        			}
        			value += "</table><div id='plus-btn'>+</div></div>"
        			$("#chat-body").html(value);
        		},error:function(){
        			console.log("채팅 리스트 조회용 ajax 통신 실패");
        		}
        	})
        }
        

        // 대화방 상세보기
        $("#chatRoomList-area tr").click(function(){
            // ajax 이용
        })

        
        $("input[type=checkbox]").click(function(){
            const $class = $(this).attr("class");
            if($(this).prop("checked")){
                $.each($("input[type=checkbox]"), function(){
                    if($(this).attr("class") == $class){
                        $(this).prop("checked", true);
                    }
                });
            }else{
                $.each($("input[type=checkbox]"), function(){
                    if($(this).attr("class") == $class){
                        $(this).prop("checked", false);
                    }
                });
            }
        })

        // 주소록 더블클릭시 채팅방 이동
        $(".detail>div>span").dblclick(function(){
            // ajax 이용
        })
        
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