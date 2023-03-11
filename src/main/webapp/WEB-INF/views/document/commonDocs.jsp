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
   .edit-btn, .edit-btn:hover{
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
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />
	
	<div id="content">
		<h3 class="title"><b>문서ㆍ증명서</b></h3>
        <br><br>
        <div class="sub-menu">
             <a href="commonList.doc" class="active">회사문서</a>
             <a href="myList.doc">내 문서</a>
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
	                    <td>
	                    	${d.docName}
	                    	<%-- <c:if test="${loginUser eq 관리자}" 로그인 구현 후 추가해야 함--%>
	                    	<img src="resources/icons/edit.png" width="20" class="edit-btn" data-toggle="modal" data-target="#editModal${d.docNo}">
                            <input type="hidden" name="editDocNo" id="editDocNo" value="${d.docNo}">
	                    </td>
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
        <h1><c:out value="${editDocNo}" /></h1>

        <br><br>
        
        <script>
            $(".edit-btn").click(function(){
                var no = $(this).next().val();
                
            })
        </script>
        
        <c:forEach var="d" items="${list}">
            <div class="modal fade" id="editModal${d.docNo}">
                <div class="modal-dialog">
                <div class="modal-content">
            
                    <div class="modal-header">
                    <h4 class="modal-title">문서 수정</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <form method="post" enctype="multipart/form-data" id="updateForm${d.docNo}">
                        <div class="modal-body">
                            * 문서 이름 : <input type="text" name="docName" placeholder="문서명을 입력해주세요." value="${d.docName}" required>
                            <br><br>
                            파일 첨부 : <input type="file" name="reUpfile">
                            <br><br>
                            현재 파일 : <a href="${d.savePath}" download="${d.originName}">${d.originName}</a>
                            <input type="hidden" name="savePath" value="${d.savePath}">
                            <input type="hidden" name="originName" value="${d.originName}">
                            <input type="hidden" name="docNo" value="${d.docNo}">
                            <input type="hidden" name="createUser" value="1">
                        </div>

                        <div class="modal-footer">
                            <a class="btn btn-outline-danger" onclick="deleteSubmit('${d.docNo}');">삭제</a>
                            <a class="btn btn-primary" onclick="updateSubmit('${d.docNo}');">수정</a>
                        </div>
                    </form>
                </div>
                </div>
            </div>
        </c:forEach>

        <script>
            function updateSubmit(num){
                    $("#updateForm" + num).attr("action", "updateCommon.doc").submit();
            }

            function deleteSubmit(num){
                if(confirm("정말 삭제하시겠습니까?")){
                    $("#updateForm" + num).attr("action", "deleteCommon.doc?no=" + num).submit();
                }
            }
        </script>

        <!-- 문서 수정 스크립트 -->
        <!-- <script>
            let reUpfile = "";

            $("#reUpfile").change(function(){
                reUpfile = this.files[0];
            })

            $("#updateBtn").click(function(){
                let formData = new FormData();

                let docNo = $("#update-docNo").val();
                let docName = $("#update-docName").val();
                let originalFile = $("#originalFile").text();
                let createUser = $("#update-user").val();
                let originSavePath = $("#origin-savePath").val();

                formData.append("docNo", docNo);
                formData.append("docName", docName);
                formData.append("originalFile", originalFile);
                formData.append("createUser", createUser);
                formData.append("reUpfile", reUpfile);
                formData.append("originSavePath", originSavePath);
                
                $.ajax({
                        url:"updateCommon.doc",
                        data:formData,
                        processData:false,
                        contentType:false,
                        type:"POST",
                        success:function(result){
                            if(result == "success"){
                                alert("수정되었습니다.");
                            }
                        },error:function(){
                            console.log("실패");
                        }
                    })

            }) -->
            
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
                <form action="insertCommon.doc" method="post" enctype="multipart/form-data">
                    <div class="modal-body">
                        * 문서 이름 : <input type="text" name="docName" placeholder="문서명을 입력해주세요." required>
                        <br><br>
                        파일 첨부 : <input type="file" name="upfile">
                        <input type="hidden" name="docType" value="1">
                        <input type="hidden" name="createUser" value="1"><%-- 로그인 구현 완료 시 ${loginUser.userNo}--%>
                    </div>
            
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn-purple">등록</button>
                    </div>
                </form>
        
            </div>
            </div>
        </div>

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
	
</body>
</html>