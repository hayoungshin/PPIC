<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PPIC</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>

	<div id="content" align="center">
        <br>
        <div class="first">
            <div class="first-1"><h2><b>(인사발령협의문)안녕하세요. 인사발령협의문입니다.</b></h2></div>
            <div class="first-2">

                <!-- 나의 승인이 필요한 경우 -->
                <div class="first-2-1"><span class="need-agree"><b>승인필요</b></span></div>

                <!-- <div class="first-2-2">
                    <a href="">🤍💜</a>
                    <a href="">✖️</a>
                    <a href="">🗑️</a>
                </div> -->
                
                <div class="first-2-2">
                	<div class="btn-align">
			   			<span class="three-btn" onclick="selectHow(0);">🤍💜</span>
					</div>
					<div class="btn-align">
			   			<span class="three-btn" onclick="selectHow(0);">✖️</span>
					</div>
					<div class="btn-align">
			   			<span class="three-btn" onclick="selectHow(0);">🗑️</span>
					</div>
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
                                <th colspan="4"><br><h3><b>결재양식?</b></h3><br></th>
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
                                    <table width="100%" class="table-bordered">
                                        <tr>
                                            <th>시행일자</th>
                                            <td>?</td>
                                            <th>협조부서</th>
                                            <td>?</td>
                                        </tr>
                                        <tr>
                                            <th colspan="4">내용</th>
                                        </tr>
                                        <tr>
                                            <td colspan="4">?</td>
                                        </tr>
                                    </table>

                                    <!-- 인사발령품의서일 경우 -->
                                    <table width="100%" class="table-bordered">
                                        <tr>
                                            <th colspan="2">시행일자</th>
                                            <td colspan="3"></td>
                                        </tr>
                                        <tr>
                                            <th>부서</th>
                                            <th>성명</th>
                                            <th>현직급</th>
                                            <th>변경직급</th>
                                            <th>비고</th>
                                        </tr>

                                        <!-- forEach -->
                                        <tr>
                                            <td>?</td>
                                            <td>?</td>
                                            <td>?</td>
                                            <td>?</td>
                                            <td>?</td>
                                        </tr>

                                    </table>

                                    <!-- 비품신청서일 경우 -->
                                    <table width="100%" class="table-bordered">
                                        <tr>
                                            <th>품명</th>
                                            <th>사유</th>
                                            <th>단위</th>
                                            <th>수량</th>
                                            <th>단가</th>
                                            <th>금액</th>
                                        </tr>

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
                                    <table width="100%" class="table-bordered">
                                        <tr>
                                            <th>거래처</th>
                                            <th colspan="2">사용내역</th>
                                            <th>금액</th>
                                        </tr>

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
                </div>
            </div>
            
            <div class="second-2">
                <div class="agree-area">
                    <br>
                    <h4><b>승인ㆍ참조</b></h4>
                    <br>

                    <div class="line">
                        <div class="line-content">
                            <div class="person-title"><h5><b>승인자</b></h5></div>
                            <br clear="both">

                            <!-- forEach -->
                            <div class="level"><h6><b>1단계</b><span class="processing">진행중</span></h6></div>
                            <div class="level-person">
                                <span class="person-img">🧑🏻‍💻</span>
                                인사부 문승하 대리
                            </div>

                            <div class="person-title"><h5><b>참조자</b></h5></div>
                            <br clear="both">
                        </div>
                        <br>
                    </div>

                </div>
            </div>
        </div>
        <br clear="both">
        <div class="third">
            <div class="reply-content">
                댓글입니다.
            </div>
            <br>
            <div class="reply-insert">
                <input type="text">
                <button class="btnn-pp">입력</button>
            </div>
        </div>
        <br>

        <button class="btnn-gr">목록</button>
    </div>
</body>
</html>