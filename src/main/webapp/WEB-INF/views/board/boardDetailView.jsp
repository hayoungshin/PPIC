<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* table 스타일 */
    .boardOuter td{
        padding:10px; 
        font-size:14px;
    }
    .line{
        border-bottom:1px solid lightgray;
    }
    .boardOuter td>span{margin-right:15px;}
    .boardOuter td>a{text-decoration: none!important;}

    /* button 스타일 */
    #list-btn, #report-btn, #exit-btn, #delete-btn, #modal-btn{
        color:white;
        width:70px;
        height:30px;
        font-size: 12px;
        background: rgb(190, 190, 190);
    }
    #report-btn, #delete-btn, #modal-btn{background: rgb(111, 80, 248);}
    .dropdown-toggle{cursor:pointer;}
    .likehate{
    	display:inline-block;
    	padding:1px 10px;
    	border-radius:5px; 
    	cursor:pointer;
    	border:1px solid rgb(220, 220, 220);
   	}
   	.clickedbtn, .likehate:active{
   		background:rgb(220, 220, 220);
   	}

    /* modal내 input요소 스타일 */
    select{
        width: 100px;
        border: 1px solid rgb(202, 199, 199);
        height: 30px;
        border-radius: 5px;
        cursor: pointer;
    }
    textarea{
        border: 1px solid rgb(202, 199, 199);
        border-radius: 5px;
        width: 350px;
        height:100px;
    }
</style>
</head>
<body>

	<jsp:include page="boardMenubar.jsp"/>
    <script>
        document.getElementsByClassName("menus")[1].className += ' clicked';
    </script>
	<br>
	<div class="boardOuter">
        <table>
            <tr>
                <td colspan="2" width="1100px"><h5>${ b.boardTitle }</h5></td>
                <td style="text-align: right;">
                    <div class="dropdown btn-align">
                        <img src="resources/icons/dots.png" class="dropdown-toggle" data-toggle="dropdown" height="15" width="15">
                        <div class="dropdown-menu">
                        	<c:choose>
	                            <c:when test="${ loginUser.userNo eq b.boardWriter }">
		                            <a class="dropdown-item" href="#" onclick="postFormSubmit(1)">수정</a>
		                            <a class="dropdown-item" id="delete" href="#" data-toggle="modal" data-target="#deleteModal">삭제</a>
	                            </c:when>
	                            <c:otherwise>
	                            	<a class="dropdown-item" style="color:lightgray;">수정</a>
		                            <a class="dropdown-item" style="color:lightgray;">삭제</a>
	                            </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </td>
            </tr>
            <tr class="line">
                <td colspan="2">
                    <span>${ b.createDate }</span>
                    <input type="hidden" id="likehateStatus" value="${ b.likehateStatus }">
                    <span class="likehate" id="like-btn">👍 ${ b.likeCount } </span><span class="likehate" id="dislike-btn">👎 ${ b.hateCount }</span>
                </td>
                <td style="text-align: right;">조회수 ${ b.count }</td>
            </tr>
            <tr>
                <td colspan="3">
                    <p>
                       	${ b.boardContent }
                    </p>
                </td>
            </tr>
        </table>
        
        <script>
        	// 로그인한 회원이 좋아요/싫어요 했는지 여부 표시
	        $(function(){
	        	if("${ b.likehateStatus }" == "0"){
	        		$("#like-btn").addClass("clickedbtn");
	        	} else if("${ b.likehateStatus }" == "1"){
	        		$("#dislike-btn").addClass("clickedbtn");
	        	}
	        	
	        	// 좋아요 버튼 클릭
		        $("#like-btn").click(function(){
		        	if($("#likehateStatus").val() == "0"){ // 이미 좋아요 클릭 돼있을 경우 => 좋아요 삭제
		        		$.ajax({
		        			url:"deleteLike.bo",
		        			data:{
		        				userNo:${loginUser.userNo}, 
		        				boardNo:${ b.boardNo }
		        			},success:function(b){
		        				$("#like-btn").removeClass("clickedbtn");
		        				$("#like-btn").text("👍 " + b.likeCount);
		        				$("#likehateStatus").val(b.likehateStatus);
		        			},error:function(){
		        				console.log("좋아요 해제 ajax 통신 실패")
		        			}
		        		})
		        	} else if($("#likehateStatus").val() == "1"){ // 싫어요 클릭 돼있을 경우
		        		$("#message>p").text("싫어요 취소 후 좋아요 가능합니다.");
		        		$("#likehateModal").modal("show");
		        	} else{ // 좋아요 추가
		        		$.ajax({
		        			url:"insertLike.bo",
		        			data:{
		        				userNo:${loginUser.userNo}, 
		        				boardNo:${ b.boardNo },
		        				likehateStatus:0
		        			},success:function(b){
		        				$("#like-btn").addClass("clickedbtn");
		        				$("#like-btn").text("👍 " + b.likeCount);
		        				$("#likehateStatus").val(b.likehateStatus);
		        			},error:function(){
		        				console.log("좋아요 추가 ajax 통신 실패")
		        			}
		        		})
		        	}
		        })
		        
		        // 싫어요 버튼 클릭
		        $("#dislike-btn").click(function(){
		        	if($("#likehateStatus").val() == "1"){ // 이미 싫어요 클릭 돼있을 경우 => 싫어요 삭제
		        		$.ajax({
		        			url:"deleteLike.bo",
		        			data:{
		        				userNo:${loginUser.userNo}, 
		        				boardNo:${ b.boardNo }
		        			},success:function(b){
		        				$("#dislike-btn").removeClass("clickedbtn");
		        				$("#dislike-btn").text("👎 " + b.hateCount);
		        				$("#likehateStatus").val(b.likehateStatus);
		        			},error:function(){
		        				console.log("싫어요 삭제 ajax 통신 실패")
		        			}
		        		})
		        	} else if($("#likehateStatus").val() == "0"){ // 좋아요 클릭 돼있을 경우
		        		$("#message>p").text("좋아요 취소 후 싫어요 가능합니다.");
		        		$("#likehateModal").modal("show");
		        	} else{ // 싫어요 추가
		        		$.ajax({
		        			url:"insertLike.bo",
		        			data:{
		        				userNo:${loginUser.userNo}, 
		        				boardNo:${ b.boardNo },
		        				likehateStatus:1
		        			},success:function(b){
		        				$("#dislike-btn").addClass("clickedbtn");
		        				$("#dislike-btn").text("👎 " + b.hateCount);
		        				$("#likehateStatus").val(b.likehateStatus);
		        			},error:function(){
		        				console.log("싫어요 추가 ajax 통신 실패")
		        			}
		        		})
		        	}
		        })
	        })
	        
        </script>
        
        <form action="" method="post" id="postForm">
        	<input type="hidden" name="no" value="${ b.boardNo }">
        	<input type="hidden" name="type" value="0"> <!-- 익명게시판에서 수정이면 0, 나의 게시글에서 수정이면 1 -->
        	<input type="hidden" name="userNo" value="${loginUser.userNo}"> 
        </form>
        
        <script>
        	function postFormSubmit(num){
        		if(num == 1){
        			$("#postForm").attr("action", "updateForm.bo").submit();
        		} else{
        			$("#postForm").attr("action", "delete.bo").submit();
        		}
        	}
        </script>
        <br>
        <div align="center" style="width:1200px;">
            <button class="btn" id="list-btn" onclick="location.href='list.bo'">목록</button>
            <c:if test="${ b.reportCount ne 1 }"> <!-- 신고 중복 방지 -->
            	<button class="btn" id="modal-btn" data-toggle="modal" data-target="#reportModal">신고</button>
            </c:if>
        </div>
        
        <div class="modal" id="likehateModal" data-backdrop='static' data-keyboard='false'>
            <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-body">
                	<div align="right"><button type="button" class="close" data-dismiss="modal">&times;</button></div><br>
	                <div align="center" id="message">
	                    <p></p>
	                </div>
                </div>
            </div>
            </div>
        </div>

        <!-- 삭제 확인용 Modal -->
        <div class="modal" id="deleteModal" data-backdrop='static' data-keyboard='false'>
            <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-body">
                <b>익명 게시글 삭제</b> <br><br>
                <div align="center">
                    삭제하시겠습니까?<br><br>
                    <a class="btn" data-dismiss="modal" id="exit-btn">취소</a>
                    <a onclick="postFormSubmit(2);" class="btn" id="delete-btn">확인</a>
                </div>
                </div>
            </div>
            </div>
        </div>

        <!-- 신고용 Modal -->
        <div class="modal" id="reportModal" data-backdrop='static' data-keyboard='false'>
            <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <b>신고하기</b> <br><br>
                    <form action="report.bo" method="post">
                    <input type="hidden" name="reportBno" value="${ b.boardNo }">
                    <input type="hidden" name="reportMno" value="${loginUser.userNo}"> 
                        <table>
                            <tr>
                                <td><b>신고구분</b></td>
                                <td>
                                    <select name="reportKind">
                                        <option>욕설/비방</option>
                                        <option>개인정보노출</option>
                                        <option>회사기밀</option>
                                        <option>게시글도배</option>
                                        <option>기타</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td><b>신고내용</b></td>
                                <td><textarea name="reportContent" placeholder="내용을 입력해주세요." style="resize: none;" required></textarea></td>
                            </tr>
                        </table>
                        <div align="center">
                            <button class="btn" data-dismiss="modal" id="exit-btn">취소</button>
                            <button type="submit" class="btn" id="report-btn">등록</button>
                        </div>
                    </form>
                </div>
            </div>
            </div>
        </div>
    </div>
</body>
</html>