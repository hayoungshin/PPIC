<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 /* 출퇴근 기록 */
	 .workRecord{
		position: absolute;
        right:0px;
        top: 50px;
	 }
	 #workRecord {
	 	background:rgb(236, 236, 236);
	 	width:400px;
	 	height:250px;
		padding: 10px;
		border-radius: 10px;
	 }
	 #workInfo{ 
		font-size:18px;
		margin-bottom:15px;
	 }
	 #work img{width:80px; height:80px;}
	 #worktag{
		background:white; 
		width:60px; 
		height:25px;
		padding-top:2px;
		padding-left:7px;
		border-radius: 5px;
		font-size: 15px;
	 }
</style>
</head>	
<body>

<jsp:include page="../common/menubar.jsp" />
	
	<div class="outer">
        <div id="content" >

            <!-- 출퇴근 기록 -->
			<div class="workRecord" >
				<div><h4 style="font-weight:bold">근무체크</h4></div>
				<div id="workRecord">
					<table id="workInfo" >
						<tr>
							<th colspan="2">00월 00일(0)</th>
						</tr>
						<tr>
							<th width="130" >00:00:00</th>
							<th><div id="worktag">근무중</div></th>
						</tr>
					</table>
					<table id="work"  align="center">
						<tr align="center">
							<td width="150px" height="100" >
								<img src="resources/icons/working.png" >
							</td>
							<td width="150px" >
								<img src="resources/icons/office-chair.png">
							</td>
						</tr>
						<tr align="center">
							<td>출근하기</td>
							<td>퇴근하기</td>
						</tr>
						<tr align="center">
							<td>00:00:00</td>
							<td>00:00:00</td>
						</tr>
					</table> 
				</div>
			</div>

        </div>
    </div>

    

</body>
</html>


