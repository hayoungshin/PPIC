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
	
	
	.workyear{
		font-size: 18px;
	    font-weight: bold;
        float:right; 
        margin: 30px 0px 0px 0px;
        width:90%;
        height: 50px;
       
	}
	
	.holiinfo{width:100%;}
    table{width:100%;}
	#info tr{ height: 50px;}
    .wtitle{width: 100px;}
    #info td{ width: 45px; }
	
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
                <a href="holiApply.ho?no=${loginUser.userNo }">휴가신청</a>
                
                
                <br>
            </div>
			<div class="workcategory mworkcategory">
				<!-- 관리자만 보이게 할거임 -->
				<a href="memberWork.wo">구성원근무</a>
				<a href="memberHoli.ho">전사원휴가현황</a>
				<a href="holiGive.ho">휴가지급|회수</a>
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
	
			 <div class="workyear" align="right">
                <a>
                	<img src="resources/icons/left-arrow.png" style="width:20px; margin:1px 3px 3px 3px;">
                </a> 
                2023년 
                <a>
                	<img src="resources/icons/right-arrow.png" style="width:20px; margin:1px 3px 3px 3px;">
                </a>
            </div>
			
			  <div class="holiinfo" style="float:left" align="center">
               <table id="info" border="1" align="center">
                    <tr align="center">
                        <th colspan="2"></th>
                        <th>1월</th>
                        <th>2월</th>
                        <th>3월</th>
                        <th>4월</th>
                        <th>5월</th>
                        <th>6월</th>
                        <th>7월</th>
                        <th>8월</th>
                        <th>9월</th>
                        <th>10월</th>
                        <th>11월</th>
                        <th>12월</th>
                        <th>합계</th>
                    </tr>
                    <tr align="center">
                        <td width="50px" rowspan="4">근<br>태</td>
                        <td  class="wtitle">지각</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                    </tr>
                    <tr align="center">
                        <td class="wtitle">조기퇴근</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                    </tr>
                    <tr align="center">
                        <td class="wtitle">결근</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                    </tr>
                    <tr align="center">
                        <td class="wtitle">휴가</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                    </tr>
                    <tr align="center">
                        <td rowspan="3">근<br>무<br>시<br>간</td>
                        <td class="wtitle">실근무시간</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                    </tr>
                    <tr align="center">
                        <td class="wtitle">시간외근무</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                    </tr>
                    <tr align="center">
                        <td class="wtitle">총근무시간</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                        <td>0</td>
                    </tr>


               </table>
            </div>
			 
			
			  

        </div>
    </div>	

</body>
</html>