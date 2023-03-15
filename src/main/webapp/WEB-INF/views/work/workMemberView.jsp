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
	
	.workyear{
		font-size: 18px;
	    font-weight: bold;
        float:right; 
        margin: 30px 0px 0px 0px;
        width:90%;
        height: 50px;
	}
	
	.worklist {width:1350px}
	.worklisttitle {width:1350px}
	
	#memberList {overflow:auto; height:500px;}
    #memberList::-webkit-scrollbar { width: 8px; }
	#memberList::-webkit-scrollbar-thumb {background: lightgray; border-radius: 10px;}
	
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
					location.href="workMain.wo"
				}
			</script>
           
			<div class="workcategory" style="float:left;" >
                <a href="workList.wo" >출퇴근기록</a>
                <a href="workInfo.wo" >올해근무정보</a>
				<a href="holiInfo.ho" >휴가현황</a>
                <a href="holiApply.ho">휴가신청</a>
                
                
                <!-- 관리자만 보이게 할거임 -->
                <a href="memberWork.wo" style="color:black;">구성원근무</a>
                <a href="memberHoli.ho">전사원휴가현황</a>
                <a href="holiGive.ho" >휴가지급|회수</a>
                <a href="holiApprove.ho" >휴가승인</a>
                
                <br>
            </div>

			
			<br>
			<br><br>
			
			<div style="float:left;">
			<select>
				<option> 전체 </option>
				<c:forEach var="m" items="${ list }" >
					
				</c:forEach>
				
				
			</select>
			</div>
			
			<div class="workyear" align="right">
				<a>
					<img src="resources/icons/left-arrow.png" style="width:20px; margin:1px 3px 3px 3px;">
				</a> 
			2023년 
				<a>
					<img src="resources/icons/right-arrow.png" style="width:20px; margin:1px 3px 3px 3px;">
				</a>
			</div>
	
			<div class="memberwork"  >
			
	            <table class="worklisttitle" border="1">
	                <thead>
	                    <tr align="center">
	                        <th colspan="2">정보</th>
	                        <th colspan="3">휴가</th>
	                        <th colspan="3">근태</th>
	                        <th colspan="2">근무</th>
	                    </tr>
	                    <tr align="center">
							<th width="200">이름(사번)</th>
	                        <th width="150">소속</th>
	                        <th width="150">지급</th>
	                        <th width="150">사용</th>
	                        <th width="150">잔여</th>
	                        <th width="150">지각</th>
	                        <th width="150">조기퇴근</th>
	                        <th width="150">결근</th>
	                        <th width="150">근무일</th>
	                        <th width="150">총근무시간</th>
	                    </tr>
	                </thead>
	                </table>
	               
	                <div id="memberList" >
		                <table class="worklist" border="1" style="margin-top:1px;">
			                <tbody align="center">
								
								<c:forEach var="list1" items="${ list1 }"  varStatus="status">
				                    <tr >
				                    	
										<td  width="200"> ${ list1.userName }(사번)</td>
										<td width="150">소속</td>
										<td width="150">지급</td>
										<td width="150">사용</td>
										<td width="150">잔여</td>
										<td width="150">지각</td>
										<td width="150">조기퇴근</td>
										<td width="150">결근</td>
										<td width="150">근무일</td>
										<td width="150">총근무시간</td>
				                    </tr>
			                    </c:forEach>
			                </tbody>
	                	</table>
	                </div>
	                
	               
	                
	           
	        
	            <script>
	                /* td 클릭시 상세페이지 이동  */
	            </script>
	
	        </div>

			
			  

        </div>
    </div>	
	
</body>
</html>