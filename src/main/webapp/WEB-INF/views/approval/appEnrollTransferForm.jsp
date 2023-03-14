<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PPIC</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<style>
	.second-1, .second-2{box-sizing: border-box; float: left;}

    .title-area{float: left;}
    #title-area-selop{float: left; margin-top: 5px; margin-left: 50px;}
    #selop-pp{color: #6F50F8; border:1px solid #6F50F8; border-radius: 4px; padding: 4px; padding-right: 0px;}
    
    .second-1{width: 75%;}
    .form-area{padding: 30px;}
    #tb{width:100%; text-align: center;}
    #tb tr{height:40px;}
    .add-btn-area{float: left;}
    .btnn-pp{font-size: 14px; background-color: white; color: #6F50F8; border:1px solid #6F50F8; border-radius: 4px; padding: 4px; padding-left: 8px; padding-right: 8px;}
    .btnn-pp:hover{background-color: #6F50F8; color: white; transition: 0.3s;}
    
    .second-2{width: 25%;}
    .agree-area{margin-top: 6px; border: 1px solid lightgray;}
    .line{width: 80%;}
    .line-content{text-align: left;}
    .person-title{float: left; width: 80px;}
    .plus{cursor: pointer;}
    .level{padding-left: 10px;}
    .level-person{margin-bottom: 30px;}
	.person-img{font-size: x-large;}
	
    .btnn-gr{font-size: 14px; background-color: white; color: gray; border:1px solid gray; border-radius: 4px; padding: 4px; padding-left: 8px; padding-right: 8px;}
    .btnn-gr:hover{background-color: gray; color: white; transition: 0.3s;}
    .btnn-pk{font-size: 14px; background-color: white; color: #fdbaba; border:1px solid #fdbaba; border-radius: 4px; padding: 4px; padding-left: 8px; padding-right: 8px;}
    .btnn-pk:hover{background-color: #fdbaba; color: white; transition: 0.3s;}
    .btnn-sb{font-size: 14px; background-color: white; color: #00b5d1; border:1px solid #00b5d1; border-radius: 4px; padding: 4px; padding-left: 8px; padding-right: 8px;}
    .btnn-sb:hover{background-color: #00b5d1; color: white; transition: 0.3s;}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<script>
		window.onload = function(){
			/* 작성일 */
			date = new Date();
			year = date.getFullYear();
			month = date.getMonth() + 1;
			if(month < 10){
				month = "0" + month;
			}
			day = date.getDate();
			if(day < 10){
				day = "0" + day;
			}
			document.getElementById("current-date").innerHTML = year + "-" + month + "-" + day;
		}
	</script>
	
	<div id="content" align="center">
        <div class="first">
            <div class="title-area"><h2><b>작성하기</b></h2></div>
            <div id="title-area-selop">
	            <button type="button" class="btn btn-primary dropdown-toggle btn-sm" data-toggle="dropdown" style="width:130px; background-color:#6F50F8; border:0px;">
	              인사발령품의서
	            </button>
	            <div class="dropdown-menu">
	              <a class="dropdown-item" href="enrollDraftForm.ap">업무기안</a>
	              <a class="dropdown-item" href="enrollTransferForm.ap">인사발령품의서</a>
	              <a class="dropdown-item" href="enrollConsumeForm.ap">비품신청서</a>
	              <a class="dropdown-item" href="enrollCashForm.ap">지출결의서</a>
	            </div>
            </div>
        </div>
        <br clear="both">

        <div class="second">
            <div class="second-1">
                <div class="form-area">
                    <table id="tb" class="table-bordered">
                        <thead>
                            <tr>
                                <th colspan="4"><br><h2><b>인사발령품의서</b></h2><br></th>
                            </tr>
                            <tr>
                                <th width="20%">작성일</th>
                                <td width="20%" id="current-date"></td>
                                <th width="20%">완료일</th>
                                <td width="40%">기안 완료시 자동으로 생성됩니다.</td>
                            </tr>
                            <tr>
                                <th>부서</th>
                                <td>?</td>
                                <th>문서번호</th>
                                <td>기안 완료시 자동으로 생성됩니다.</td>
                            </tr>
                            <tr>
                                <th>직급</th>
                                <td>?</td>
                                <th>작성자</th>
                                <td>?</td>
                            </tr>
                            <tr>
                                <th>제목</th>
                                <td colspan="3"><input type="text" id="title" style="width:770px; height:35px;" required></td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="4">

                                    <!-- 인사발령품의서일 경우 -->
                                    <table id="tb" class="table-bordered">
                                        <colgroup>
				                    		<col style="width:15%">
				                    		<col style="width:5%">
				                    		<col style="width:10%">
				                    		<col style="width:15%">
				                    		<col style="width:15%">
				                    		<col style="width:40%">
				                    	</colgroup>
				                    	<tr>
				                            <th colspan="2" width="40%">시행일자</th>
				                            <td colspan="4" width="60%" align="left"><input type="date" style="width:190px; height:35px;"></td>
				                        </tr>
				                        <tr>
				                            <th width="15%">부서</th>
				                            <th colspan="2" width="15%">성명</th>
				                            <th width="15%">현직급</th>
				                            <th width="15%">변경직급</th>
				                            <th width="40%">비고</th>
				                        </tr>

                                        <!-- 사원 추가할 경우-->
                                        <div class="add-btn-area"><button class="btnn-pp">+ 사원추가</button></div>
                                        <br clear="both">
                                        
                                        <!-- forEach -->
                                        <tr class="member-tr">
                                            <td><div style="display:none;float:left;">x</div>?추가시 저절로</td>
                                            <td colspan="2">?추가시 저절로</td>
                                            <td>?추가시 저절로</td>
                                            <td>
                                            	<select style="width:140px; height:35px;">
                                            		<option>변경직급을 선택하세요</option>
                                            		
                                            		<!-- forEach -->
                                            		<option>직급 불러오기</option>
                                            		
                                            	</select>
											</td>
                                            <td>
                                            	<input type="text" style="width:380px; height:35px;">
                                            </td>
                                        </tr>
                                    </table>
                                    
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="custom-file">
                        <input type="file" class="custom-file-input" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>드래그앤드랍..
                    </div>
                </div>
    
            </div>
            
            <br>
            <div class="second-2">
                <div class="agree-area">
                    <br>
                    <h4><b>승인ㆍ참조</b></h4>
                    <br>

                    <div class="line">
                        <div class="line-content">
                            <div class="person-title"><h5><b>승인자</b></h5></div>
                            <i class="fas fa-plus plus" data-toggle="modal" data-target="#myModal"></i>
                            <br clear="both">

                            <!-- forEach -->
                            <div class="level"><h6><b>1단계</b></h6></div>
                            <div class="level-person">
                                <span class="person-img">🧑🏻💻</span>‍
                                인사부 문승하 대리
                            </div>

                            <div class="person-title"><h5><b>참조자</b></h5></div>
                            <i class="fas fa-plus plus" data-toggle="modal" data-target="#myModal"></i>
                            <br clear="both">
                        </div>
                        <br>
                    </div>
                    
                    <!-- 승인, 참조 사원 선택 모달 시작 -->
                    <div class="modal" id="myModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                        
                                <!-- Modal Header -->
                                <div class="modal-header">
                                <h4 class="modal-title"></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                        
                                <!-- Modal body -->
                                <div class="modal-body">
                                    <div class="m-outer">
                                        <div class="m-content">
                                            <input type="text">
                                            <button class="btnn-sb">검색</button>
                                            <div class="m-mem-list"></div>
                                        </div>
                                        <div class="m-footer">
                                            <button class="btnn-gr">취소</button>
                                            <button class="btnn-pp">확인</button>
                                        </div>
                                    </div>
                                </div>
                        
                            </div>
                        </div>
                    </div>
                    <!-- 승인, 참조 사원 선택 모달 종료-->

                </div>
            </div>

            <br clear="both">
            
            <button class="btnn-gr" onclick="location.href='list.ap?myi=1';">취소</button>
            <button class="btnn-pk">임시저장</button>
            <button class="btnn-pp">작성</button><!-- 작성완료시 상세로 -->
        </div>
    </div>

</body>
</html>