<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.title-area{float: left;}
	.title-area-enroll{float: left; padding-top: 5px; padding-left: 50px;}
	
	.menu{float: left; margin: 0px 40px 10px 10px;}
	.menu a{text-decoration: none;}
	.menu h4, .menu h5, .menu h6{color: black;}
	.menu h4:hover, .menu h5:hover, .menu h6:hover{font-weight:600; color: #6F50F8;}

	.switch-area{float: left; margin-left: 10px; margin-top: 10px;}
	.search-option{background-color: lightgray; border-radius: 10px; padding: 6px; padding-left: 10px; margin-bottom: 10px;}
	/* 검색, 정렬, 필터 */
	.two-btn-area{float: right;}
	.two-btn{padding-left: 30px; font-size: 23px;}
	.btn-align{float: left;}
	
	/* 공통 */
	.btnn-pp{text-decoration: none; font-size: 14px; background-color: white; color: #6F50F8; border:1px solid #6F50F8; border-radius: 4px; padding: 4px; padding-left: 8px; padding-right: 8px;}
	.btnn-pp:hover{text-decoration: none; background-color: #6F50F8; color: white; transition: 0.3s;}
	.btnn-gr{text-decoration: none; font-size: 14px; background-color: white; color: gray; border:1px solid gray; border-radius: 4px; padding: 4px; padding-left: 8px; padding-right: 8px;}
    .btnn-gr:hover{text-decoration: none; background-color: gray; color: white; transition: 0.3s;}
    .btnn-pk{text-decoration: none; font-size: 14px; background-color: white; color: #fdbaba; border:1px solid #fdbaba; border-radius: 4px; padding: 4px; padding-left: 8px; padding-right: 8px;}
    .btnn-pk:hover{text-decoration: none; background-color: #fdbaba; color: white; transition: 0.3s;}
    .btnn-sb{text-decoration: none; font-size: 14px; background-color: white; color: #00b5d1; border:1px solid #00b5d1; border-radius: 4px; padding: 4px; padding-left: 8px; padding-right: 8px;}
    .btnn-sb:hover{text-decoration: none; background-color: #00b5d1; color: white; transition: 0.3s;}
    .btnn-rd{text-decoration: none; font-size: 14px; background-color: white; color: rgb(255, 100, 100); border:1px solid rgb(255, 100, 100); border-radius: 4px; padding: 4px; padding-left: 8px; padding-right: 8px;}
    .btnn-rd:hover{text-decoration: none; background-color: rgb(255, 100, 100); color: white; transition: 0.3s;}
    #selop-pp{color: black; border:1px solid gray; border-radius: 4px; padding: 2px; padding-right: 0px;}
    
    .purple{background-color: #6F50F8; color: white;}
	#tb{margin-top: 10px; width: 100%; text-align: center;}
	#tb tr{height: 35px;}
	
	.del-btn-area{float: right;}
</style>
</head>
<body>
	<div id="content">
		<div class="content-1">
	    	<br>
	    	<div class="title-area"><h2><b>전자결재</b></h2></div>
	
		    <div class="title-area-enroll"><button class="btnn-pp">+ 작성하기</button></div>    
			<br clear="both"><br>
			
			<div class="menu"><a href=""><h4>개인 문서함</h4></a></div>
			<div class="menu"><a href=""><h4>부서 문서함</h4></a></div>
			
			<!-- if관리자일 경우 -->
			<div class="menu"><a href=""><h4>전체 문서 관리</h4></a></div>
			<div class="menu"><a href=""><h4>삭제 문서 관리</h4></a></div>
			
			<br clear="both">
			
			<!-- if개인 문서함일 경우 -->
			<div class="menu"><a href=""><h5>기안 문서함</h5></a></div>
			<div class="menu"><a href=""><h5>참조 문서함</h5></a></div>
			<div class="menu"><a href=""><h5>중요</h5></a></div>
			
			<br clear="both">
			
			<!-- when개인 문서함 _ 기안 문서함일 경우-->
			<div class="menu"><a href=""><h6>진행중</h6></a></div>
			<div class="menu"><a href=""><h6>완료</h6></a></div>
			<div class="menu"><a href=""><h6>임시저장</h6></a></div>
			
			<!-- when부서 문서함일 경우 -->
			<div class="menu"><a href=""><h6>진행중</h6></a></div>
			<div class="menu"><a href=""><h6>완료</h6></a></div>
			
			<br clear="both">
		
			<!-- if개인 문서함 _ 기안 문서함 _ 진행중일 경우-->
			<div class="custom-control custom-switch switch-area">
			    <input type="checkbox" class="custom-control-input" id="switch1">
			    <label class="custom-control-label" for="switch1">승인필요</label>
		    </div>
		    
			<!-- if검색일 경우 -->
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
			    	<button class="btnn-gr">검색</button>
				</div>
				<div class="btn-align">
		   			<span class="two-btn" onclick="selectHow(0);">🔍</span>
				</div>
				<div class="dropdown btn-align">
		    		<span class="dropdown-toggle two-btn" data-toggle="dropdown">🗂</span>
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