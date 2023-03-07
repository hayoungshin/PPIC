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
    .boardOuter td{padding-bottom:10px;}

    /* input 스타일 */
    input[type=text], #upfileList{
        width: 1200px;
        border: 1px solid rgb(202, 199, 199);
        border-radius: 5px;
    }
    #noticeTitle{height:30px;}
    input[type=checkbox]{
        width:10px;
        height:10px;
        margin-right:5px;
    }

    /* upfile 스타일 */
    #upfileList{
        height: 70px;
        padding:5px;
        overflow: auto;
    }

    /* button 스타일 */
    #upfile-btn{
        color:white;
        height:25px;
        width:60px;
        border:none;
        border-radius: 3px;
        padding:0;
        background: rgb(190, 190, 190);
    }

    #cancel-btn, #enroll-btn{
        background: rgb(190, 190, 190);
        color:white;
        width:70px;
        height:30px;
        font-size: 12px;
    }
    #enroll-btn{background: rgb(111, 80, 248);}
    
    .boardOuter button:hover{opacity: 0.7;}
</style>
</head>
<body>
	
	<jsp:include page="../board/boardMenubar.jsp"/>
	
	<!-- include summernote css/js-->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	
	<script>
	   document.getElementsByClassName("menus")[0].className += ' clicked';
	</script>
	
	<div class="boardOuter">
        <br><h5><b>공지사항 수정</b></h5><br>
        <form action="" method="post" enctype="">
            <table>
                <tr>
                    <td width="100">제목</td>
                    <td><input type="text" id="noticeTitle" name="" value="[공지] 회의실 노트북 패스워드 변경 작업 안내" required></td>
                </tr>
                <tr>
                    <td>
                        첨부파일
                        <img src="resources/icons/down-arrow.png" height="15px" width="15px" class="fileView" data-toggle="collapse" data-target="#upfileList">
                    </td>
                    <td>
                        <button type="button" id="upfile-btn">파일 첨부</button>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <div id="upfileList" class="collapse">
                            noticeFile.pdf <br>
                            noticeFile2.pdf
                        </div> 
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top;">내용</td>
                    <td>
                        
                        <textarea id="summernote" name="" class="require" required>내용내용</textarea>
                    
                    <script>
                        $(function(){
                            $('#summernote').summernote({
                                height: 200,                 // 에디터 높이
                                minHeight: 500,             // 최소 높이
                                maxHeight: 500,             // 최대 높이
                                lang: "ko-KR"					// 한글 설정
                            });
                        });
                    </script>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="checkbox" id="important" name="">
                        <label for="important">중요</label>
                    </td>
                </tr>
                <!-- 중요 여부 체크 반영 -->
            </table>
            <div align="center">
                <button type="button" class="btn" id="cancel-btn">취소</button>
                <button type="submit" class="btn" id="enroll-btn">수정</button>
            </div>
        </form>
    </div> 
    <script>
        $(".fileView").click(function(){
            if($(this).attr("src") == "resources/icons/down-arrow.png"){
                $(this).attr("src", "resources/icons/up-arrow.png");
            } else{
                $(this).attr("src", "resources/icons/down-arrow.png");
            }
        })
    </script>
	
</body>
</html>