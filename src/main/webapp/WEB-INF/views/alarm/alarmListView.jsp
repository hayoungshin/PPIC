<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.alarm-outer{
        margin:auto; 
        font-size: 14px;
    }

    .alarm-outer>div{height:100%; float:left;}
    #alarm-menu{width:13%;}
    #alarm-list{width:87%; padding:20px;}
	#alarm-list-area{width:1020px; height:480px;overflow:auto;}
	#alarm-list-area::-webkit-scrollbar {
	    width: 8px; 
	}
	
	#alarm-list-area::-webkit-scrollbar-thumb {
	    background: lightgray;
	    border-radius: 10px;
	}
	
    /* 알림 메뉴 스타일 */
    #alarm-kind{
        height:500px;
        padding:15px;
        border: 1px solid rgb(202, 199, 199);
        border-radius: 5px;
    }
    #alarm-kind>label{width:80px; text-align: left;}
    input[type=radio]{display:none;}
    input[type=radio]+label{
        cursor: pointer;
        text-align: center;
    }
    input[type=radio]:checked+label, input[type=radio]:hover+label{
        color:rgb(111, 80, 248);
    }

    /* table 스타일 */
    .alarm-outer td{padding:8px;}
    .line{border-bottom:1px solid lightgray;} 

    /* 버튼 스타일 */
    #allDeleteModal-btn, #exit-btn, #allDelete-btn, #delete-btn{
        color:white;
        width:80px;
        height:30px;
        font-size: 12px;
        background: rgb(190, 190, 190);
    }
    #allDeleteModal-btn, #allDelete-btn, #delete-btn{background: rgb(111, 80, 248);}
    a:hover, .delete-img:hover{opacity:0.7;}
    .delete-img{cursor:pointer; float:right;}
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	<div class="outer">
		<div id="content">
			<div class="alarm-outer"> 
		        <div id="alarm-menu">
		            <br><h4><b>알림 조회</b></h4><br>
		            <div id="alarm-kind">
		                <input type="radio" id="all" name="kind" checked value="all"><label for="all">전체 알림</label><br>
		                <input type="radio" id="notRead" name="kind" value="N"><label for="notRead">안읽은 알림</label><br>
		                <input type="radio" id="approval" name="kind" value="0"><label for="approval">결재</label><br>
		                <input type="radio" id="work" name="kind" value="1"><label for="work">업무</label><br>
		                <input type="radio" id="reservation" name="kind" value="2"><label for="reservation">예약</label><br>
		                <input type="radio" id="commute" name="kind" value="3"><label for="commute">근태</label><br>
		                <input type="radio" id="mail" name="kind" value="4"><label for="mail">메일</label><br>
		            </div>
		        </div>
		        <div id="alarm-list">
		            <br>
		            <div style="width:1000px">
		            	<span style="font-size:17px;" id="alarm-name">전체 알림</span>
		            	<a href="" class="btn" id="allDeleteModal-btn" style="float:right" data-toggle="modal" data-target="#allDeleteModal">전체 삭제</a>
		            </div>
		            <br><br>
		            <div id="alarm-list-area">
			            <table width="1000px" id="alarm-content">
			                <tr class="line">
			                    <td>🔔 '회의실 사용' 승인이 완료되었어요.   2023-02-17 16:34</td>
			                    <td><img src="resources/icons/delete.png" width="8px" height="8px" class="delete-img"></td>
			                </tr>
			                <tr class="line">
			                    <td>✔️ 하니님이 '계약서 검토 요청' 승인을 요청했어요.  2023-02-17 16:34</td>
			                    <td><img src="resources/icons/delete.png" width="8px" height="8px" class="delete-img"></td>
			                </tr>
			            </table>
		            </div>
		        </div>
		        <script>
		        	$(function(){
		        		selectListNoti();
		        	})
		        	$("input[name=kind]").change(function(){
		        		selectListNoti();
		        	})
		        	
		        	function selectListNoti(){
		        		$.ajax({
		        			url:"selectList.noti",
		        			data:{
		        				receiveNo:${loginUser.userNo},
		        				catNo:$("input[name=kind]:checked").val()
		        			},
		        			success:function(list){
		        				console.log(list)
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
			        							+ '<td><img src="resources/icons/delete.png" width="8px" height="8px" class="delete-img"></td>'
			        							+ "</tr>"
			        				}
		        				}
		        				$("#alarm-content").html(value);
		        			},error:function(){
		        				console.log("알림 리스트 조회용 ajax통신 실패")
		        			}
		        		})
		        	}
		        	
		            $(document).on("click", ".delete-img", function(){
		                // 알림 번호 넘기면서
		                $('#deleteModal').modal('show'); 
		            })
		        </script>
		        <!-- 전체 삭제 확인용 Modal -->
		        <div class="modal" id="allDeleteModal" data-backdrop='static' data-keyboard='false'>
		            <div class="modal-dialog modal-dialog-centered modal-sm">
		            <div class="modal-content">
		                <div class="modal-body">
		                <b>알림 전체 삭제</b> <br><br>
		                <div align="center">
		                    전체 삭제하시겠습니까?<br><br>
		                    <a class="btn" data-dismiss="modal" id="exit-btn">취소</a>
		                    <a href="" class="btn" id="allDelete-btn">확인</a>
		                </div>
		                </div>
		            </div>
		            </div>
		        </div>
		
		        <!-- 개별 삭제 확인용 Modal -->
		        <div class="modal" id="deleteModal" data-backdrop='static' data-keyboard='false'>
		            <div class="modal-dialog modal-dialog-centered modal-sm">
		            <div class="modal-content">
		                <div class="modal-body">
		                <b>알림 삭제</b> <br><br>
		                <div align="center">
		                    삭제하시겠습니까?<br><br>
		                    <a class="btn" data-dismiss="modal" id="exit-btn">취소</a>
		                    <a href="" class="btn" id="delete-btn">확인</a>
		                </div>
		                </div>
		            </div>
		            </div>
		        </div>
			</div>
    	</div>
    </div>
</body>
</html>