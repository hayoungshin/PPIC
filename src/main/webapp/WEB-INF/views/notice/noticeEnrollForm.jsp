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
    input[type=text], .drop-zone{
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
    .drop-zone{
        height: 70px;
        padding:5px;
        overflow: auto;
    }
    .drop-zone-dragenter, .drop-zone-dragover {
        background:lightgray;
    }
    .uploadfile{
    	margin:0px;
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
        <br><h5><b>공지사항 작성</b></h5><br>
        <form action="insert.no" method="post" enctype="multipart/form-data">
        <input type="hidden" name="noticeWriter" value="${ loginUser.userNo }"> 
            <table>
                <tr>
                    <td width="100">제목</td>
                    <td><input type="text" id="noticeTitle" name="noticeTitle" placeholder="제목을 입력해주세요." required></td>
                </tr>
                <tr>
                    <td>
                        첨부파일
                    </td>
                    <td>
                        <button type="button" id="upfile-btn" onclick="$('#upfile').click();">파일 첨부</button>
                        <input multiple type="file" id="upfile" name="upfile" style="display:none;"/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <div class="drop-zone">
                        또는 파일을 여기로 드래그 하세요.
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top;">내용</td>
                    <td>
                        <textarea id="summernote" name="noticeContent" class="require" required></textarea>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="checkbox" id="important" name="important">
                        <label for="important">중요</label>
                    </td>
                </tr>
            </table>
            <div align="center">
                <button type="button" class="btn" id="cancel-btn">취소</button>
                <button type="submit" class="btn" id="enroll-btn">작성</button>
            </div>
        </form>
    </div> 
    <script>
	  $(function(){
	      $('#summernote').summernote({
	          height: 200,                 // 에디터 높이
	          minHeight: 500,             // 최소 높이
	          maxHeight: 500,             // 최대 높이
	          lang: "ko-KR",					// 한글 설정
	          placeholder: '내용을 입력해주세요.'	//placeholder 설정
	      });
	  });
	</script>
	
    <script>
	    (function() {
	        var $file = document.getElementById("upfile")
	        var dropZone = document.querySelector(".drop-zone")
	        var toggleClass = function(className) {
	
	            var list = ["dragenter", "dragleave", "dragover", "drop"]
	
	            for (var i = 0; i < list.length; i++) {
	                if (className === list[i]) {
	                    dropZone.classList.add("drop-zone-" + list[i])
	                } else {
	                    dropZone.classList.remove("drop-zone-" + list[i])
	                }
	            }
	        }
	        var showFiles = function(files) {
	            dropZone.innerHTML = ""
	            for(var i = 0, len = files.length; i < len; i++) {
	                dropZone.innerHTML += "<p class='uploadfile'>" + files[i].name + "</p>"
	            }
	        }
	        var selectFile = function(files) {
	            // input file 영역에 드랍된 파일들로 대체
	            $file.files = files
	            showFiles($file.files)
	        }
	        $file.addEventListener("change", function(e) {
	            showFiles(e.target.files)
	        })
	        // 드래그한 파일이 최초로 진입했을 때
	        dropZone.addEventListener("dragenter", function(e) {
	            e.stopPropagation()
	            e.preventDefault()
	            toggleClass("dragenter")
	        })
	
	        // 드래그한 파일이 dropZone 영역을 벗어났을 때
	        dropZone.addEventListener("dragleave", function(e) {
	            e.stopPropagation()
	            e.preventDefault()
	            toggleClass("dragleave")
	        })
	
	        // 드래그한 파일이 dropZone 영역에 머물러 있을 때
	        dropZone.addEventListener("dragover", function(e) {
	            e.stopPropagation()
	            e.preventDefault()
	            toggleClass("dragover")
	        })
	
	        // 드래그한 파일이 드랍되었을 때
	        dropZone.addEventListener("drop", function(e) {
	            e.preventDefault()
	
	            toggleClass("drop")
	
	            var files = e.dataTransfer && e.dataTransfer.files
	
	            if (files != null) {
	                if (files.length < 1) {
	                    alert("폴더 업로드 불가")
	                    return
	                }
	                selectFile(files)
	            } else {
	                alert("ERROR")
	            }
	        })
	    })();
	</script>

</body>
</html>