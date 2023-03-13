<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* table 스타일 */
    .boardOuter td{
        padding:10px; 
        font-size:14px;
    }
    .line{
        border-bottom:1px solid lightgray;
    } 

    /* button 스타일 */
    #list-btn, #update-btn, #modal-btn, #delete-btn, #exit-btn{
        color:white;
        width:70px;
        height:30px;
        font-size: 12px;
        background: rgb(190, 190, 190);
    }
    #update-btn, #delete-btn, #modal-btn{background: rgb(111, 80, 248);}
    a:hover{opacity: 0.7;}
    
    .pro{
    	display:inline-block;
        width: 25px;
        height: 25px;
        background: rgb(111, 80, 248);
        color: white;
        border: none;
        border-radius: 5px;
        font-size: small;
        text-align:center;
        line-height:25px;
	}
	#profileImg{
		height:25px;
		width:25px;
		border-radius: 5px;
	}
</style>
</head>
<body>

	<jsp:include page="../board/boardMenubar.jsp"/>

	<script>
        document.getElementsByClassName("menus")[0].className += ' clicked';
        let changeArr = [];
 	     let origin = "";
 	     $(function(){
 		     $("input[name=origin]").val(origin);
 		     $("input[name=change]").val(changeArr);
 	     })
    </script>
    <br>
    <div class="boardOuter">
        <table>
            <tr>
                <td colspan="3" width="1200px"><h5>${ n.noticeTitle }</h5></td>
            </tr>
            <tr class="line">
                <td colspan="2">
                	<c:choose>
                		<c:when test="${ empty n.profileImg }">
                			<span class="pro">${ fn:substring(n.noticeWriter,0,1) } </span> 
                		</c:when>
                		<c:otherwise>
                			<img src="${ n.profileImg }" id="profileImg">
                		</c:otherwise>
                	</c:choose>
                    ${ n.noticeWriter } &nbsp;
                    ${ n.createDate }
                </td>
                <td><div align="right">조회수 ${ n.count }</div></td>
            </tr>
            <!-- 첨부파일 있을 경우 -->
            <c:if test="${ not empty n.attList }">
	        	<tr>
		           	<td style="width:120px; vertical-align:top;">첨부파일 <b>${ n.attachmentCount }</b>개</td>
	                <td colspan="2">
		                <c:forEach var="a" items="${ n.attList }">
		          			<c:if test="${ a.categoryNo eq 2 }">
		                    	${ a.originName } <a href="${ a.changeName }" download="${ a.originName }"><img src="resources/icons/download.png" height="15px" width="15px"></a><br>
		                    	<script>
		                    		origin = "${a.originName}";
			                		changeArr.push("${ a.changeName }");
			                	</script>
		                	</c:if>
		                </c:forEach>
	                </td>
	            </tr> 
            </c:if>
            <tr>
                <td colspan="3">${ n.noticeContent }</td>
            </tr>
        </table>
        
        <form action="" method="post" id="postForm">
        	<input type="hidden" name="no" value="${ n.noticeNo }">
        	<input type="hidden" name="origin">
        	<input type="hidden" name="change">
        </form>
        
        <script>
        	function postFormSubmit(num){
        		if(num == 1){
        			$("#postForm").attr("action", "updateForm.no").submit();
        		} else{
        			$("#postForm").attr("action", "delete.no").submit();
        		}
        	}
        </script>
        
        <div align="center" style="width:1200px;">
            <a class="btn" id="list-btn" onclick="history.back();">목록</a>
            <!-- 수정/삭제 관리자만 보여짐 -->
            <a class="btn" id="update-btn" onclick="postFormSubmit(1)">수정</a>
            <a class="btn" id="modal-btn" data-toggle="modal" data-target="#deleteModal">삭제</a>
        </div>
        <!-- 삭제 확인용 Modal -->
        <div class="modal" id="deleteModal" data-backdrop='static' data-keyboard='false'>
            <div class="modal-dialog modal-dialog-centered modal-sm">
            <div class="modal-content">
                <div class="modal-body">
                <b>나의 게시글 삭제</b> <br><br>
                <div align="center">
                    삭제하시겠습니까?<br><br>
                    <a class="btn" data-dismiss="modal" id="exit-btn">취소</a>
                    <a class="btn" id="delete-btn" onclick="postFormSubmit(2);">확인</a>
                </div>
                </div>
            </div>
            </div>
        </div>
    </div>

</body>
</html>