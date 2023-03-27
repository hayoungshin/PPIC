<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 전자결재 작성하기 button */
	.t-area{
		height: 30px;
	}
	.title-area{
		float: left;
	}
	.title-area-enroll{
		float: left; 
		padding-top: 5px; 
		padding-left: 50px;
	}
	
	/* 문서함 종류 */
	#menu-area{
		float: left; 
		font-size:13px; 
		margin-top:4px;
	}
	
	/* 승인 switch, 검색 */
	.two-btn-area{
		float: right;
	}
	#switch-area{
		margin-top: 4px;
	}
	.search-btn{
		margin-left: 20px;
		margin-right: 10px; 
		width: 32px;
	}
	#search-input{
		background-color: white; 
		border: 1px solid lightgray;
		border-radius: 5px; 
		padding: 20px;
		width: 400px;
	}
	#radio-td{
		vertical-align: bottom;
	}
	.search-btn:hover, .as:hover, .titleTd:hover{
		cursor: pointer;
	}
	.btn-align{
		float: left;
	}
	
	/* menu */
	#navigator{
		width:600px; 
		height:40px; 
		box-sizing:border-box;
	}
	#content ul{
		list-style-type:none;
	}
	#navi{
		padding:0;
		margin:0; 
		width:100%; 
		height:100%;
	}
	#navi>li{
		float:left; 
		width:25%; 
		height:100%;
		transform:scale(1);
	}
	.menu{
		box-sizing:margin-box;
		color:gray;
		font-weight:900;
		width:100%;
		height:100%;
		display:block;
		line-height:35px;
	}
	.menu-1{
		font-size:20px;
	}
	.menu-2{
		font-size:18px;
	}
	.menu-3{
		font-size:15px;
	}
	.menu-small{
		height:30px;
	}
	#navi a{
		text-decoration:none;
	}
	#navi a:hover{
		color:black;
	}
	#navi>li>ul{
		padding:0; 
		margin:0; 
		display:none;
	}
	#navi>li:hover>ul{
		display:block; 
		background-color:white;
		border: 1px solid lightgray;
		border-radius: 5px;
	}
	
	/* 공통 */
	/* button */
	.btnn-pp{
		text-decoration: none; 
		font-size: 14px; 
		background-color: white; 
		color: #6F50F8; 
		border:1px solid #6F50F8; 
		border-radius: 4px; 
		padding: 4px; 
		padding-left: 8px; 
		padding-right: 8px;
	}
	.btnn-pp:hover{
		cursor: pointer; 
		text-decoration: none; 
		background-color: #6F50F8; 
		color: white; 
		transition: 0.3s;
	}
	.btnn-gr{
		text-decoration: none; 
		font-size: 14px; 
		background-color: white; 
		color: gray; 
		border:1px solid gray; 
		border-radius: 4px; 
		padding: 4px; 
		padding-left: 8px; 
		padding-right: 8px;
	}
    .btnn-gr:hover{
		cursor: pointer; 
		text-decoration: none; 
		background-color: gray; 
		color: white; 
		transition: 0.3s;
	}
    .btnn-pk{
		text-decoration: none; 
		font-size: 14px; 
		background-color: white; 
		color: #fdbaba; 
		border:1px solid #fdbaba; 
		border-radius: 4px; 
		padding: 4px; 
		padding-left: 8px; 
		padding-right: 8px;
	}
    .btnn-pk:hover{
		cursor: pointer; 
		text-decoration: none; 
		background-color: #fdbaba; 
		color: white; 
		transition: 0.3s;
	}
    .btnn-sb{
		text-decoration: none; 
		font-size: 14px; 
		background-color: white; 
		color: #00b5d1; 
		border:1px solid #00b5d1; 
		border-radius: 4px; 
		padding: 4px; 
		padding-left: 8px; 
		padding-right: 8px;
	}
    .btnn-sb:hover{
		cursor: pointer; 
		text-decoration: none; 
		background-color: #00b5d1; 
		color: white; 
		transition: 0.3s;
	}
    .btnn-rd{
		text-decoration: none; 
		font-size: 14px; 
		background-color: white; 
		color: rgb(255, 100, 100); 
		border:1px solid rgb(255, 100, 100); 
		border-radius: 4px; 
		padding: 4px; 
		padding-left: 8px; 
		padding-right: 8px;
	}
    .btnn-rd:hover{
		cursor: pointer; 
		text-decoration: none; 
		background-color: rgb(255, 100, 100); 
		color: white; 
		transition: 0.3s;
	}
    
	/* status */
    .stt-pp{
		border-radius: 5px; 
		border: 1px solid #6F50F8; 
		background-color: #6F50F8; 
		color: white; 
		padding-left: 4px; 
		padding-right: 4px; 
		margin-left: 15px;
	}
    .stt-gr{
		border-radius: 5px; 
		border: 1px solid gray; 
		background-color: gray; 
		color: white; 
		padding-left: 4px; 
		padding-right: 4px; 
		margin-left: 15px;
	}
    .stt-pk{
		border-radius: 5px; 
		border: 1px solid #fdbaba; 
		background-color: #fdbaba; 
		color: white; 
		padding-left: 4px; 
		padding-right: 4px; 
		margin-left: 15px;
	}
    .stt-sb{
		border-radius: 5px; 
		border: 1px solid #00b5d1; 
		background-color: #00b5d1; 
		color: white; 
		padding-left: 4px; 
		padding-right: 4px; 
		margin-left: 15px;
	}
    .stt-rd{
		border-radius: 5px; 
		border: 1px solid rgb(255, 100, 100); 
		background-color: rgb(255, 100, 100); 
		color: white; 
		padding-left: 4px; 
		padding-right: 4px; 
		margin-left: 15px;
	}
    
    /* 조회 table */
	.purple{
		background-color: #b09eff; 
		color: white;
	}
	#tb{
		margin-top: 10px; 
		margin-bottom: 7px; 
		width: 100%; 
		text-align: center;
	}
	#tb tr{
		height: 35px;
	}

	/* 선택 삭제 button */
	.del-btn-area{
		float: right;
	}

	/* z-index */
	.content-1{
		position: relative;
		z-index: 2;
	}
	.content-2{
		position: relative;
		z-index: 1;
	}
</style>
</head>
<body>
	<script>
		// search div block
		function searchDiv(){
			if(document.getElementById("search-input").style.display == "block"){
				document.getElementById("search-input").style.display = "none";
			}else{
				document.getElementById("search-input").style.display = "block";
			}
		}

		// input date block
		function inputDate(){
			let myselfRadio = document.getElementById("myself");
			if(myselfRadio.checked == true){
				document.getElementById("inputTr").style = "width: 100%; display:block";
			}else{
				document.getElementById("inputTr").style = "width: 100%; display:none";
			}
		}
		
		$(function(){
			// 기간 선택 end max
			let now_utc = Date.now(); // 지금 날짜를 밀리초로 가져옴
			// getTimezoneOffset()은 현재 시간과의 차이를 분단위로 반환
			let timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
			// new Date(now_utc-timeOff).toISOString()은 '2023-03-20T18:09:38.134z'를 반환
			let today = new Date(now_utc-timeOff).toISOString().split("T")[0];
			document.getElementById("end").setAttribute("max", '2023-03-27');
		});
		
		// 기간 선택 입력 start max
		function startMax(){
			$("#start").attr("max", $("#end").val());
		}
	
		// 기간 선택 입력 end min
		function endMin(){
			$("#end").attr("min", $("#start").val());
		}
	</script>
	
	<div id="content">
		<div class="content-1">
			<div class="t-area">
		    	<div class="title-area"><h2><b>전자결재</b></h2></div>
			    <div class="title-area-enroll"><button type="button" class="btnn-pp" onclick="location.href='enrollForm.ap?form=0';">+ 작성하기</button></div>    
			</div>
			<br clear="both">
			<div id="navigator">
				<ul id="navi">
					<li><span class="menu menu-1">개인문서함</span>
						<ul>
							<li class="menu-small"><span class="menu menu-2">&nbsp;기안문서함</span>
								<li class="menu-small"><a href="list.ap?myi=1" class="menu menu-3">&nbsp;&nbsp;&nbsp;진행중</a></li>
								<li class="menu-small"><a href="list.ap?mye=1" class="menu menu-3">&nbsp;&nbsp;&nbsp;완료</a></li>
								<li><a href="list.ap?myt=1" class="menu menu-3">&nbsp;&nbsp;&nbsp;임시저장</a></li>
							</li>
							<li><a href="list.ap?myr=1" class="menu menu-2">&nbsp;참조문서함</a></li>
							<li><a href="list.ap?myb=1" class="menu menu-2">&nbsp;중요</a></li>
						</ul>
					</li>
					<li><span class="menu menu-1">부서문서함</span>
						<ul>
							<li><a href="list.ap?dpi=1" class="menu menu-2">&nbsp;진행중</a></li>
							<li><a href="list.ap?dpe=1" class="menu menu-2">&nbsp;완료</a></li>
						</ul>
					</li>
					<li><a href="list.ap?a=1" class="menu menu-1">전체문서관리</a></li>
					<li><a href="list.ap?d=1" class="menu menu-1">삭제문서관리</a></li>
				</ul>
			</div>

			<br>
		
			<div id="menu-area"></div>
			    
			<div class="two-btn-area">
		    	<!-- 승인필요 button -->
				<div class="custom-control custom-switch btn-align" id="switch-area" style="display: none;">
					<input type="checkbox" class="custom-control-input" id="switch1" onclick="switchBox();">
					<label class="custom-control-label" for="switch1">승인필요</label>
				</div>
				<!-- 검색 div -->
				<div class="btn-align" style="position:relative;">
					<img src="resources/icons/search.png" class="search-btn" onclick="searchDiv();">
					<div id="search-input" style="position:absolute; top:40px; left:-350px; display:none;">
						<form action="search.ap">
							<span style="font-size: 20px; font-weight: 700;">검색</span>
							<table style="width:100%;">
								<colgroup>
									<col style="width:20%;">
									<col style="width:80%;">
								</colgroup>

								<tr height="40px">
									<td>작성자</td>
									<td><input type="text" name="userName"></td>
								</tr>
								<tr height="40px">
									<td>양식</td>
									<td>
										<select name="form" style="height:30px">
											<option>선택안함</option>
											<option>업무기안</option>
											<option>인사발령품의서</option>
											<option>비품신청서</option>
											<option>지출결의서</option>
										</select>
									</td>
								</tr>
								<tr height="40px">
									<td>제목</td>
									<td><input type="text" name="title"></td>
								</tr>
								<tr height="40px">
									<td>승인자</td>
									<td><input type="text" name="agrUserName"></td>
								</tr>
								<tr height="40px">
									<td>참조자</td>
									<td><input type="text" name="refUserName"></td>
								</tr>
								<tr height="40px">
									<td>문서번호</td>
									<td><input type="text" name="completeNo"></td>
								</tr>
								<tr height="40px">
									<td>기간</td>
									<td id="radio-td">
										<input type="radio" name="period" value="all" id="all" onclick="inputDate();" checked> <label for="all">전체&nbsp;</label>
										<input type="radio" name="period" value="week" id="week" onclick="inputDate();"> <label for="week">1주일&nbsp;</label>
										<input type="radio" name="period" value="three-month" id="three-month" onclick="inputDate();"> <label for="three-month">3개월&nbsp;</label>
										<input type="radio" name="period" value="myself" id="myself" onclick="inputDate();"> <label for="myself">직접입력</label>
									</td>
								</tr>
							</table>
							<table id="inputTr" style="width:100%; display:none;">
								<colgroup>
									<col style="width:20%;">
									<col style="width:80%;">
								</colgroup>

								<tr height="40px">
									<td><!-- 빈칸 --></td>
									<td>
										<input type="date" name="createDate" id="start" onchange="endMin();">
										~
										<input type="date" name="completeDate" id="end" onchange="startMax();">
									</td>
								</tr>
							</table>
							<table style="width:100%;">
								<colgroup>
									<col style="width:20%;">
									<col style="width:80%;">
								</colgroup>

								<tr height="40px">
									<td>정렬</td>
									<td id="radio-td">
										<input type="radio" name="orderBy" value="desc" id="desc" checked> <label for="desc">최신순&nbsp;&nbsp;</label>
										<input type="radio" name="orderBy" value="asc" id="asc"> <label for="asc">오래된순&nbsp;&nbsp;</label>
										<input type="radio" name="orderBy" value="complete" id="complete"> <label for="complete">기안완료순</label>
									</td>
								</tr>
							</table>
							<br>
							<button class="btnn-sb two-btn-area">검색</button>
						</form>
					</div>
				</div>
	    	</div>

    		<br clear="both">
    
		</div>
		
	<!-- div 닫는 구문 하나 없음 -->
</body>
</html>