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
		/* height:100%; */
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
	.m-1{
		font-size:20px;
	}
	.m-2{
		font-size:18px;
	}
	.m-3{
		font-size:15px;
	}
	.m-small{
		height:20px;
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
</style>
</head>
<body>
	<div id="content" style="position: relative; z-index: 1;">
		<div class="content-1">
			<div class="t-area">
		    	<div class="title-area"><h2><b>전자결재</b></h2></div>
			    <div class="title-area-enroll"><button type="button" class="btnn-pp" onclick="location.href='enrollForm.ap?form=0';">+ 작성하기</button></div>    
			</div>
			<br clear="both">
			<div id="navigator">
				<ul id="navi">
					<li><span class="menu m-1">개인문서함</span>
						<ul style="position: relative; z-index: 2;">
							<li class="m-small"><span class="menu m-2">기안문서함</span>
								<li class="m-small"><a href="list.ap?myi=1" class="menu m-3">진행중</a></li>
								<li class="m-small"><a href="list.ap?mye=1" class="menu m-3">완료</a></li>
								<li><a href="list.ap?myt=1" class="menu m-3">임시저장</a></li>
							</li>
							<li><a href="list.ap?myr=1" class="menu m-2">참조문서함</a></li>
							<li><a href="list.ap?myb=1" class="menu m-2">중요</a></li>
						</ul>
					</li>
					<li><span class="menu m-1">부서문서함</span>
						<ul style="position: relative; z-index: 2;">
							<li><a href="list.ap?dpi=1" class="menu m-2">진행중</a></li>
							<li><a href="list.ap?dpe=1" class="menu m-2">완료</a></li>
						</ul>
					</li>
					<li><a href="list.ap?a=1" class="menu m-1">전체문서관리</a></li>
					<li><a href="list.ap?d=1" class="menu m-1">삭제문서관리</a></li>
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
										<input type="radio" name="period" id="week" onclick="inputDate();"> <label for="week">1주일&nbsp;</label>
										<input type="radio" name="period" id="month" onclick="inputDate();"> <label for="month">1개월&nbsp;</label>
										<input type="radio" name="period" id="three-month" onclick="inputDate();"> <label for="three-month">3개월&nbsp;</label>
										<input type="radio" name="period" id="myself" onclick="inputDate();"> <label for="myself">직접입력</label>
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
										<input type="date" name="createDate"> ~ <input type="date" name="completeDate">
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
										<input type="radio" name="orderBy" id="asc"> <label for="asc">최신순&nbsp;&nbsp;</label>
										<input type="radio" name="orderBy" id="desc"> <label for="desc">오래된순&nbsp;&nbsp;</label>
										<input type="radio" name="orderBy" id="com"> <label for="com">기안완료순</label>
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
	
	<script>
		function searchDiv(){
			if(document.getElementById("search-input").style.display == "block"){
				document.getElementById("search-input").style.display = "none";
			}else{
				document.getElementById("search-input").style.display = "block";
			}
		}

		function inputDate(){
			let myselfRadio = document.getElementById("myself");
			if(myselfRadio.checked == true){
				document.getElementById("inputTr").style = "width: 100%; display:block";
			}else{
				document.getElementById("inputTr").style = "width: 100%; display:none";
			}
		}
	</script>
</body>
</html>