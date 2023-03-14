<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 게시판 리스트 */
    .table{text-align: center;}
    .table>tbody>tr:hover{cursor:pointer; opacity: 0.7;}
    
    /* 버튼 스타일 */
    #modal-btn, #exit-btn, #delete-btn, #check-btn, #blind-btn{
        color:white;
        width:70px;
        height:30px;
        font-size: 12px;
        background: rgb(190, 190, 190);
    }
    #modal-btn, #delete-btn, #blind-btn{background: rgb(111, 80, 248);}
    #blind-btn{width:auto;}
    .btn:hover{opacity: 0.7;}

    textarea{
        border: 1px solid rgb(202, 199, 199);
        border-radius: 5px;
        width: 300px;
        height:100px;
    }
    #blindModal td{
        padding: 5px;
    }
</style>
</head>
<body>

	<jsp:include page="boardMenubar.jsp"/>
    <script>
        document.getElementsByClassName("menus")[3].className += ' clicked';
    </script>

	<div class="boardOuter"> 
        <div align="right" style="width:1200px;">
            <a class="btn" id="modal-btn" data-toggle="modal" data-target="#deleteModal">삭제</a>
        </div>
        <br>
        <table class="table" id="report-table" style="width:1200px;">
            <thead>
              <tr>
                <th><input type="checkbox" id="chkAll"></th> 
                <th>신고구분</th>
                <th style="width:600px;">신고게시글</th>
                <th style="width:150px;">신고일</th>
                <th>블라인드</th>
              </tr>
            </thead>
            <tbody>
            	<c:forEach var="r" items="${ list }">
                	<tr>
                		<td onclick="event.cancelBubble=true">
                			<input type="checkbox" name="deleteReport" value="${ r.reportNo }">
                			<input type="hidden" class="reportContent" value="${ r.reportContent }">
                    		<input type="hidden" class="reportBno" value="${ r.reportBno }">
                    		<input type="hidden" class="reportSta" value="${r.reportSta}">
                		</td>
                        <td>${ r.reportKind }</td>
                        <td>${ r.boardTitle }</td>
                        <td>${ r.reportDate }</td>
                        <td>
                       		<c:if test="${ r.reportSta eq 1 }">
	                     		블라인드
	                     	</c:if>
	                     	<c:if test="${ r.reportSta eq 2 }">
	                     		블라인드 취소
	                     	</c:if>
                        </td>
                    </tr>
                    
                 </c:forEach>
            </tbody>
        </table>

		<script>
		    $(".table tbody tr").click(function(){
		        $('#report-kind').text($(this).children().eq(1).text());
		        $('#report-title').text($(this).children().eq(2).text());
		        $('#goTo').attr("href", "detail.bo?userNo=${loginUser.userNo}&no="+$(this).find('.reportBno').val()); 
		        $('#report-content').text($(this).find('.reportContent').val());
		        $('#report-bno').val($(this).find('.reportBno').val());
		        $('#report-sta').val($(this).find('.reportSta').val());
		        if($(this).find('.reportSta').val() == 1){
		        	$('#blind-btn').text("블라인드 취소");
		        }else{
		        	$('#blind-btn').text("블라인드");
		        }
		        $('#blindModal').modal('show'); 
		    })
		    
		    $(function(){
				$("#chkAll").click(function() {
					if($("#chkAll").is(":checked")) {
						$("input[name=deleteReport]").prop("checked", true);
					}else {
						$("input[name=deleteReport]").prop("checked", false);
					}
				});

				$("input[name=deleteReport]").click(function() {
					var total = $("input[name=deleteReport]").length;
					var checked = $("input[name=deleteReport]:checked").length;

					if(total != checked) $("#chkAll").prop("checked", false);
					else $("#chkAll").prop("checked", true); 
				});
			})
			
			$("#modal-btn").click(function(){
				let reportNo = "";
	         	$("input[name=deleteReport]:checked").each(function(){
	         		 let arr = $(this).val(); 
	         		 reportNo += arr + ","
	         	})
	         	reportNo = reportNo.substring(0, reportNo.length-1);
	            $("#deleteModal input[name=reportNo]").val(reportNo);
			})
	    </script>
				    
        <div id="paging" style="width:1200px;">
            <ul>
          		<c:if test="${ pi.currentPage ne 1 }">
              		<li><a href="manage.bo?cpage=${ pi.currentPage - 1 }"><</a></li>
              	</c:if>
	            
	            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	            	<c:choose>
	            		<c:when test="${ pi.currentPage eq p }">
		            		<li class="on"><a href="manage.bo?cpage=${ p }">${ p }</a></li>
	            		</c:when>
	            		<c:otherwise>
		            		<li><a href="manage.bo?cpage=${ p }">${ p }</a></li>
	            		</c:otherwise>
	            	</c:choose>
				</c:forEach>
				
				<c:if test="${ pi.currentPage ne pi.maxPage }">
	            	<li><a href="manage.bo?cpage=${ pi.currentPage + 1 }">></a></li>
				</c:if>
           </ul>
        </div>
        
        <!-- 삭제 확인용 Modal -->
        <div class="modal" id="deleteModal" data-backdrop='static' data-keyboard='false'>
            <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-body">
                <b>신고 내역 삭제</b> <br><br>
                <form action="deleteReport.bo" method="post">
	                <div align="center">
	                	<input type="hidden" name="reportNo">
	                    삭제하시겠습니까?<br><br>
	                    <button type="button" class="btn" data-dismiss="modal" id="exit-btn">취소</button>
	                    <button type="submit" class="btn" id="delete-btn">확인</button>
	                </div>
                </form>
                </div>
            </div>
            </div>
        </div>

        <!-- 블라인드 처리용 Modal -->
        <div class="modal" id="blindModal" data-backdrop='static' data-keyboard='false'>
            <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body">
                    <b>신고내역</b> <br><br>
                    <form action="blind.bo">
                    	<input type="hidden" name="reportBno" id="report-bno">
                    	<input type="hidden" name="reportSta" id="report-sta">
                        <table>
                            <tr>
                                <td><b>신고구분</b></td>
                                <td colspan="2" id="report-kind"></td>
                            </tr>
                            <tr>
                                <td><b>신고게시글</b></td>
                                <td id="report-title"></td>
                                <td style="text-align:right; vertical-align:middle;"><a id="goTo"><img src="resources/icons/goTo.png" height="15px" width="15px" style="margin-left:5px"></a></td>
                            </tr>
                            <tr>
                                <td><b>신고내용</b></td>
                                <td colspan="2"><textarea name="" style="resize: none; padding:10px;" id="report-content" readonly></textarea></td>
                            </tr>
                        </table>
                        <div align="center">
                            <button class="btn" data-dismiss="modal" id="check-btn">확인</button>
                            <button class="btn" id="blind-btn"></button>
                        </div>
                    </form>
                </div>
            </div>
            </div>
        </div>
    </div>
    
</body>
</html>