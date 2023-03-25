<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.t-area{height: 30px;}
	.title-area{float: left;}
	.title-area-enroll{float: left; padding-top: 5px; padding-left: 50px;}
	
	#switch-area{float: left; margin-left: 10px; /* margin-top: 6px; */}
	.search-option{background-color: lightgray; border-radius: 10px; padding: 6px; padding-left: 10px; margin-bottom: 10px;}
	/* 검색, 정렬, 필터 */
	.two-btn-area{float: right;}
	.two-btn{margin-left: 20px; margin-right: 10px; width: 32px;}
	.two-btn:hover, .as:hover, .titleTd:hover{cursor: pointer;}
	.btn-align{float: left;}
	
	/* 공통 */
	.btnn-pp{text-decoration: none; font-size: 14px; background-color: white; color: #6F50F8; border:1px solid #6F50F8; border-radius: 4px; padding: 4px; padding-left: 8px; padding-right: 8px;}
	.btnn-pp:hover{cursor: pointer; text-decoration: none; background-color: #6F50F8; color: white; transition: 0.3s;}
	.btnn-gr{text-decoration: none; font-size: 14px; background-color: white; color: gray; border:1px solid gray; border-radius: 4px; padding: 4px; padding-left: 8px; padding-right: 8px;}
    .btnn-gr:hover{cursor: pointer; text-decoration: none; background-color: gray; color: white; transition: 0.3s;}
    .btnn-pk{text-decoration: none; font-size: 14px; background-color: white; color: #fdbaba; border:1px solid #fdbaba; border-radius: 4px; padding: 4px; padding-left: 8px; padding-right: 8px;}
    .btnn-pk:hover{cursor: pointer; text-decoration: none; background-color: #fdbaba; color: white; transition: 0.3s;}
    .btnn-sb{text-decoration: none; font-size: 14px; background-color: white; color: #00b5d1; border:1px solid #00b5d1; border-radius: 4px; padding: 4px; padding-left: 8px; padding-right: 8px;}
    .btnn-sb:hover{cursor: pointer; text-decoration: none; background-color: #00b5d1; color: white; transition: 0.3s;}
    .btnn-rd{text-decoration: none; font-size: 14px; background-color: white; color: rgb(255, 100, 100); border:1px solid rgb(255, 100, 100); border-radius: 4px; padding: 4px; padding-left: 8px; padding-right: 8px;}
    .btnn-rd:hover{cursor: pointer; text-decoration: none; background-color: rgb(255, 100, 100); color: white; transition: 0.3s;}
    
    .stt-pp{border-radius: 5px; border: 1px solid #6F50F8; background-color: #6F50F8; color: white; padding-left: 4px; padding-right: 4px; margin-left: 15px;}
    .stt-gr{border-radius: 5px; border: 1px solid gray; background-color: gray; color: white; padding-left: 4px; padding-right: 4px; margin-left: 15px;}
    .stt-pk{border-radius: 5px; border: 1px solid #fdbaba; background-color: #fdbaba; color: white; padding-left: 4px; padding-right: 4px; margin-left: 15px;}
    .stt-sb{border-radius: 5px; border: 1px solid #00b5d1; background-color: #00b5d1; color: white; padding-left: 4px; padding-right: 4px; margin-left: 15px;}
    .stt-rd{border-radius: 5px; border: 1px solid rgb(255, 100, 100); background-color: rgb(255, 100, 100); color: white; padding-left: 4px; padding-right: 4px; margin-left: 15px;}
    
    .purple{background-color: #b09eff; color: white;}
	#tb{margin-top: 10px; margin-bottom: 7px; width: 100%; text-align: center;}
	#tb tr{height: 35px;}
	
	.del-btn-area{float: right;}
	
	#navigator{width:600px; height:40px; box-sizing:border-box;}
	#content ul{list-style-type:none;}
	#navi{padding:0; margin:0; width:100%; height:100%;}
	#navi>li{float:left; width:25%; /* height:100%; */}
	.menu{
		box-sizing:margin-box;
		color:gray;
		font-weight:900;
		width:100%;/*블럭요소*/
		height:100%;/*블럭요소*/
		display:block;
		line-height:35px;
	}
	.m-1{font-size:20px;}
	.m-2{font-size:18px;}
	.m-3{font-size:15px;}
	.m-small{height:20px;}
	#navi a{text-decoration:none;}
	#navi a:hover{color:black;}
	#navi>li>ul{padding:0; margin:0; display:none;}
	#navi>li:hover>ul{display:block; background-color:white;}
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
		
			<!-- 개인 문서함 _ 기안 문서함 _ 진행중일 경우-->
			<div class="custom-control custom-switch" id="switch-area" style="display: none;">
			    <input type="checkbox" class="custom-control-input" id="switch1" onclick="switchBox();">
			    <label class="custom-control-label" for="switch1">승인필요</label>
		    </div>
		    
			<!-- 검색일 경우 -->
		    <div class="search-option-area" style="display:none;"><span class="search-option">[검색조건?] : 검색어?</span> 에 대한 검색결과 총 <b>10</b>건</div>
	    
		    <div class="two-btn-area">
		    	<div class="btn-align" id="search-input" style="display: none;">
		    		<select id="selop-pp">
		    			<option>선택안함</option>
		    			<option>문서번호</option>
		    			<option>양식</option>
		    			<option>조회기간</option>
		    			<option>작성자</option>
		    			<option>승인자</option>
		    			<option>참조자</option>
		    		</select>
			    	<input type="hidden" name="search-op" value="">
			    	<input type="text" name="keyword">
			    	<button class="btnn-sb">검색</button>
				</div>
				<div class="btn-align">
				<img src="resources/icons/search.png" class="two-btn" onclick="selectHow(0);">
				</div>
				<div class="dropdown btn-align">
					<img src="resources/icons/dots.png" class="dropdown-toggle two-btn" data-toggle="dropdown">
		    		<div class="dropdown-menu">
		    			<a class="dropdown-item" href="">최근 업데이트 순</a>
		    			<a class="dropdown-item" href="">작성일 순</a>
		    			<a class="dropdown-item" href="">오름차 순</a>
		    			<a class="dropdown-item" href="">내림차 순</a>
		    		</div>
				</div>
	    	</div>

    		<br clear="both">
    
		</div>
		
	<!-- div 닫는 구문 하나 없음 -->
	
	<script>
	function selectHow(n){
	    if(document.getElementById("search-input").style.display == "block"){
	        document.getElementById("search-input").style.display = "none";
	    }else{
	        document.getElementById("search-input").style.display = "block";
	    }
	
	    if(n == 0){
	        
	    }else if(n == 1){
	
	    }
	}
	</script>
</body>
</html>