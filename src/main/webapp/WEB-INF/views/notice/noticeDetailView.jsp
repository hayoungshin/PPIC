<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</style>
</head>
<body>

	<jsp:include page="../board/boardMenubar.jsp"/>

	<script>
        document.getElementsByClassName("menus")[0].className += ' clicked';
    </script>
    <br>
    <div class="boardOuter">
        <table>
            <tr>
                <td colspan="3" width="1200px"><h5>${ n.noticeTitle }</h5></td>
            </tr>
            <tr class="line">
                <td colspan="2">
                    <img src="resources/icons/profile.jpg" class="rounded-circle" width="25" height="25">
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
		                	</c:if>
		                </c:forEach>
	                </td>
	            </tr> 
            </c:if>
            <tr>
                <td colspan="3">${ n.noticeContent }</td>
            </tr>
        </table>
        <div align="center" style="width:1200px;">
            <a href="" class="btn" id="list-btn">목록</a>
            <!-- 수정/삭제 관리자만 보여짐 -->
            <a href="" class="btn" id="update-btn">수정</a>
            <a href="" class="btn" id="modal-btn" data-toggle="modal" data-target="#deleteModal">삭제</a>
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
                    <a href="" class="btn" id="delete-btn">확인</a>
                </div>
                </div>
            </div>
            </div>
        </div>
    </div>

</body>
</html>