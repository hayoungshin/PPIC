<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    #myProfileImg{cursor: pointer;} 

    /* chat 메뉴 스타일 */
    #chat-menu{
        height:35px;
        line-height: 30px; 
        background:linear-gradient( to right, #6F50F8 5%, #FFCECE);;
    }
    #chat-menu>*{
        padding-left:18px; 
    }
    #chat-menu>img:hover{cursor: pointer; opacity: 0.7;}

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
    #chat-body::-webkit-scrollbar {
	    width: 8px;
	}
	
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
    .conn{
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
</style>
</head>
<body>

	<div id="chat">
        <div id="chat-header">
            <div id="chat-logo">
                <b style="font-size:17px;">PPIC CHAT 💬</b>
                <span style="float:right;">
                    홍길동&nbsp;
                    <img src="resources/icons/profile.jpg" class="rounded-circle" width="25" height="25" id="myProfileImg">
                    <span class="conn out"></span> 
                </span>
            </div>
    
            <div id="chat-menu">
                <img src="resources/icons/user.png" height="26px" onclick="showUser();"> 
                <img src="resources/icons/chat.png" height="25px" onclick="showChatting();"> 
            </div> 
            <table id="search-area">
                <tr>
                    <td width="300px">
                        <input type="text" name="keyword" placeholder="&nbsp;이름으로 검색하세요">
                        <button type="submit"><img src="resources/icons/search.png" height="25px" width="25px"></button>
                    </td>
                </tr>
            </table>
        </div>
        <div id="chat-body">
            
            <div id="college-area">
                <div class="detailView">
                    <img src="resources/icons/right-arrow.png" height="15px" width="15px">&nbsp;
                    즐겨찾기
                </div>
                <div class="detail">
                    <div>
                        <img src="resources/icons/profile.jpg" class="rounded-circle collegeProfileImg" width="25" height="25">
                        <span>
                            김혜수
                            <span class="conn online"></span>
                        </span>
                    </div>
                    <div>
                        <img src="resources/icons/profile.jpg" class="rounded-circle collegeProfileImg" width="25" height="25">
                        <span>
                            김서형
                            <span class="conn online"></span>
                        </span>
                    </div>
                    <div>
                        <img src="resources/icons/profile.jpg" class="rounded-circle collegeProfileImg" width="25" height="25">
                        <span>
                            배수지&nbsp;
                            <span class="conn out"></span>
                        </span>
                    </div>
                    <div>
                        <img src="resources/icons/profile.jpg" class="rounded-circle collegeProfileImg" width="25" height="25">
                        <span>
                            차은우&nbsp;
                            <span class="conn offline"></span>
                        </span>
                    </div>
                </div>
    
                <div class="detailView">
                    <img src="resources/icons/up-arrow.png" height="15px" width="15px">&nbsp;
                    내 부서
                </div>
                <div class="detail">
                    <div>
                        <img src="resources/icons/profile.jpg" class="rounded-circle collegeProfileImg" width="25" height="25">
                        <span>
                            김혜수
                            <span class="conn online"></span>
                        </span>
                    </div>
                    <div>
                        <img src="resources/icons/profile.jpg" class="rounded-circle collegeProfileImg" width="25" height="25">
                        <span>
                            
                            김서형
                            <span class="conn online"></span>
                        </span>
                    </div>
                    <div>
                        <img src="resources/icons/profile.jpg" class="rounded-circle collegeProfileImg" width="25" height="25">
                        <span>
                            배수지&nbsp;
                            <span class="conn out"></span>
                        </span>
                    </div>
                    <div>
                        <img src="resources/icons/profile.jpg" class="rounded-circle collegeProfileImg" width="25" height="25">
                        <span>
                            차은우&nbsp;
                            <span class="conn offline"></span>
                        </span>
                    </div>
                </div>
            </div>

            <!-- chatRoomList -->
            <div id="chatRoomList-area">
                <table width="270">
                    <tr>
                        <td>
                            <img src="resources/icons/profile.jpg" class="rounded-circle" width="40" height="40">
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
                    <tr>
                        <td>
                            <img src="resources/icons/profile.jpg" class="rounded-circle" width="40" height="40">
                        </td>
                        <td>
                            <b>김서형</b><br>
                            넵 과장님!
                        </td>
                        <td class="table-time"><small>오후 2:05</small></td>
                    </tr>
                    <tr>
                        <td>
                            <img src="resources/icons/profile.jpg" class="rounded-circle" width="40" height="40">
                        </td>
                        <td>
                            <b>이지은</b><br>
                            점심 뭐먹냐
                        </td>
                        <td class="table-time"><small>오전 11:30</small></td>
                    </tr>
                    <tr>
                        <td>
                            <img src="resources/icons/profile.jpg" class="rounded-circle" width="40" height="40">
                        </td>
                        <td>
                            <b>개발팀</b><br>
                            내일 회식 취소입니다~불금!!!
                        </td>
                        <td class="table-time"><small>2022.12.20</small></td>
                    </tr>
                </table>
                <div id="plus-btn">+</div>
            </div>
            
            <!-- chatRoom create -->
            <div id="chatRoomCreate-area">
                <form action="">
                    <div class="detailView">
                        <img src="resources/icons/down-arrow.png" height="15px" width="15px">&nbsp;
                        즐겨찾기
                    </div>
                    <div class="detail">
                        <div>
                            <input type="checkbox" id="1" name="" class="1">&nbsp;
                            <img src="resources/icons/profile.jpg" class="rounded-circle collegeProfileImg" width="25" height="25">
                            <span>
                                <label for="1">
                                    김혜수
                                    <span class="conn online"></span>
                                </label>
                            </span>
                        </div>
                        <div>
                            <input type="checkbox" id="2" name="" class="2">&nbsp;
                            <img src="resources/icons/profile.jpg" class="rounded-circle collegeProfileImg" width="25" height="25">
                            <span>
                                <label for="2">
                                    김서형&nbsp;
                                    <span class="conn online"></span>
                                </label>
                            </span>
                        </div>
                        <div>
                            <input type="checkbox" id="3" name="" class="3">&nbsp;
                            <img src="resources/icons/profile.jpg" class="rounded-circle collegeProfileImg" width="25" height="25">
                            <span>
                                <label for="3">
                                    배수지&nbsp;
                                    <span class="conn out"></span>
                                </label>
                                
                            </span>
                        </div>
                        <div>
                            <input type="checkbox" id="4" name="" class="4">&nbsp;
                            <img src="resources/icons/profile.jpg" class="rounded-circle collegeProfileImg" width="25" height="25">
                            <span>
                                <label for="4">
                                    차은우&nbsp;
                                    <span class="conn offline"></span>
                                </label>
                            </span>
                        </div>
                    </div>
        
                    <div class="detailView">
                        <img src="resources/icons/up-arrow.png" height="15px" width="15px">&nbsp;
                        내 부서
                    </div>
                    <div class="detail">
                        <div>
                            <input type="checkbox" id="1" name="" class="1">&nbsp;
                            <img src="resources/icons/profile.jpg" class="rounded-circle collegeProfileImg" width="25" height="25">
                            <span>
                                <label for="1">
                                    김혜수
                                    <span class="conn online"></span>
                                </label>
                            </span>
                        </div>
                        <div>
                            <input type="checkbox" id="2" name="" class="2">&nbsp;
                            <img src="resources/icons/profile.jpg" class="rounded-circle collegeProfileImg" width="25" height="25">
                            <span>
                                <label for="2">
                                    김서형&nbsp;
                                    <span class="conn online"></span>
                                </label>
                            </span>
                        </div>
                        <div>
                            <input type="checkbox" id="3" name="" class="3">&nbsp;
                            <img src="resources/icons/profile.jpg" class="rounded-circle collegeProfileImg" width="25" height="25">
                            <span>
                                <label for="3">
                                    배수지&nbsp;
                                    <span class="conn out"></span>
                                </label>
                                
                            </span>
                        </div>
                        <div>
                            <input type="checkbox" id="4" name="" class="4">&nbsp;
                            <img src="resources/icons/profile.jpg" class="rounded-circle collegeProfileImg" width="25" height="25">
                            <span>
                                <label for="4">
                                    차은우&nbsp;
                                    <span class="conn offline"></span>
                                </label>
                            </span>
                        </div>
                    </div>
                    <!-- <button type="submit" id="createChat">채팅방 생성</button> -->
                </form>
            </div>
        </div>
    </div>
    <script>
        // 내 프로필 보기
        $("#myProfileImg").click(function(){
            $("#myProfile").modal("show");
        })

        // 채팅 메뉴바 클릭 (주소록)
        function showUser(){
            // ajax
        }

        // 채팅 메뉴바 클릭 (채팅목록)
        function showChatting(){
            // ajax
        }

        // 주소록 펼쳐보기
        $(".detailView").click(function(){
            if($(this).next().css("display") == "none"){
                $(this).next().show();
            }else{
                $(this).next().hide();
            }
        })

        // 동료 프로필 보기
        $(".collegeProfileImg").click(function(){
            $("#collegeProfile").modal("show");
        })

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
                    <form action="">
                        <img src="resources/icons/profile.jpg" class="rounded-circle" width="70" height="70">
                        <b>홍길동</b>
                        <select name="" id="">
                            <option value="">
                                온라인
                            </option>
                            <option value="">
                                부재중
                            </option>
                            <option value="">
                                오프라인
                            </option>
                        </select>
                        <br><br>
                        <div align="center">
                            <button class="btn" id="update-btn">확인</button>
                            <button class="btn" data-dismiss="modal" id="exit-btn">취소</button>
                        </div>
                    </form>
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
                    <img src="resources/icons/profile.jpg" class="rounded-circle" width="150" height="150"><br><br>
                    <b style="font-size:18px;">김혜수</b>
                    ☆<br><br>
                </div>
                <p>💻 개발부서 (부장)</p>
                <p>✉️ hey_sookim@ppic.kr</p>
                <p>📞 0548-309</p>
            </div>
        </div>
        </div>
    </div>

</body>
</html>