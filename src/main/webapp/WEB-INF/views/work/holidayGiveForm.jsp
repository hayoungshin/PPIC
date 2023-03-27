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
	
	/* content */
	
	.holi-give {
        width: 49%;
        float: left;
        /* border: 1px solid black; */
    }

    .holi-out {
        width: 49%;
        /* border: 1px solid black; */
        float: left;
        margin-bottom: 30px;
    }

    .holidayinfo{
        background: lightgray;
        margin: auto;
        width: 90%;
        height: 30%; 
        float: left;
        padding: 5px 5px 5px 5px ;
        text-align: center;
        margin-top:30px;
    }

    .holititle{
        font-size: 18px;
        font-weight:600;
        margin: 5px;
    }

    label{font-size:18px; margin:5px 50px 30px 5px;}

    #homem { margin-right: 66px;}
    #homem2 { margin-right: 66px;}

    select{ width: 150px; height: 30px;}

    .btn-holi{width: 70px; margin-left: 300px;}
	
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
				<a href="holiInfo.ho?no=${loginUser.userNo }" >휴가현황</a>
                <a href="holiApply.ho?no=${loginUser.userNo }">휴가신청</a>
                
                
                <br>
            </div>
			<div class="workcategory mworkcategory">
				<!-- 관리자만 보이게 할거임 -->
				<a href="memberWork.wo">구성원근무</a>
				<a href="memberHoli.ho">전사원휴가현황</a>
				<a href="holiGive.ho"  style="color:black;">휴가지급|회수</a>
				<a href="holiApprove.ho">휴가승인</a>
			</div> 
            
            
            <script>
				$(function(){
	        		
	        		$(".mworkcategory").hide();
	        		
	        		var a = "${loginUser.authorityNo}";
	        		
	
	        		if (a.includes('2') || a.includes('0')) {
	        			$(".mworkcategory").show();
	       			} else {
	       				
	       			}
	        	})
			</script>

			
			<br>
			<br><br>
	
			
			<div class="holi-give"  >
				<div class="holititle">휴가지급</div>
				
				<br> 
				
				<form action="holidayGive.ho" method="post">
				    <label id="homem" >대상자</label>
				    
				    <select class="dept" name="dept" id="dept">
				    	<option value="">소속</option>
				    	<c:forEach var="d" items="${ list2 }">
			            	<option value="${ d.departmentNo }"> ${ d.departmentName }</option>
			            </c:forEach>
				    </select>
				    
				    <select class="userNo" name="userNo" id="userNo">
				    	<option value="">이름</option>
				    	<c:forEach var="m" items="${ list1 }">
				    			<option value="${m.userNo}" value2="${m.departmentNo}" value3="${m.position}" style="display:none;">${m.userName}</option>
				    	</c:forEach>
			        </select>
			        
			        <script>
			        	
				        $("#dept").change(function(){
				          var selectedDept = $("#dept option:selected").val();
				          $("#userNo option").each(function(){
				              if($(this).attr("value2") == selectedDept){
				               $(this).css("display", "block");
				              }else{
				                $(this).css("display", "none");
				              }
				            })
				        })

			        </script>
				
				    <br><br>
				
				    <label>지급내역</label>
				    <select name="cause" id="cause">
				        <option value="연차지급">연차</option>
				        <option value="추가지급">여름휴가</option>
				    </select>
				
					
					<br><br>
				    <label>지급일수</label>
				    <input type="number" id="datea" name="datea" style="width:150px">
				        
				    <br><br>
				
				    <input class="btn-purple btn-holi" id="holidaygive-btn" type="submit" value="저장">
				</form>
				    
				
			</div>
			
			<div class="holi-out">
			    <div class="holititle">휴가회수</div>
			    
			    <br>
			
			    <form action="holiWithDraw.ho" method="post">
			        <label id="homem2">대상자</label>
			        
			        <select class="dept" name="dept" id="dept2">
				    	<option value="">소속</option>
				    	<c:forEach var="d" items="${ list2 }">
			            	<option value="${ d.departmentNo }"> ${ d.departmentName }</option>
			            </c:forEach>
				    </select>
				    
				    <select class="userNo" name="userNo" id="userNo2">
				    	<option value="">이름</option>
				    	<c:forEach var="m" items="${ list1 }">
				    			<option value="${m.userNo}" value2="${m.departmentNo}" value3="${m.position}" style="display:none;">${m.userName}</option>
				    	</c:forEach>
			        </select>
					
					<script>
			        	
				        $("#dept2").change(function(){
				          var selectedDept = $("#dept2 option:selected").val();
				          $("#userNo2 option").each(function(){
				              if($(this).attr("value2") == selectedDept){
				               $(this).css("display", "block");
				              }else{
				                $(this).css("display", "none");
				              }
				            })
				        })

			        </script>
					
					
					
			        <br><br>
			
			        <label>회수내역</label>
			        <select name="cause" id="cause">
			            <option value="연차사용">오지급</option>
			            <option value="연차사용">무단결근</option>
			        </select>
			
			        <br><br>
			
			        <label>지급일수</label>
			        <input type="number" id="" name="datea" style="width:150px">
			        
			        <br><br>
			
			        <input class="btn-purple btn-holi" id="holidaywithdraw-btn" type="submit" value="저장">
			    </form>
			    
			</div>
			
			<br><br><br><br>
			
			<div class="holidayinfo">
			    조직을 선택하여 휴가를 수동생성할 대상자를 선택하고, 현재 휴가에 추가로 생성 및 회수 할 수 있습니다. 
			    <br><br>
			    생성할 휴가 종류와 일수를 선택하여 사용자의 휴가를 생성하세요.
			    <br><br>
			    회수할 휴가 종류와 일수를 선택하여 사용자의 휴가를 회수하세요.
			    <br>
			    <br>
			</div>
			
			  

        </div>
    </div>	

	<!-- 알림 관련 -->
	<script>
		// 휴가 지급 버튼클릭
		$("#holidaygive-btn").click(function(){
			if(socket){
				let socketMsg = "7,${loginUser.userNo},${loginUser.userName}," + $(".holi-give select[name=userNo]").val() + ",3," + $(".holi-give select[name=cause]>option:selected").text(); 
				socket.send(socketMsg);
			}
		})
		
		// 휴가 회수 버튼클릭
		$("#holidaywithdraw-btn").click(function(){
			if(socket){
				let socketMsg = "8,${loginUser.userNo},${loginUser.userName}," + $(".holi-out select[name=userNo]").val() + ",3," + $(".holi-out select[name=cause]>option:selected").text(); 
				socket.send(socketMsg);
			}
		})
	</script>
</body>
</html>