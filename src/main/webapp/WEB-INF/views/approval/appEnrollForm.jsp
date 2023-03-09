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
    .add-btn-area{float: right;}
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
			const title_selop = document.getElementById("selop-pp");
			const form = document.getElementById("form");
			title_selop.addEventListener("change", function(){
				const title_selop_value = title_selop.options[title_selop.selectedIndex].value;
				switch(title_selop_value){
				case '결재양식' :
					form.innerText = '결재양식을 선택하세요';
					
					document.getElementById("draft").style = 'display:none';
					document.getElementById("transfer").style = 'display:none';
					document.getElementById("transfer-btn").style = 'display:none';
					document.getElementById("transfer-br").style = 'display:none';
					document.getElementById("consume").style = 'display:none';
					document.getElementById("consume-btn").style = 'display:none';
					document.getElementById("consume-br").style = 'display:none';
					document.getElementById("cash").style = 'display:none';
					document.getElementById("cash-btn").style = 'display:none';
					document.getElementById("cash-br").style = 'display:none';
					break;
				case '업무기안' :
					form.innerText = '업무기안';
					document.getElementById("draft").style = 'display:block';
					document.getElementById("draft").style = 'width:100%';
					
					document.getElementById("transfer").style = 'display:none';
					document.getElementById("transfer-btn").style = 'display:none';
					document.getElementById("transfer-br").style = 'display:none';
					document.getElementById("consume").style = 'display:none';
					document.getElementById("consume-btn").style = 'display:none';
					document.getElementById("consume-br").style = 'display:none';
					document.getElementById("cash").style = 'display:none';
					document.getElementById("cash-btn").style = 'display:none';
					document.getElementById("cash-br").style = 'display:none';
					break;
				case '인사발령품의서' :
					form.innerText = '인사발령품의서';
					document.getElementById("transfer").style = 'display:block';
					document.getElementById("transfer").style = 'width:100%';
					document.getElementById("transfer-btn").style = 'display:block';
					document.getElementById("transfer-br").style = 'display:block';
					
					document.getElementById("draft").style = 'display:none';
					document.getElementById("consume").style = 'display:none';
					document.getElementById("consume-btn").style = 'display:none';
					document.getElementById("consume-br").style = 'display:none';
					document.getElementById("cash").style = 'display:none';
					document.getElementById("cash-btn").style = 'display:none';
					document.getElementById("cash-br").style = 'display:none';
					break;
				case '비품신청서' :
					form.innerText = '비품신청서';
					document.getElementById("consume").style = 'display:block';
					document.getElementById("consume").style = 'width:100%';
					document.getElementById("consume-btn").style = 'display:block';
					document.getElementById("consume-br").style = 'display:block';
					
					document.getElementById("draft").style = 'display:none';
					document.getElementById("transfer").style = 'display:none';
					document.getElementById("transfer-btn").style = 'display:none';
					document.getElementById("transfer-br").style = 'display:none';
					document.getElementById("cash").style = 'display:none';
					document.getElementById("cash-btn").style = 'display:none';
					document.getElementById("cash-br").style = 'display:none';
					break;
				case '지출결의서' :
					form.innerText = '지출결의서';
					document.getElementById("cash").style = 'display:block';
					document.getElementById("cash").style = 'width:100%';
					document.getElementById("cash-btn").style = 'display:block';
					document.getElementById("cash-br").style = 'display:block';
					
					document.getElementById("draft").style = 'display:none';
					document.getElementById("transfer").style = 'display:none';
					document.getElementById("transfer-btn").style = 'display:none';
					document.getElementById("transfer-br").style = 'display:none';
					document.getElementById("consume").style = 'display:none';
					document.getElementById("consume-btn").style = 'display:none';
					document.getElementById("consume-br").style = 'display:none';
					break;
				}
			});
		}
	</script>
	
	<div id="content" align="center">
        <div class="first">
            <div class="title-area"><h2><b>작성하기</b></h2></div>
            <div id="title-area-selop">
                <select id="selop-pp">
                    <option selected>결재양식</option>
                    <option>업무기안</option>
                    <option>인사발령품의서</option>
                    <option>비품신청서</option>
                    <option>지출결의서</option>
                </select>
            </div>
        </div>
        <br clear="both">

        <div class="second">
            <div class="second-1">
                <div class="form-area">
                    <table id="tb" class="table-bordered">
                        <thead>
                            <tr>
                                <th colspan="4"><br><h2><b id="form">결재양식을 선택하세요</b></h2><br></th>
                            </tr>
                            <tr>
                                <th>작성일</th>
                                <td>?</td>
                                <th>완료일</th>
                                <td>?</td>
                            </tr>
                            <tr>
                                <th>부서</th>
                                <td>?</td>
                                <th>문서번호</th>
                                <td>?</td>
                            </tr>
                            <tr>
                                <th>직급</th>
                                <td>?</td>
                                <th>작성자</th>
                                <td>?</td>
                            </tr>
                            <tr>
                                <th>제목</th>
                                <td colspan="3">?</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="4">

                                    <!-- 업무기안일 경우 -->
                                    <table id="draft" class="table-bordered" style="display: none;">
                                        <tr>
                                            <th>시행일자</th>
                                            <td><input type="">캘린더</td>
                                            <th>협조부서</th>
                                            <td>셀렉옵션 부서장 (부서장이 결재자가 아닐경우 부서장에게 바로 참조걸기)</td>
                                        </tr>
                                        <tr>
                                            <th colspan="4">내용</th>
                                        </tr>
                                        <tr>
                                            <td colspan="4">썸머노트api</td>
                                        </tr>
                                    </table>

                                    <!-- 인사발령품의서일 경우 -->
                                    <table id="transfer" class="table-bordered" style="display: none;">
                                        <tr>
                                            <th colspan="2">시행일자</th>
                                            <td colspan="3"><input type="">캘린더</td>
                                        </tr>
                                        <tr>
                                            <th>부서</th>
                                            <th>성명</th>
                                            <th>현직급</th>
                                            <th>변경직급</th>
                                            <th>비고</th>
                                        </tr>

                                        <!-- 사원 선택할 경우-->
                                        <div id="transfer-btn" class="add-btn-area" style="display: none;"><button class="btnn-pp">+ 사원추가</button></div>
                                        <br id="transfer-br" clear="both" style="display: none;">
                                        
                                        <!-- forEach -->
                                        <tr>
                                            <td>?사원 추가시 저절로</td>
                                            <td>?사원 추가시 저절로</td>
                                            <td>?사원 추가시 저절로</td>
                                            <td>?셀렉옵션 직급</td>
                                            <td>?</td>
                                        </tr>

                                    </table>

                                    <!-- 비품신청서일 경우 -->
                                    <table id="consume" class="table-bordered" style="display: none;">
                                        <tr>
                                            <th>품명</th>
                                            <th>사유</th>
                                            <th>단위</th>
                                            <th>수량</th>
                                            <th>단가</th>
                                            <th>금액</th>
                                        </tr>

                                        <!-- 행 추가할 경우-->
                                        <div id="consume-btn" class="add-btn-area" style="display: none;"><button class="btnn-pp">+ 행추가</button></div>
                                        <br id="consume-br" clear="both" style="display: none;">

                                        <!-- forEach -->
                                        <tr>
                                            <td>?</td>
                                            <td>?</td>
                                            <td>?</td>
                                            <td>?</td>
                                            <td>?</td>
                                            <td>?</td>
                                        </tr>

                                        <tr>
                                            <th colspan="2">합계</th>
                                            <td colspan="4">?</td>
                                        </tr>
                                    </table>

                                    <!-- 지출결의서일 경우 -->
                                    <table id="cash" class="table-bordered" style="display: none;">
                                        <tr>
                                            <th>거래처</th>
                                            <th colspan="2">사용내역</th>
                                            <th>금액</th>
                                        </tr>

                                        <!-- 행 추가할 경우-->
                                        <div id="cash-btn" class="add-btn-area" style="display: none;"><button class="btnn-pp">+ 행추가</button></div>
                                        <br id="cash-br" clear="both" style="display: none;">

                                        <!-- forEach -->
                                        <tr>
                                            <td>?</td>
                                            <td colspan="2">?</td>
                                            <td>?</td>
                                        </tr>

                                        <tr>
                                            <th colspan="2">부가가치세</th>
                                            <td colspan="3"></td>
                                        </tr>
                                        <tr>
                                            <th colspan="2">합계</th>
                                            <td colspan="3"></td>
                                        </tr>
                                    </table>
                                    
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <br>
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
            
            <button class="btnn-gr">취소</button>
            <button class="btnn-pk">임시저장</button>
            <button class="btnn-pp">작성</button>
        </div>
    </div>
</body>
</html>