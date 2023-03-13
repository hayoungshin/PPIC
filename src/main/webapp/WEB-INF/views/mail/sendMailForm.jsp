<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 테이블 줄 높이 지정 */
	#mail-send-form tr{
		height:40px;
	}
	.reciever-list input{
		width:1000px; height:30px;
		border: 1px solid rgb(200,200,200);
		border-radius:5px;
	}
	.reciever-name{
		border:none;
		border-radius:10px;
		background:#FFCECE;
	}
	.reciever-name:hover{
		background:#f6c1c1;
		font-weight:500;
		color: rgb(60, 60, 60);
	}
	
	/* 주소록 버튼 */
	.reciever-list{
		position:relative;
	}
	#address-btn {
		position:absolute;
		cursor:pointer;
		height:23px;
		margin:3px 15px;
		font-size:12px;
		right:0;
		border:1px solid rgb(230,230,230);
		background:none;
	}
	#address-btn:hover{
		background:rgb(230,230,230);
	}

	/* 파일첨부 */
	.input-file-btn{
		border-radius:5px;
		background:rgb(230,230,230);
		margin:5px 0px;
		padding:3px 5px;
		font-size:13px;
	}
	.input-file-btn:hover{
		cursor:pointer;
		font-weight: 600;
		background:rgb(220,220,220);
	}
	#input-file-area{
		border:1px solid rgb(220,220,220);
		border-radius:5px;
		margin: 0px;
		padding:5px;
	}
	.input-file-list{
		margin:5px;
		font-size:13px;
	}
	.input-file-list:hover{
		cursor:pointer;
		font-weight:600;
	}
	.drag-enter{
		background: rgba(230, 230, 230, 0.543);
	}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="outer">
		<div id="content">
		
		<div style="display:inline-block; margin-bottom:40px;">
			<span style="font-size:30px;">메일</span>
		</div>

		<form action="" style="padding:0px 20px;">

			<button class="btn-purple" style="font-size:13px; padding:3px 10px; margin:0 5px;">보내기</button>
			<button type="button" style="font-size:13px; padding:3px 10px;  margin:0 5px;">임시저장</button>
			<button type="button" style="font-size:13px; padding:3px 10px;  margin:0 5px;">미리보기</button>

			<table border="1" style="margin:20px 0; font-size:14px;" id="mail-send-form">
				<tr>
					<th colspan="2" style="width:150px;">받는사람</th>
					<td class="reciever-list" style="width:1200px;">
						<button class="reciever-name">
							신하영 &ltuser01@ppic.kr&gt
							<img src="resources/icons/close.png" style="width:7px; margin-bottom:3px;">
						</button>
						<input type="text">
						<button id="address-btn">주소록</button>
					</td>
				</tr>
				<tr>
					<th>참조</th>
					<td></td>
					<td class="reciever-list">
						<button class="reciever-name">
							신하영 &ltuser01@ppic.kr&gt
							<img src="resources/icons/close.png" style="width:7px; margin-bottom:3px;">
						</button>
						<input type="text">
						<button id="address-btn">주소록</button>
					</td>
				</tr>
				<tr>
					<th colspan="2">숨은참조</th>
					<td class="reciever-list">
						<button class="reciever-name">
							신하영 &ltuser01@ppic.kr&gt
							<img src="resources/icons/close.png" style="width:7px; margin-bottom:3px;">
						</button>
						<input type="text">
						<button id="address-btn">주소록</button>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td style="width:50px; font-size:11px;">
						<input type="checkbox" id="important-check" style="vertical-align: middle;">
						<label for="important-check" style="margin:0;">중요</label>
					</td>
					<td>
						<input type="text" style="width:1190px; height:30px; border: 1px solid rgb(200,200,200); border-radius:5px;">
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						
					</td>
					<td class="reciever-list">
						<label class="input-file-btn">
							파일첨부
							<input type="file" onchange="loadFiles(this);" style="display:none;" multiple>
						</label>
						
						<div id="input-file-area">
							<p class="input-file-list">
								<img src="resources/icons/close.png" style="width:7px; margin-bottom:3px;"> 하이하이.pdf
							</p>
							<p class="input-file-list">
								<img src="resources/icons/close.png" style="width:7px; margin-bottom:3px;"> 하잉.xls
							</p>
						</div>
					</td>
				</tr>
			</table>

			<script>
				const fileArea = document.getElementById("input-file-area");

				function loadFiles(inputFile) {
					console.log("파일변경");
					console.log(inputFile.files);
					/* 파일첨부 -> 리스트 출력 */
					for(let i=0; i<inputFile.files.length; i++){
						fileArea.innerHTML += "<p class='input-file-list'>" + "<img src='resources/icons/close.png' style='width:7px; margin-bottom:3px'> " + inputFile.files[i].name + "</p>"
					}
                }

				fileArea.addEventListener("dragenter",function(e){
					e.preventDefault();
					console.log(e);
					console.log('파일닿았따!!!');
					fileArea.className = "drag-enter";
				})
				fileArea.addEventListener("dragover",function(e){
					e.preventDefault();
					console.log(e);
					console.log('...');
					fileArea.className = "drag-enter";
				})
				fileArea.addEventListener("dragleave",function(e){
					e.preventDefault();
					console.log("파일 나감");
					fileArea.classList.remove("drag-enter");
				})
				fileArea.addEventListener("drop",function(e){
					e.preventDefault();
					fileArea.classList.remove("drag-enter");
					console.log(e.dataTransfer.files);
				})

			</script>



		</form>
		
		</div>
	</div>

</body>
</html>