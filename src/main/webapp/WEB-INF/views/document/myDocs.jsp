<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서ㆍ증명서</title>
<style>
   /* 서브메뉴 */
   .sub-menu a{
       font-size:18px;
       color:rgb(143, 143, 143);
       text-decoration:none;
       margin-right:30px;
   }
   .sub-menu a.active, .sub-menu a:hover {
       color:rgb(0, 0, 0);
       font-weight:600;
   }

   /* 리스트 */
   .table{
       text-align:center;
       font-size:14px;
   }
   .table>thead{
   	   background:rgb(244, 244, 244);
   }
   .edit-btn{
       margin-left:20px;
       cursor:pointer;
   }
   .btn-outline-purple{
   	   display:inline-block;
   	   width:72px;
   	   height:29px;
   	   border-radius:5px;
   	   text-decoration:none;
   	   line-height:29px;
   	   background:white;
   	   border:0.5px solid #6F50F8;
   	   color:#6F50F8;
   }
   .btn-outline-purple:hover{
   	   background:#6F50F8;
   	   color:white;
   	   text-decoration:none;
   	   transition:background 0.3s;
   }
   /* 페이징 */
   #paging{
   	width:1400px; 
       text-align:center;
   }
   #paging>ul{display: inline-block;}
   #paging li {
       text-align: center;
       float: left;
       list-style:none;
       border-radius:5px;
       background: rgb(244, 244, 244);
       margin:2px;
   }
   #paging li a {
       display: block;
       font-size: 12px;
       color: black;
       padding: 5px 10px;
       box-sizing: border-box;
       text-decoration-line:none;
   }
   #paging li:hover{background: rgb(111, 80, 248);}
   #paging li a:hover{color: white;}
   #paging li.on {background: rgb(111, 80, 248);}
   #paging li.on a {color: white;}
   
   /* 증명서 신청 */
   .certificate-docs{
       width:400px;
       height:50px;
       margin:10px;
       border-radius:5px;
   }
   .certificate-docs>img{
       width:24px;
       margin-left:10px;
   }
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp"/>
	
	<div id="content">
		<h3 class="title"><b>문서ㆍ증명서</b></h3>
        <br><br>
        <div class="sub-menu">
             <a href="commonList.doc">회사문서</a>
             <a href="myList.doc" class="active">내 문서</a>
        </div>
        <hr>
        <br>
        <button style="float:right" class="btn-purple" data-toggle="modal" data-target="#addModal">문서 추가</button>
        <br><br>
        <div class="list-area">
            <table class="table">
                <thead>
                    <th style="width:600px">문서</th>
                    <th style="width:100px">다운로드</th>
                    <th style="width:100px">수정일</th>
                </thead>
                <tbody>
                <c:forEach var="d" items="${list}">
                   <tr>
                    <td>${d.docName}<img src="resources/icons/edit.png" width="20" class="edit-btn" data-toggle="modal" data-target="#editModal${d.docNo}"></td>
                    	<c:choose>
                    		<c:when test="${not empty d.originName}">
                    			<td><a class="btn-outline-purple" href="${d.savePath}" download="${d.originName}">다운로드</a></td>
                    		</c:when>
                    		<c:otherwise>
                    			<td>미등록</td>
                    		</c:otherwise>
                    	</c:choose>
                    <td>${d.modifyDate}</td>
                   </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- 추가 모달 -->
        <div class="modal fade" id="addModal">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">문서 추가</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <form action="insertMy.doc" method="post" enctype="multipart/form-data">
                    <div class="modal-body">
                        * 문서 이름 : <input type="text" name="docName" placeholder="문서명을 입력해주세요." required>
                        <br><br>
                        파일 첨부 : <input type="file" name="upfile">
                        <input type="hidden" name="docType" value="2">
                        <input type="hidden" name="createUser" value="${loginUser.userNo}">
                    </div>
            
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn-purple">등록</button>
                    </div>
                </form>
        
            </div>
            </div>
        </div>

        <!-- 수정 모달 -->
        <c:forEach var="d" items="${list}">
        <div class="modal fade" id="editModal${d.docNo}">
            <div class="modal-dialog">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">문서 수정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <form method="post" enctype="multipart/form-data" id="updateForm${d.docNo}">
	                <div class="modal-body">
	                    * 문서 이름 : <input type="text" placeholder="문서명을 입력해주세요." name="docName" value="${d.docName}" required>
	                    <br><br>
	                    문서 첨부 : <input type="file" name="reUpfile">
	                    <br><br>
	                    현재 파일 : <a href="${d.savePath}" download="${d.originName}">${d.originName}</a>
                        <input type="hidden" name="savePath" value="${d.savePath}">
                        <input type="hidden" name="originName" value="${d.originName}">
                        <input type="hidden" name="docNo" value="${d.docNo}">
                        <input type="hidden" name="createUser" value="${loginUser.userNo}">
	                </div>
	        
	                <!-- Modal footer -->
	                <div class="modal-footer">
	                    <a class="btn btn-outline-danger" onclick="deleteSubmit('${d.docNo}');">삭제</a>
                        <a class="btn btn-primary" onclick="updateSubmit('${d.docNo}');">수정</a>
	                </div>
                </form>
        
            </div>
            </div>
        </div>
        </c:forEach>
  		<br><br>

        <script>
            function updateSubmit(num){
                    $("#updateForm" + num).attr("action", "updateMy.doc").submit();
            }

            function deleteSubmit(num){
                if(confirm("정말 삭제하시겠습니까?")){
                    $("#updateForm" + num).attr("action", "deleteMy.doc?no=" + num).submit();
                }
            }
        </script>

        <div id="paging">
            <ul>
            <c:if test="${pi.currentPage ne 1}">
           		<li><a href="">&lt;</a></li>
           	</c:if>
	        	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
	        		<c:choose>
	        			<c:when test="${pi.currentPage eq p}">
                    		<li class="on"><a href="commonList.docs?cpage=${p}">${p}</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li><a href="commonList.docs?cpage=${p}">${p}</a></li>
                    	</c:otherwise>
                    </c:choose>
                </c:forEach>
        	<c:if test="${pi.maxPage ne pi.endPage}">
        		<li><a href="">&gt;</a></li>
        	</c:if>
           </ul>
		</div>
        <br><br>
        <hr>
		<br>
        <div class="certificate">
            <h6><b>증명서 신청</b></h6>
            <br>
            <p style="font-size:10pt"><img src="resources/icons/info.png" width="16"> 기본 인사정보가 모두 등록되어 있어야 다운받으실 수 있습니다.</p>

            <button class="certificate-docs btn-outline-purple" id="employment-doc">재직증명서 신청<img src="resources/icons/download.png"></button>
            <br>
            <button class="certificate-docs btn-outline-purple" id="career-doc">경력증명서 신청<img src="resources/icons/download.png"></button>
        </div>
        <br><br>

        <div id="empl-doc-area" style="display:none;">
            <table border="1" style="width:800px;" id="empl-doc">
                <tr>
                    <th width="100px;">성명</th>
                    <td width="300px;">${loginUser.userName}</td>
                    <th width="100px;">생년월일</th>
                    <td width="300px;">${loginUser.birthday}</td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td colspan="3">${loginUser.address}</td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td>${loginUser.phone}</td>
                    <th>부서</th>
                    <td>${loginUser.department}</td>
                </tr>
                <tr>
                    <th>입사일자</th>
                    <td>${loginUser.hireDate}</td>
                    <th>직책</th>
                    <td>${loginUser.position}</td>
                </tr>
                <tr>
                    <th>용도</th>
                    <td colspan="3">제출용</td>
                </tr>
                <tr>
                    <td colspan="4" id="empl-content">
                    </td>
                </tr>
            </table>
        </div>

        <div id="career-doc-area" style="display:none;">
            <table border="1" style="width:800px;" id="car-doc">
                <tr>
                    <th width="100px;">성명</th>
                    <td width="300px;">${loginUser.userName}</td>
                    <th width="100px;">생년월일</th>
                    <td width="300px;">${loginUser.birthday}</td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td colspan="3">${loginUser.address}</td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td>${loginUser.phone}</td>
                </tr>
                <tr>
                    <th>재직 시 부서</th>
                    <td>${loginUser.department}</td>
                    <th>재직 시 직책</th>
                    <td>${loginUser.position}</td>
                </tr>
                <tr>
                    <th>재직기간</th>
                    <c:choose>
                        <c:when test="${not empty loginUser.resignDate}">
                            <td colspan="3">${loginUser.hireDate} ~ ${loginUser.resignDate}</td>
                        </c:when>
                        <c:otherwise>
                            <td colspan="3">${loginUser.hireDate} ~ 재직중</td>
                        </c:otherwise>
                    </c:choose>
                </tr>
                <tr>
                    <th>용도</th>
                    <td colspan="3">제출용</td>
                </tr>
                <tr>
                    <td colspan="4" id="car-content">
                    </td>
                </tr>
            </table>
        </div>

        <script>
            $(function(){
                let today = new Date();   
                let year = today.getFullYear(); // 년도
                let month = today.getMonth() + 1;  // 월
                let date = today.getDate();  // 날짜

                let emplValue = "<br><br><br><br><br><br>상기와 같이 재직하고 있음을 증명합니다. <br><br><br>";
                    emplValue += year + "년 " + month + "월 " + date + "일 <br><br><br><br><br><br><br>";
                    emplValue += "회사명 : (주)PPIC <br><br><br>";
                    emplValue += "주소 : 서울시 금천구 가산디지털1로 151 세진 이노플렉스, 306호 <br><br><br>";
                    emplValue += "대표자 : 강보람 &nbsp&nbsp&nbsp(인) <br><br><br><br><br><br><br>";
                $("#empl-content").html(emplValue);

                let careerValue = "<br><br><br><br><br><br>상기와 같이 경력사항이 있음을 증명합니다. <br><br><br>";
                    careerValue += year + "년 " + month + "월 " + date + "일 <br><br><br><br><br><br><br>";
                    careerValue += "회사명 : (주)PPIC <br><br><br>";
                    careerValue += "주소 : 서울시 금천구 가산디지털1로 151 세진 이노플렉스, 306호 <br><br><br>";
                    careerValue += "대표자 : 강보람 &nbsp&nbsp&nbsp(인) <br><br><br><br><br><br><br>";
                $("#car-content").html(careerValue);

            })
        </script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
        <script src="https://cdn.tutorialjinni.com/jspdf-autotable/3.5.23/jspdf.plugin.autotable.js"></script>
        <script type="module">
            import {_fonts} from '/ppic/resources/js/gulim.js';
            
            // 재직증명서
            $("#employment-doc").click(function(){

                // PDF 그리기
                window.jsPDF = window.jspdf.jsPDF;
                var doc = new jspdf.jsPDF("p", "mm", "a4");
                doc.addFileToVFS('malgun.ttf', _fonts);
                doc.addFont('malgun.ttf','malgun', 'normal');
                doc.setFont('malgun');
                doc.text(15, 30, '재직증명서'); // 글씨입력(시작x, 시작y, 내용)
                doc.line(15, 40, 195, 40); // 선그리기(시작x, 시작y, 종료x, 종료y)
                doc.autoTable({
                    html: '#empl-doc',
                    theme: 'plain',
                    startY: 50,
                    styles: {
                    font: 'malgun',
                    fontStyle: 'normal'
                    }})

                var info = new Image();
                info.src = '/ppic/resources/company_images/company_signature.png';
                info.onload = function(){
                    doc.addImage(info, 'PNG', 43, 176, 10, 10);
                    doc.save('재직증명서.pdf');  //결과 출력
                }

            })

            // 경력증명서
            $("#career-doc").click(function(){

                // PDF 그리기
                window.jsPDF = window.jspdf.jsPDF;
                var doc = new jspdf.jsPDF("p", "mm", "a4");
                doc.addFileToVFS('malgun.ttf', _fonts);
                doc.addFont('malgun.ttf','malgun', 'normal');
                doc.setFont('malgun');
                doc.text(15, 30, '경력증명서'); // 글씨입력(시작x, 시작y, 내용)
                doc.line(15, 40, 195, 40); // 선그리기(시작x, 시작y, 종료x, 종료y)
                doc.autoTable({
                    html: '#car-doc',
                    theme: 'plain',
                    startY: 50,
                    styles: {
                    font: 'malgun',
                    fontStyle: 'normal'
                    }})

                var info = new Image();
                info.src = '/ppic/resources/company_images/company_signature.png';
                info.onload = function(){
                    doc.addImage(info, 'PNG', 43, 183, 10, 10);
                    doc.save('경력증명서.pdf');  //결과 출력
                }

            })
        </script>

	</div>
	
</body>
</html>