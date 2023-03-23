<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PPIC</title>

<style>
	<!-- 카테고리 css -->
	
	.workcategory{
	    width: 100%;
	    margin-bottom: 30px;
	}
	.workcategory>a{
	    font-size: 20px;
	    font-weight: bold;
	    margin-right: 20px;
	    color: lightgray;
	    text-decoration:none;
	}
	
	.workcategory>a:link {color:lightgray; text-decoration:none;}
    .workcategory>a:visited {color:lightgray; text-decoration:none;}
	.workcategory>a:hover{color: black; text-decoration:none;}
	
	
	
	.holiday{
	    width: 49%;
	    margin-top : 50px;
	}
	
	.holidayList{
	    
	    width:98%;
	    height: 400px;
	    padding: 2px;
	    background : rightgray;
	   
	}
	
	.holidayList table {
		width:95%;
		margin-left:20px;
		font-size : 20px;
	}
	
	.H_date{
	    width: 150px;
	}
	
	.holidaystatus{
	    font-size: 15px;
	    color:white;
	    background: rgb(111, 80, 248);
	    width: 100px;
	    border-radius: 10px;
	    margin: auto;
	    margin-left: 6px;
	}
	
	#listnone{font-size: 20px;}
	#none{margin-top:50px;}
	#sort{margin-top:20px;}
	#so1{margin-bottom :5px;}
	
	.holidayList {overflow:auto; height:500px;}
    .holidayList::-webkit-scrollbar { width: 8px; }
	.holidayList::-webkit-scrollbar-thumb {background: lightgray; border-radius: 10px;}
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />	
	
	<div class="outer">


        <div id="content" style=" " >

            <div onclick="workback();">
				<h2 style="font-weight:bold">근무</h2>
				    <br>
			</div>
			
			<script>
				function workback(){
					location.href="workMain.wo?no="+${loginUser.userNo }
				}
			</script>
           
            <div class="workcategory" style="float:left;" >
	            <a href="workList.wo?no=${loginUser.userNo }" >출퇴근기록</a>
	            <a href="workInfo.wo?no=${loginUser.userNo }" >올해근무정보</a>
				<a href="holiInfo.ho?no=${loginUser.userNo }" >휴가현황</a>
	            <a href="holiApply.ho?no=${loginUser.userNo }" style="color:black;">휴가신청</a>
	            
	            
	            <!-- 관리자만 보이게 할거임 -->
	            <a href="memberWork.wo">구성원근무</a>
	            <a href="memberHoli.ho">전사원휴가현황</a>
	            <a href="holiGive.ho">휴가지급|회수</a>
	            <a href="holiApprove.ho">휴가승인</a>
            <br>
            </div>
            
            
			
			<br>
	
            <div class="holiday" style="float:left">
                <h5 style="margin-bottom:30px">휴가등록</h5>
                <form action="holiEnroll.ho" method="post">
                	<input type="hidden" value="${loginUser.userNo }" name="userNo">
	                <select id="type" name="type" onchange="changehtml();" style="width:150px;">
	                    <option value="연차"> 연차</option>
	                    <option value="반차"> 반차</option>
	                </select>
	                <br>
	                <div id="sort"></div>
	                <br>

	
	                <label>휴가일정</label> <br>
	                <input type="date" class="H_start" name="start"> &nbsp;&nbsp;-&nbsp;&nbsp; 
	                <input type="date" class="H_finish" name="finish">
					<br>
	                <br>
	                
					<label>휴가기간</label> <br>
					<div id="datea">
						<input  type="number" class="H_date" name="datea" >
					</div>
	                
	                
	                <br><br>
	                <label>사유</label> <br>
	                <textarea  cols="80" rows="5" style="resize:none;" id="reason" name="reason"></textarea>
	
	                <br><br>
	                <div style="margin-left:250px">
	                	<input class="btn-purple" type="submit" id="holiday-btn" value="휴가신청">
	                </div>
                </form>
            </div>

            
            <div class="holiday" style="float:left">
                <h5 style="margin-bottom:20px">예정휴가</h5>
                
                <div class="holidayList">
                    
                </div>
            </div>
			
			<script>
				$(function(){
					selectHoliList();
				});
				
				function selectHoliList(){
					$.ajax({
						url:"selectHoliList.ho",
						data:{no:${loginUser.userNo}},
						success:function(map){
							console.log("정보조회성공");
							
							let value=""
							if(map.list.length == 0 ){
								value += "<div id='listnone' align='center'>"
									+		"<img id='none' src='resources/icons/smile.png' width='200'>" + "<br>"
									+		"휴가 목록이 없습니다"
									+	 "</div>";
							}else {
								value += "<table id='test'>";
								for(let i=0; i<map.list.length; i++){
									value += "<tr id='holilist' onClick='a("+ map.list[i].holidayNo + ")'>" 
										+		"<td width='100px'>"
				                        +    		"<img src='resources/icons/vacations.png' width='90%'>"
										+		"</td>"
					                    +       "<td>" + map.list[i].type  + "|" +  map.list[i].start + "-" +  map.list[i].finish + "</td>"
					                    +		"<td width='100px'>"
				                        +    		"<div class='holidayNo' id='holidayNo' name='no' style='display:none;'>" + map.list[i].holidayNo + "</div>"
										+		"</td>"		
					                    +       "<td>"
					                    +			"<div class='holidaystatus' id='status' name='status' align='center'>" + map.list[i].status + "</div>"
					                    +		"</td>"
										+ 	"</tr>";
									}
								value += "</table>";
							}	
						
							$(".holidayList").html(value);
							
							
							
						},error:function(){
							console.log("휴가기록조회실패")
						}
					});
					
				};
				
				function a (b) {
					
					var no1 = b;
					console.log(b);
			
					$('#deleteForm').show();
					
					$(document).on("click",".close",function(){ 
						$('#deleteForm').hide();
					});
					
					var no = document.getElementById('holiNo');
	    			
	    			$(no).val(no1);
				}
			
				
				$(function(){
					var a = $("#type option:selected").val();
					console.log(a);
				})
				
				function changehtml(){
					var type = document.getElementById('type').value;
					var sort = document.getElementById('sort');
					var datea = document.getElementById('datea');
					
					if(type=="연차"){
						console.log("연차");
						show.innerHTML ='<input type="text" title="텍스트입력" />';
					}else if(type=="반차") {
						console.log("반차");
						sort.innerHTML ='<input type="radio" name="sort" id="so1" value="오전" checked="checked"/>오전(09:00 - 13:00) <br> <input type="radio" id="so2" name="sort" value="오후" />오후(13:00 - 18:00)';
						datea.innerHTML ='<input id="datea" type="number" class="H_date" name="datea" value=0.5 readonly>';
					}
				}
				
				
			</script>
			
			<!-- 신청한 연차 삭제하기  -->
			<div class="modal" id="deleteForm" style="position: fixed; top: 300px; right: 600px; ">
        		<div class="modal-dialog">
	           		<div class="modal-content">
		                 <button type="button" class="close" style="font-size:18px; width:30px; height:30px; margin:10px; margin-left:450px;" data-dismiss="modal">X</button>
	            
		                <!-- Modal body -->
		                <div class="modal-body" align="center">
		                
		                    <b>
					                        사용 승인 전입니다 <br>   
					                        정말로 삭제 하시겠습니까? <br><br>
		                    </b>
							<br>
		                    <form action="holiyApplyDelete.ho" method="post">
		                        <input type="hidden" name="holidayNo" id="holiNo" value=""> 
		                        <input type="hidden" name="userNo" value="${ loginUser.userNo }">
								
		                        <button type="submit" class="btn-purple" > 삭제하기</button>
		                    </form>
		
		                </div>
		               
	            	</div>
	        	</div>
	    	</div>
	    	
        </div>
    
    	<!-- 알림 관련 -->
    	<script>
    		let receiveList = "";
    		$(function(){
    			$.ajax({
    				url:"authorityMemList.me",
    				data:{
    					authoNo:2
    				},success:function(list){
    					for(let i=0; i<list.length; i++){
    						receiveList += list[i].userNo + "/"
    					}
    				},error:function(){
    					console.log("알림 권한자 리스트 조회용 ajax통신 실패")
    				}
    			})
    		})
    		$("#holiday-btn").click(function(){
    			if(socket){
					let socketMsg = "11,${loginUser.userNo},${loginUser.userName}," + receiveList + ",3," + $("select[name=type]").val();
					socket.send(socketMsg);
				}
    		})
    	</script>

</body>
</html>