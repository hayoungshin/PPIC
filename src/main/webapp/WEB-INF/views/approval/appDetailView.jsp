<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PPIC</title>
<style>
	.second-1, .second-2{
		box-sizing: border-box;
		float: left;
	}
	
	/* 기안 */
    .first{
		text-align: left
	}
    .first-1{
		width: 75%; 
		padding-left: 35px; 
		padding-right: 35px;
	}
    .first-1-1{
		float: left; 
		visibility: hidden;
	}
    .first-1-2{
		float: right;
	}
	.three-btn{
		padding-left: 20px;
	}
	.btn-align{
		float: left;
	}
	
	.second-1{
		width: 75%;
	}
    .form-area{
		padding: 30px; 
		padding-top: 10px;
	}
    #tb{
		margin-top: 10px; 
		margin-bottom: 7px; 
		width: 100%; 
		text-align: center;
	}
	#tb tr{
		height: 40px;
	}
	
	/* 승인, 참조 */
    .second-2{
		width: 25%;
	}
    .agree-area{
		margin-top: 20px; 
		border: 1px solid lightgray;
	}
    .line{
		width: 80%;
	}
    .line-content{
		text-align: left;
	}
    .person-title{
		float: left; 
		width: 90px;
	}
    .level-area{
		border:1px solid #b09eff; 
		border-radius:10px; 
		padding: 10px; 
		margin-bottom: 10px;
	}
    .level-area-pk{
		border:1px solid #fdbaba;
		border-radius:10px; 
		padding: 10px; 
		margin-bottom: 10px;
	}
    .level{
		padding-left: 10px;
	}
    .person-img{
		font-size: x-large;
	}
    
	/* 변경사항 */
    .third{
		width: 100%; 
		text-align: left; 
		padding-left: 40px;
	}
	.changeDel{
		cursor: pointer;
	}

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

	/* form table */
	#fdr, #ftr, #fco, #fca{
		width: 100%;
	}

	/* 첨부파일 */
    .file-list {
		border: 1px solid lightgray; 
		font-size: 14px; 
		padding: 20px;
	}
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
			
			// Ajax 변경사항 select
			ajaxSelectChange();
		}
		
		// Ajax 중요 update
		function ajaxStar(bk){
			$.ajax({
				url:"updateBook.ap",
				data:{
					approvalNo:${ad.approvalNo},
					bookmark:bk,
					userName:${loginUser.userNo}
				},
				success:function(result){
					if(result > 0){
						location.reload();
					}
				}, error:function(){
					console.log("중요용 ajax통신 실패");
				}
			});
		}
		
		// Ajax 삭제 update
		function ajaxDel(){
			if(confirm('결재문서를 삭제하시겠습니까?')){
				$.ajax({
					url:"deleteApproval.ap?no=" + ${ad.approvalNo},
					success:function(result){
						if(result > 0){
							location.href = "list.ap?myi=1";
						}
					}, error:function(){
						console.log("삭제용 ajax통신 실패");
					}
				});
			}
		}
		
		// Ajax 변경사항 select
		function ajaxSelectChange(){
			$.ajax({
				url:"selectChange.ap?no=" + ${ad.approvalNo},
				success:function(list){
					let value = "";
					for(let i=0; i<list.length; i++){
						if(list[i].role == '변경'){
							value += "<tr height='35px;'>"
							       +	"<th>" + list[i].userName + "</th>"
							       +	"<td colspan='2'>"
							       +		list[i].content
							       + 		"<span style='font-size:14px; color:gray;'>&nbsp;&nbsp;&nbsp;" + list[i].createDate + "</span>"
							       +	"</td>"
							       + "</tr>";
						} else {
							value += "<tr>"
								   +	"<th>" + list[i].userName + "</th>"
								   +	"<td colspan='2'>"
								   +		"<span style='font-size:14px; color:gray;'>&nbsp;&nbsp;&nbsp;" + list[i].createDate + "</span>&nbsp;&nbsp;&nbsp;"
								   +		"<span class='changeDel' style='font-size:14px; color:red;'>삭제</span>"
								   +		"<input type='hidden' value='" + list[i].changeNo + "'>"
								   +	"</td>"
								   + "</tr>"
								   + "<tr height='35px;'>"
								   +	"<td colspan='3'>&nbsp;" + list[i].content + "</td>"
								   + "</tr>";
						}
					}
					
					const change_area = document.getElementById("ajax-change-area");
					change_area.innerHTML = value;
				}, error:function(){
					console.log("변경사항용 ajax통신 실패");
				}
			});

			// Ajax 변경사항 delete
			$(document).on('click', '.changeDel', function(){
				const changeNo = this.nextSibling.value;
				$.ajax({
					url:'deleteChange.ap?changeNo=' + changeNo,
					success:function(result){
						if(result > 0){
							location.reload();
						}
					}, error:function(){
						console.log("변경사항용 ajax통신 실패");
					}
				});
			});
		}
		
		// Ajax 변경사항 insert
		function ajaxInsertChange(){
			const change_input = document.getElementById("change-input");
			if(change_input.value.trim().length > 0){
				$.ajax({
					url:"insertChange.ap",
					data:{
						approvalNo:${ad.approvalNo},
						userName:${loginUser.userNo},
						content:change_input.value,
						role:'댓글'
					},
					success:function(result){
						if(result > 0){
							change_input.value = "";
							ajaxSelectChange();
						}
					}, error:function(){
						alert("댓글 작성 실패");
					}
				});
			}
		}
		
		// Ajax 결재선 update
		function myApproval(app){
			let status = "";
			if(app == 'Y'){
				status = "승인";
			}else{
				status = "반려";
			}
			$.ajax({
				url:"updateProcess.ap",
				data:{
					approvalNo:${ad.approvalNo},
					userName:${loginUser.userNo},
					status:status,
					currentOrder:${ad.app.currentOrder},
					finalOrder:${ad.app.finalOrder}
				},
				success:function(result){
					if(result > 0){
						location.reload();
						if(socket){
							if(app == 'Y'){
								let socketMsg = "0,${loginUser.userNo},${loginUser.userName},${ad.app.userNo},0,${ ad.app.title }";
								socket.send(socketMsg);
							}else{
								let socketMsg = "1,${loginUser.userNo},${loginUser.userName},${ad.app.userNo},0,${ ad.app.title }";
								socket.send(socketMsg);
							}
						}
					}
				},error:function(){
					console.log("결재선용 ajax통신 오류");
				}
			});
		}
		
		// 상신취소
		function cancel(){
			location.href="cancelApproval.ap?approvalNo=${ad.approvalNo}&form=${ad.app.form}";
		}
	</script>

	<div id="content" align="center">
        <br>
        <div class="first">
            <div class="first-1">
				<div class="first-1-1">
					<button class="btnn-sb" onclick="myApproval('Y');">승인</button>
					<button class="btnn-rd" onclick="myApproval('N');">반려</button>
				</div>
				
                <div class="first-1-2">
                   	
					<c:if test="${ ad.app.userName eq loginUser.userName }">
						<c:if test="${ ad.app.approvalStatus ne '승인' and ad.app.approvalStatus ne '반려' }">
							<div class="btn-align">
					   			<div class="three-btn btnn-gr" onclick="return cancel();">상신취소</div>
							</div>
						</c:if>
						<div class="btn-align" style="margin-left:5px;">
				   			<div class="three-btn btnn-rd" onclick="return ajaxDel();">삭제</div>
						</div>
					</c:if>
                
                	<c:forEach var="p" items="${ ad.process }">
	                	<c:if test="${ p.userName eq loginUser.userName }">
	                   		<div class="btn-align">
	                   			<c:choose>
		                   			<c:when test="${ p.bookmark eq 'N' }">
		                    			<img src="resources/icons/star.png" height="20px" class="three-btn as" onclick="ajaxStar(0);">
		                    		</c:when>
		                    		<c:otherwise>
			                    		<img src="resources/icons/star-y.png" height="20px" class="three-btn as" onclick="ajaxStar(1);">
		                    		</c:otherwise>
		                    	</c:choose>
	                   		</div>
	                   	</c:if>
                   	</c:forEach>
					
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
                                <th width="13%">작성일</th>
                                <td width="20%">${ ad.app.createDate }</td>
                                <th width="13%">완료일</th>
                                <td width="20%">
									<c:choose>
										<c:when test="${ empty ad.app.completeDate }">
											<span style="color:#6F50F8;">완료시 자동생성</span>
										</c:when>
										<c:otherwise>
											${ ad.app.completeDate }
										</c:otherwise>
									</c:choose>
								</td>
								<th width="13%">문서번호</th>
                                <td width="21%">
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
                                    
                                    <!-- 업무기안 -->
                                    <table id="fdr" class="table-bordered">
                                        <tr>
                                            <th width="20%">시행일자</th>
                                            <td width="20%">${ ad.draft.effectiveDate }</td>
                                            <th width="20%">협조부서</th>
                                            <td width="40%">${ ad.draft.departmentNo }부</td>
                                        </tr>
                                        <tr>
                                            <th colspan="4">내용</th>
                                        </tr>
                                        <tr>
                                            <td colspan="4"><br>${ ad.draft.content }</td>
                                        </tr>
                                    </table>

                                    <!-- 인사발령품의서 -->
                                    <table id="ftr" class="table-bordered">
                                        <colgroup>
				                    		<col style="width:15%">
				                    		<col style="width:5%">
				                    		<col style="width:10%">
				                    		<col style="width:15%">
				                    		<col style="width:15%">
				                    		<col style="width:40%">
				                    	</colgroup>
				                    	
				                    	<tr>
                                            <th colspan="2">시행일자</th>
                                            <td colspan="4">${ ad.transfer[0].effectiveDate }</td>
                                        </tr>
                                        <tr>
                                            <th>성명</th>
                                            <th colspan="2">부서</th>
                                            <th>현직급</th>
                                            <th>변경직급</th>
                                            <th>비고</th>
                                        </tr>
										<c:forEach var="t" items="${ ad.transfer }">
	                                        <tr>
	                                            <td>${ t.userName }</td>
	                                            <td colspan="2">${ t.departmentName }부</td>
	                                            <td>${ t.currentPosition }</td>
	                                            <td>${ t.promotePosition }</td>
	                                            <td>
													<c:choose>
														<c:when test="${ t.remark eq null }">
															-
														</c:when>
														<c:otherwise>
															${ t.remark }
														</c:otherwise>
													</c:choose>
												</td>
	                                        </tr>
	                                    </c:forEach>
                                    </table>

                                    <!-- 비품신청서 -->
                                    <table id="fco" class="table-bordered">
                                        <tr>
                                            <th style="width:35%">품명</th>
                                            <th style="width:12%">단위</th>
                                            <th style="width:12%">수량</th>
                                            <th style="width:12%">단가</th>
                                            <th style="width:12%">금액</th>
                                            <th style="width:17%">사유</th>
                                        </tr>
										<c:set var="coPrice" value="0"/>
										<c:forEach var="c" items="${ ad.consume }">
	                                        <tr>
	                                            <td>${ c.name }</td>
	                                            <td>${ c.unit }</td>
	                                            <td>${ c.count }개</td>
	                                            <td><fmt:formatNumber value="${ c.price }" type="number"/>원</td>
	                                            <td><fmt:formatNumber value="${ c.count * c.price }" type="number"/>원</td>
	                                            <td>${ c.reason }</td>
	                                        </tr>
											<c:set var="coPrice" value="${ coPrice + c.count * c.price }"/>
	                                    </c:forEach>
                                        <tr>
                                            <th>합계</th>
                                            <td colspan="5"><fmt:formatNumber value="${ coPrice }" type="number"/>원</td>
                                        </tr>
                                    </table>

                                    <!-- 지출결의서 -->
                                    <table id="fca" class="table-bordered">
                                        <tr>
                                            <th style="width:25%">거래처</th>
                                            <th style="width:60%">사용내역</th>
                                            <th style="width:15%">금액</th>
                                        </tr>
                                        <c:set var="caPrice" value="0"/>
										<c:forEach var="c" items="${ ad.cash }">
	                                        <tr>
	                                            <td>${ c.account }</td>
	                                            <td>${ c.userHistory }</td>
	                                            <td><fmt:formatNumber value="${ c.price }" type="number"/>원</td>
	                                        </tr>
	                                        <c:set var="caPrice" value="${ caPrice + c.price }"/>
	                                    </c:forEach>
                                        <tr>
                                            <th colspan="2">부가가치세</th>
                                            <td><fmt:formatNumber value="${ caPrice * 0.1 }" type="number"/>원</td>
                                        </tr>
                                        <tr>
                                            <th colspan="2">합계</th>
                                            <td><fmt:formatNumber value="${ caPrice + (caPrice * 0.1) }" type="number"/>원</td>
                                        </tr>
                                    </table>

									<div class="file-list">
										<c:choose>
											<c:when test="${ad.att[0] ne null}">
												<c:forEach var="at" items="${ad.att}">
													<a href="${at.changeName}" download="${at.originName}">${at.originName}</a><br>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<span style="color:gray;">첨부파일 없음</span>
											</c:otherwise>
										</c:choose>
									</div>

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
        	<table>
	        	<colgroup>
	        		<col style="width:50px;">
	           		<col style="width:260px;">
	           		<col>
				</colgroup>
        		<thead id="ajax-change-area"></thead>
        		<tbody>
		            <tr>
	        			<th colspan="2">
	        				<textarea class="form-control" id="change-input" cols="55" rows="2" style="resize:none; width:300px;"></textarea>
		                </th>
		                <th><button class="btnn-pp" style="height:60px; width:50px;" onclick="ajaxInsertChange();">입력</button></th>
	        		</tr>
        		</tbody>
            </table>
        </div>
        <br>

        <button class="btnn-gr" onclick="location.href='list.ap?myi=1'">목록</button>
    </div>
</body>
</html>