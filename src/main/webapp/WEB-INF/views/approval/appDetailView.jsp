<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PPIC</title>
<style>
	.second-1, .second-2{box-sizing: border-box; float: left;}
	
    .first{text-align: left;}
    .first-1{width: 75%; padding-left: 35px; padding-right: 35px;}
    .first-1-1{float: left; visibility: hidden;}
    .first-1-2{float: right;}
	/*.three-btn{padding-left: 30px; font-size: 20px;}*/
	.btn-align{float: left;}
	
	.second-1{width: 75%;}
    .form-area{padding: 30px; padding-top: 10px;}
    #tb{margin-top: 10px; margin-bottom: 7px; width: 100%; text-align: center;}
	#tb tr{height: 40px;}
	
    .second-2{width: 25%;}
    .agree-area{margin-top: 20px; border: 1px solid lightgray;}
    .line{width: 80%;}
    .line-content{text-align: left;}
    .person-title{float: left; width: 90px;}
    .level-area{border:1px solid #b09eff; border-radius:10px; padding: 10px; margin-bottom: 10px;}
    .level-area-pk{border:1px solid #fdbaba; border-radius:10px; padding: 10px; margin-bottom: 10px;}
    .level{padding-left: 10px;}
    .person-img{font-size: x-large;}
    
    .third{width: 100%; text-align: left; padding-left: 40px;}
    
    .btnn-pp{text-decoration: none; font-size: 14px; background-color: white; color: #6F50F8; border:1px solid #6F50F8; border-radius: 4px; padding: 4px; padding-left: 8px; padding-right: 8px;}
	.btnn-pp:hover{cursor: pointer; text-decoration: none; background-color: #6F50F8; color: white; transition: 0.3s;}
	.btnn-gr{text-decoration: none; font-size: 14px; background-color: white; color: gray; border:1px solid gray; border-radius: 4px; padding: 4px; padding-left: 8px; padding-right: 8px;}
    .btnn-gr:hover{cursor: pointer; text-decoration: none; background-color: gray; color: white; transition: 0.3s;}
    
    .stt-pp{border-radius: 5px; border: 1px solid #6F50F8; background-color: #6F50F8; color: white; padding-left: 4px; padding-right: 4px; margin-left: 15px;}
    .stt-gr{border-radius: 5px; border: 1px solid gray; background-color: gray; color: white; padding-left: 4px; padding-right: 4px; margin-left: 15px;}
    .stt-pk{border-radius: 5px; border: 1px solid #fdbaba; background-color: #fdbaba; color: white; padding-left: 4px; padding-right: 4px; margin-left: 15px;}
    .stt-sb{border-radius: 5px; border: 1px solid #00b5d1; background-color: #00b5d1; color: white; padding-left: 4px; padding-right: 4px; margin-left: 15px;}
    .stt-rd{border-radius: 5px; border: 1px solid rgb(255, 100, 100); background-color: rgb(255, 100, 100); color: white; padding-left: 4px; padding-right: 4px; margin-left: 15px;}

	#fdr, #ftr, #fco, #fca{width: 100%;}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>

	<script>
		window.onload = function(){
			switch('${ad.app.form }'){
			case '업무기안' :
				document.getElementById('ftr').style = 'display:none;';
				document.getElementById('fco').style = 'display:none;';
				document.getElementById('fca').style = 'display:none;';
				break;
			case '인사발령품의서' :
				document.getElementById('fdr').style = 'display:none;';
				document.getElementById('fco').style = 'display:none;';
				document.getElementById('fca').style = 'display:none;';
				break;
			case '비품신청서' :
				document.getElementById('fdr').style = 'display:none;';
				document.getElementById('ftr').style = 'display:none;';
				document.getElementById('fca').style = 'display:none;';
				break;
			case '지출결의서' :
				document.getElementById('fdr').style = 'display:none;';
				document.getElementById('ftr').style = 'display:none;';
				document.getElementById('fco').style = 'display:none;';
				break;
			}
			
			// 나의 승인이 필요한 경우 (.first-1-1)
			const need_agree_area = document.getElementsByClassName("first-1-1")[0];
			const need_agree = document.getElementById("need-agree");
			if(need_agree != null){
				const need_agree_person = document.getElementById("need-agree").parentNode.parentNode.nextSibling.nextSibling.childNodes[3].innerHTML;
				if(need_agree_person == '${loginUser.userName}'){
					need_agree_area.style.visibility = 'visible';
				}
			}
		}
	</script>

	<div id="content" align="center">
        <br>
        <div class="first">
            <div class="first-1">
				<div class="first-1-1"><span class="stt-pk"><b>승인필요</b></span></div>
                <div class="first-1-2">
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
                                <th colspan="6"><br><h3><b>${ ad.app.form }</b></h3><br></th>
                            </tr>
                            <tr>
                                <th>작성일</th>
                                <td>${ ad.app.createDate }</td>
                                <th>완료일</th>
                                <td>
									<c:choose>
										<c:when test="${ empty ad.app.completeDate }">
											<span style="color:#6F50F8;">완료시 자동생성</span>
										</c:when>
										<c:otherwise>
											${ ad.app.completeDate }
										</c:otherwise>
									</c:choose>
								</td>
								<th>문서번호</th>
                                <td>
									<c:choose>
										<c:when test="${ empty ad.app.completeNo }">
											<span style="color:#6F50F8;">완료시 자동생성</span>
										</c:when>
										<c:otherwise>
											${ ad.app.completeNo }
										</c:otherwise>
									</c:choose>
								</td>
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td>${ ad.app.userName }</td>
                                <th>부서</th>
                                <td>${ ad.app.department }부</td>
                                <th>직급</th>
                                <td>${ ad.app.position }</td>
                            </tr>
                            <tr>
                                <th>제목</th>
                                <th colspan="5">${ ad.app.title }</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="6">
                                    
                                    <!-- 업무기안일 경우 -->
                                    <table id="fdr" class="table-bordered">
                                        <tr>
                                            <th>시행일자</th>
                                            <td>${ ad.draft.effectiveDate }</td>
                                            <th>협조부서</th>
                                            <td>${ ad.draft.departmentNo }부</td>
                                        </tr>
                                        <tr>
                                            <th colspan="4">내용</th>
                                        </tr>
                                        <tr>
                                            <td colspan="4"><br>${ ad.draft.content }</td>
                                        </tr>
                                    </table>

                                    <!-- 인사발령품의서일 경우 -->
                                    <table id="ftr" class="table-bordered">
                                        <tr>
                                            <th colspan="2">시행일자</th>
                                            <td colspan="3">${ ad.transfer[0].effectiveDate }</td>
                                        </tr>
                                        <tr>
                                            <th>성명</th>
                                            <th>부서</th>
                                            <th>현직급</th>
                                            <th>변경직급</th>
                                            <th>비고</th>
                                        </tr>
										<c:forEach var="t" items="${ ad.transfer }">
	                                        <tr>
	                                            <td>${ t.userName }</td>
	                                            <td>${ t.departmentName }부</td>
	                                            <td>${ t.currentPosition }</td>
	                                            <td>${ t.promotePosition }</td>
	                                            <td>${ t.remark }</td>
	                                        </tr>
	                                    </c:forEach>
                                    </table>

                                    <!-- 비품신청서일 경우 -->
                                    <table id="fco" class="table-bordered">
                                        <tr>
                                            <th>품명</th>
                                            <th>사유</th>
                                            <th>단위</th>
                                            <th>수량</th>
                                            <th>단가</th>
                                            <th>금액</th>
                                        </tr>
										<c:forEach var="c" items="${ ad.consume }">
	                                        <tr>
	                                            <td>${ c.name }</td>
	                                            <td>${ c.reason }</td>
	                                            <td>${ c.unit }</td>
	                                            <td>${ c.count }</td>
	                                            <td>${ c.price }</td>
	                                            <td>${ c.count * c.price }</td>
	                                        </tr>
	                                    </c:forEach>
                                        <tr>
                                            <th colspan="2">합계</th>
                                            <td colspan="4">?</td>
                                        </tr>
                                    </table>

                                    <!-- 지출결의서일 경우 -->
                                    <table id="fca" class="table-bordered">
                                        <tr>
                                            <th>거래처</th>
                                            <th>사용내역</th>
                                            <th>금액</th>
                                        </tr>
                                        <c:set var="total" value="0"/>
										<c:forEach var="c" items="${ ad.cash }">
	                                        <tr>
	                                            <td>${ c.account }</td>
	                                            <td>${ c.userHistory }</td>
	                                            <td>${ c.price }</td>
	                                        </tr>
	                                        <c:set var="total" value="${total + c.price }"/>
	                                    </c:forEach>
                                        <tr>
                                            <th colspan="2">부가가치세</th>
                                            <td>${ ad.cash[0].vat }</td>
                                        </tr>
                                        <tr>
                                            <th colspan="2">합계</th>
                                            <td>${ ad.cash[0].vat + total }</td>
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
                            <c:forEach var="p" items="${ ad.process }">
		                        <c:if test="${ p.processOrder ne 0 }">
		                        	<div class="level-area">
			                            <div class="level">
			                            	<h6>
			                            		<b>${ p.processOrder }단계</b>
			                            		<c:choose>
			                            			<c:when test="${ empty p.status }">
			                            				<c:choose>
			                            					<c:when test="${ ad.app.approvalStatus eq '반려'}">
			                            						<!-- 빈칸 -->
			                            					</c:when>
			                            					<c:when test="${ ad.app.currentOrder + 1 eq p.processOrder }">
			                            						<span id="need-agree" class="stt-pk">승인필요</span>
			                            					</c:when>
			                            					<c:otherwise>
			                            						<span class="stt-gr">대기</span>
			                            					</c:otherwise>
			                            				</c:choose>
			                            			</c:when>
			                            			<c:when test="${ p.status eq '승인' }">
			                            				<span class="stt-sb">승인</span>
			                            			</c:when>
			                            			<c:when test="${ p.status eq '반려' }">
			                            				<span class="stt-rd">반려</span>
			                            			</c:when>
			                            		</c:choose>
			                            	</h6>
			                            </div>
			                            <div class="level-person">
			                                <span class="person-img">🧑🏻‍💻</span>
			                                ${ p.departmentName }부 <span id="nm">${ p.userName }</span> ${ p.positionName }
			                            </div>
			                    	</div>
			                    </c:if>
							</c:forEach>
							<br>
                            <div class="person-title"><h5><b>참조자</b></h5></div>
                            <br clear="both">
                            <c:set var="referencer" value="0"/>
                            <c:forEach var="p" items="${ ad.process }" varStatus="status">
                            	<c:if test="${ p.approvalRole eq '참조' }">
	                            	<div class="level-area-pk">
	                            		<div class="level-person">
				                            <span class="person-img">🙋🏻‍♂️</span>
				                            ${ p.departmentName }부 ${ p.userName } ${ p.positionName }
				                        </div>
				                    </div>
				                    <c:set var="referencer" value="${referencer + 1 }"/>
				                </c:if>
			                </c:forEach>
			                <c:if test="${ referencer eq 0 }">
			                	<div class="level-area-pk">
	                            	<div class="level-person">
	                            		<span class="person-img">🙅🏻‍♂️</span>
	                            		참조자 없음
	                            	</div>
				                </div>
			                </c:if>
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