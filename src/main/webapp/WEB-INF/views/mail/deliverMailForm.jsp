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
	.td{
		width:1100px;
		border-bottom:1px solid rgb(200,200,200);
	}
	.td input{
		width:1000px; height:30px;
		border: none;
		border-radius:5px;
	}
	.recipient-btn{
		border:none;
		border-radius:10px;
		margin:2px;
		background:#FFCECE;
	}
	.recipient-btn:hover{
		background:#f6c1c1;
		font-weight:500;
		color: rgb(60, 60, 60);
	}
	
	/* 주소록 버튼 */
	.td{
		position:relative;
	}
	.address-btn {
		position:absolute;
		cursor:pointer;
		height:23px;
		margin:3px 15px;
		font-size:12px;
		right:0;
		border:1px solid rgb(230,230,230);
		background:white;
	}
	.address-btn:hover{
		background:rgb(230,230,230);
	}

	/* 파일첨부 */
	.file-btn{
		border-radius:5px;
		background:rgb(230,230,230);
		margin:5px 0px;
		padding:3px 5px;
		font-size:13px;
	}
	.file-btn:hover{
		cursor:pointer;
		font-weight: 600;
		background:rgb(220,220,220);
	}
	#file-list{
		border:1px solid rgb(220,220,220);
		border-radius:5px;
		margin: 0px;
		padding:5px;
	}
	.files{
		margin:5px;
		font-size:13px;
	}
	.files:hover{
		cursor:pointer;
		font-weight:600;
	}
	.drag-enter{
		background: rgba(230, 230, 230, 0.543);
	}


	/* 모달 관련 */
	#mail-address-modal{
        height:500px;
    }
    #mail-address-modal>div{
        border-right: 1px solid rgb(200,200,200);
        float: left;
        height:95%;
        padding:10px;
    }
    #mail-address-group p, #mail-address-detail div, #all-adr{
        margin:10px 0;
        font-size: 14px;
        cursor:pointer;
    }
    #mail-address-list{height:380px; overflow:auto;}
    #mail-address-group p:hover, #mail-address-list div:hover, #all-adr:hover{
    	font-weight:600;
    }
    #mail-address-modal .header{
        cursor: pointer;
        font-size: 15px;
        font-weight:600;
        height:25%;
        padding: 10px;
    }
    #mail-address-group .dept-selected{font-weight:600;}
    
    .select-area{height:33.3%;}
    #mail-address-modal .selected-list{
        height:75%;
        padding:0px 10px;
        overflow:auto;
    }
    .selected-list li{
        margin:2px 0;
        font-size: 14px;
        width:265px;
        display:inline-block;
    }
    .selected-list button{
        height:25px;
        border:0;
        background:none;
        padding: 1px 10px;
        float: right;
    }
    .selected-list img{
        width:7px;
    }
    #mail-address-modal .selected{
        border:1.5px solid #00b5d1;
    }
    
    /* 자동완성 */
    .td{
    	position:relative;
    }
    .autocomplete-area{
    	position:absolute;
    	max-height:150px;
    	width:400px;
    	z-index:3;
    	background:white;
    	border:1px solid rgb(200,200,200);
    	border-radius:5px;
    	overflow:auto;
    }
    .autocomplete-items{padding:2px 5px; margin:0;}
    .autocomplete-items:hover{
    	cursor:pointer;
    	background:rgb(230,230,230);
    }
    input:focus {outline:none;}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="outer">
		<div id="content">
		<h2 style="display:inline-block; margin-bottom: 40px;"><b>메일</b></h2>
		<form id="sendMailForm" method="post" action="send.ml" enctype="multipart/form-data" style="padding:0px 20px;">
		
			<input type='hidden' name="recipientMail" id="recipientMail" value="">
			<input type='hidden' name="refMail" id="refMail" value="">
			<input type='hidden' name="hidRefMail" id="hidRefMail" value="">
			<input type='hidden' name="recipientNo" id="recipientNol" value="">
			<input type='hidden' name="refNo" id="refNo" value="">
			<input type='hidden' name="hidRefNo" id="hidRefNo" value="">
			
			<button type="button" class="btn-purple" style="font-size:13px; padding:3px 10px; margin:0 5px;" onclick="submitForm();">보내기</button>
			<button type="button" style="font-size:13px; padding:3px 10px;  margin:0 5px;">임시저장</button>
			<button type="button" style="font-size:13px; padding:3px 10px;  margin:0 5px;">미리보기</button>

			<table style="margin:20px 0; font-size:14px;" id="mail-send-form">
				<tr id="recipient-area">
					<th colspan="2" style="width:150px;">받는사람</th>
					<td class="td">
						<span class="span" id="recipient"></span>
						<input type="text" class="mailInput" onkeyup="selectAutoComplete(0, this);" placeholder="메일 주소 사이에 콤마(,) 또는 세미콜론(;)으로 구분하여 입력하세요">
						<button type="button" class="address-btn" data-toggle="modal" data-target="#myModal">주소록</button>
						<div class="autocomplete-area" style="display:none;"></div>
					</td>
				</tr>
				<tr id="ref-area">
					<th colspan='2'>참조</th>
					<td class="td">
						<span class="span" id="ref"></span>
						<input class="mailInput" onkeyup="selectAutoComplete(1, this);" type="text">
						<button type="button" class="address-btn" data-toggle="modal" data-target="#myModal">주소록</button>
						<div class="autocomplete-area" style="display:none;"></div>
					</td>
				</tr>
				<tr id="hid-ref-area">
					<th colspan="2">숨은참조</th>
					<td class="td">
						<span class="span" id="hid-ref"></span>
						<input class="mailInput" onkeyup="selectAutoComplete(2, this);" type="text">
						<button type="button" class="address-btn" data-toggle="modal" data-target="#myModal">주소록</button>
						<div class="autocomplete-area" style="display:none;"></div>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td style="width:50px; font-size:11px;">
						<input type="checkbox" id="important-check" name="important" style="vertical-align: middle;">
						<label for="important-check" style="margin:0;">중요</label>
					</td>
					<td class="td">
						<input type="text" name="mailTitle" style="height:30px; border:none;" value="FW: ${ m.mailTitle }">
					</td>
				</tr>
				<tr>
					<th colspan="2">첨부파일</th>
					<td>
						<label class="file-btn">
							파일첨부
							<input type="file" id="upfiles" name="upfiles" onchange="loadFiles(this);" style="display:none" multiple>
						</label>
						
						<div id="file-list">
						
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="3" style="padding-top:30px;">
						<textarea id="summernote" name="mailContent">
							<br>----- Original Message -----<br>
							<b>From : </b>${ m.senderMail }<br>
							<b>To : </b>${ m.recipientMail }<br>
							<b>Cc : </b>${ m.refMail }<br>
							<b>Sent : </b>${ m.sentDate }<br>
							<b>Subject : </b>${ m.mailContent }
						</textarea>
					</td>
				</tr>
			</table>
			
			<!-- 파일 첨부 관련 -->
			<script>

				const dataTransfer = new DataTransfer();				// 나름 FileList 객체 (Array에 있는걸 다시 옮겨 담기 위한 용도)
				const fileList = document.getElementById("file-list");	// 파일 원본명 뿌릴 영역
				$(function(){
					console.log(${list});
				})
				
				/* 1. 파일 입력 */
				function loadFiles(inputFile) {
					// 리스트 출력
					for(let file of inputFile.files){
						fileList.innerHTML += "<p class='files'>" + "<img src='resources/icons/close.png' style='width:7px; margin-bottom:3px'> " + file.name + "</p>"
						// DataTransfer에 담기
						dataTransfer.items.add(file);
					}
					// 파일배열 input요소에 담기
					$("#upfiles")[0].files = dataTransfer.files;
                }
				
				/* 2. 파일 삭제 */
				$(document).on("click", ".files", function(e){
					
					// input type="file"에 multiple 속성을 사용할 경우
		            // 선택된 파일들에 접근하면 FileList로 처리됨
		            let files = $("#upfiles")[0].files;	// 선택된 파일들  (FileList)
		            let fileArr = Array.from(files);	// 파일들을 배열로 변환 (즉, FileList => Array)

					for(let i=0; i<fileArr.length; i++){
						// 클릭한 요소의 innerText에 이름이 포함되어있는 배열요소 삭제
						if(e.target.innerText.includes(fileArr[i].name)){
							fileArr.splice(i,1);
							e.target.remove();
						}
					}
		            
				 	dataTransfer.clearData(); // 한번 비워주고
			        
		            // 제거가 다 끝난 Array => FileList로 다시 변환 
		            fileArr.forEach(function(file){
		                dataTransfer.items.add(file);
		            })
			        
		            // FileList를 다시 input요소에 담기
		            $("#upfiles")[0].files = dataTransfer.files;
				})

				/* 드래그 앤 드롭 */
				fileList.addEventListener("dragenter",function(e){	// 파일 닿음
					e.preventDefault();
					fileList.className = "drag-enter";
				})
				fileList.addEventListener("dragover",function(e){
					e.preventDefault();
					fileList.className = "drag-enter";
				})
				fileList.addEventListener("dragleave",function(e){	// 파일 나감
					e.preventDefault();
					fileList.classList.remove("drag-enter");
				})
				/* 3. 드래그앤드롭으로 파일 입력 */
				fileList.addEventListener("drop",function(e){
					e.preventDefault();
					fileList.classList.remove("drag-enter");
					for(let file of e.dataTransfer.files){
						dataTransfer.items.add(file);
						fileList.innerHTML += "<p class='files'>" + "<img src='resources/icons/close.png' style='width:7px; margin-bottom:3px'> " + file.name + "</p>";
					}
					// 파일배열 input요소에 담기
					$("#upfiles")[0].files = dataTransfer.files;
				})
			</script>
			
			
			
			<!-- 자동완성 -->
			<script>
				/* 페이지 로딩되자마자 전체 회원의 이름, 메일주소, 회원번호 조회 */
				/* 				부서번호, 부서명, 멤버수 조회 : 모달창 script쪽 */
				$(function(){
					selectMemberList();
					selectMemCount();
				})
				
				let memArr = [];
				let autocompleteArea = document.getElementsByClassName("autocomplete-area");
				
				function selectMemberList(){
					$.ajax({
	        			url:"select.me",
	        			data:{},
	        			type:"post",
	        			success:function(mList){	//회원조회성공
	        				for(let i=0; i<mList.length; i++){
		        				memArr.push({
		        					name:mList[i].userName,
		        					mail:mList[i].mail,
		        					dept:mList[i].department,
		        					no:mList[i].userNo
		        				});
	        				}
	        				selectReplyTo();
	        			}, error:function(){
	        				console.log("회원조회용 ajax 통신실패")
	        			}
	        		})
				}
				
				// 메일주소들 담을 배열 : 이 값들을 ,로 연결해서 문자열로 Controller에 넘길 거임
				let arr0 = [];
				let arr1 = [];
				let arr2 = [];
				
				// 알림 보낼 회원번호 담을 배열
				let arrAlarm = [];
				
				function selectAutoComplete(type, e){
					/* 1. 키업때마다 자동완성 조회 */
					let result = "";
					let count = 0;
       				for(let i in memArr){
       					// 포함되어있을 경우 area에 추가
       					if(memArr[i].name.indexOf(e.value) != -1 || memArr[i].mail.indexOf(e.value) != -1){
       						count += 1;
       						result += "<p class='autocomplete-items' id='" + memArr[i].no + "'>"
        						   +	memArr[i].name + " " + "&lt" + memArr[i].mail + "&gt"
        						   + "</p>";
       					}
       					// 결과 있을 경우 area 보이게, 없을 경우 안보이게
       					if(count > 0){
       						autocompleteArea[type].style.display = "block";
       					} else {
       						autocompleteArea[type].style.display = "none";
       					}
       				}
       				autocompleteArea[type].innerHTML = result;
       				
       				/* 2. ,나 ; 입력시 배열에 추가되도록 */
       				const spans = document.getElementsByClassName("span");
       				let value = ""
       				if(e.value.includes(',') || e.value.includes(';')){
	       				let inputMail = e.value.substring(0, e.value.length-1);
       					let flag = false;
       					
       					for(let i in memArr){
           					// 자동완성 list에 일치하는 값이 있을 경우
           					if(memArr[i].mail == inputMail){
           						value = "<button class='recipient-btn' type='button'>"
	           					 	  + 	memArr[i].name + " " + "&lt" + memArr[i].mail + "&gt"
	  	           					  + 	" <img src='resources/icons/close.png' style='width:7px; margin-bottom:3px;'>"
	  	           					  + "</button>";
	           					// 배열에 값이 있는지 확인 후 
	           					if(type == 0 && !arr0.includes(inputMail)){	// 없으면 버튼으로 생성
	           						flag = true;
	           						arr0.push(inputMail);
	           						arrAlarm.push(memArr[i].no);
	           					} else if(type == 1 && !arr1.includes(inputMail)){
	           						flag = true;
	           						arr1.push(inputMail);
	           						arrAlarm.push(memArr[i].no);
	           					} else if(type == 2 && !arr2.includes(inputMail)){
	           						flag = true;
	           						arr2.push(inputMail);
	           						arrAlarm.push(memArr[i].no);
	           					}
           					}
           				}
       					if(flag){	// 텍스트상자 너비 조정
       						spans[type].innerHTML += value;
       						let newWidth = 1000 - spans[type].offsetWidth;
            				if(newWidth > 200) {
    	        				e.style.width = newWidth.toString() + "px";        					
            				} else {
            					e.style.width = "1000px"; 
            				}
            				document.getElementById("recipientMail").value = arr0.join(",");
							document.getElementById("refMail").value = arr1.join(",");
							document.getElementById("hidRefMail").value = arr2.join(",");
       						e.value = "";	// 텍스트 상자 비우기
       					} else {
       						e.value = "";
       					}
					}
				}
				
				$(document).on("click", ".autocomplete-items", function(e){
					let item = e.target;		// 이벤트 일어난 요소
					let html = item.innerHTML;	// 이름 <메일주소>
					let inputUserNo = item.getAttribute('id') // 회원번호 
					let recipientType = item.parentNode.parentNode.childNodes[1].id;	// recipient|ref|hid-ref
       				let inputMail = html.substring(html.indexOf(";") + 1, html.lastIndexOf("&"));	// 메일주소만
       				
       				let value = "<button class='recipient-btn' type='button'>"
       						  + 	html
       						  + 	" <img src='resources/icons/close.png' style='width:7px; margin-bottom:3px;'>"
       						  + "</button>";
        			
        			if(recipientType == 'recipient' && !arr0.includes(inputMail)){
        				// 버튼 추가, 너비조정
        				document.getElementById("recipient").innerHTML += value;
        				let newWidth = 1000 - document.getElementById("recipient").offsetWidth;
        				if(newWidth > 200) {
	        				item.parentNode.parentNode.childNodes[3].style.width = newWidth.toString() + "px";        					
        				} else {
        					item.parentNode.parentNode.childNodes[3].style.width = "1000px"; 
        				}
        				// 배열에 추가
        				arr0.push(inputMail);
        				arrAlarm.push(inputUserNo);
        			} else if(recipientType == 'ref' && !arr1.includes(inputMail)){
        				document.getElementById("ref").innerHTML += value;
        				let newWidth = 1000 - document.getElementById("ref").offsetWidth;
        				if(newWidth > 200) {
	        				item.parentNode.parentNode.childNodes[3].style.width = newWidth.toString() + "px";        					
        				} else {
        					item.parentNode.parentNode.childNodes[3].style.width = "1000px"; 
        				}
        				arr1.push(inputMail);
        				arrAlarm.push(inputUserNo);
        			} else if(recipientType == 'hid-ref' && !arr2.includes(inputMail)) {
        				document.getElementById("hid-ref").innerHTML += value;
        				let newWidth = 1000 - document.getElementById("hid-ref").offsetWidth;
        				if(newWidth > 200) {
	        				item.parentNode.parentNode.childNodes[3].style.width = newWidth.toString() + "px";        					
        				} else {
        					item.parentNode.parentNode.childNodes[3].style.width = "1000px"; 
        				}
        				arr2.push(inputMail);
        				arrAlarm.push(inputUserNo);
        			}
        				item.parentNode.parentNode.childNodes[3].value = "";	// 텍스트 상자 비우기
        		})
				
				$(document).on("click", function(e){
					//console.log(e.target);
					if(!$(e.target).hasClass("mailInput")){
						// mailInput 클래스를 갖고 있는 영역을 클릭했을 때 빼고 area 안보이게
						for(let i=0; i<autocompleteArea.length; i++){
							autocompleteArea[i].style.display = "none";
							// hidden 요소에 값 추가
							document.getElementById("recipientMail").value = arr0.join(",");
							document.getElementById("refMail").value = arr1.join(",");
							document.getElementById("hidRefMail").value = arr2.join(",");
						}
						//console.log(e.target.innerHTML);
					}
				})
				
			</script>

			
			
			<!-- include summernote css/js-->
			<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
			<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
			<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
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

		</form>
		
		</div>
	</div>


	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog modal-lg">
		  <div class="modal-content">
		  
			<!-- Modal Header -->
			<div class="modal-header"><h4 class="modal-title"><b>메일 주소록</b></h4></div>
			
			<!-- Modal body -->
			<div class="modal-body" id="mail-address-modal">
			  <div style="width:25%;" id="mail-address-group">
			  	<div>
				  <p id="all-dept">전체 <span style='color:#6F50F8'></span></p>
			    </div>
				<hr style="margin:10px 0px;">
				<div id="mail-dept-list">

				</div>
				  <hr style="margin:10px 0px;">
				  <p id="likeList">즐겨찾기</p>
			  </div>
			  <div style="width:35%;" id="mail-address-detail">
			  	  <div id="all-adr">
			  	  	<label> 전체</label>
			  	  </div>
				  <hr style="margin:10px 0px;">
				  <div id="mail-address-list"></div>
			  </div>
			  <div style="width:40%; padding:0; margin-bottom:10px;">

				  <div class="select-area" id="recipientBox">
					  <div class="header" onclick="select(this);">받는 사람 <span style="color:#00b5d1;">0</span></div>
					  <ul class="selected-list">
					  
					  </ul>
				  </div>
				  <div class="select-area" id="refBox">
					  <div class="header" onclick="select(this);">참조 <span style="color:#00b5d1;">0</span></div>
					  <ul class="selected-list">
					  
					  </ul>
				  </div>
				  <div class="select-area" id="hidRefBox">
					  <div class="header" onclick="select(this);">숨은참조 <span style="color:#00b5d1;">0</span></div>
					  <ul class="selected-list">
					  
					  </ul>
				  </div>

			  </div>
			  <br>
			  <p style="font-size:13px; color:gray;">받는사람 / 참조 / 숨은참조 영역 선택 후 좌측의 주소를 선택하면 해당 영역에 입력됩니다.</p>
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" style="font-size:14px; width:60px;">취소</button>
				<button class="btn-purple" style="font-size:14px; width:60px;" onclick="addTempAddress();" data-dismiss="modal">추가</button>
			</div>
			
		  </div>
		</div>

		<!-- 주소록 모달창 -->
		<script>
		const mailList = document.getElementById("mail-address-list");				// 해당 부서 메일 리스트 div
		const list0 = document.getElementsByClassName("selected-list")[0];	// 받는 사람 ul
		const list1 = document.getElementsByClassName("selected-list")[1];	// 참조 ul
		const list2 = document.getElementsByClassName("selected-list")[2];	// 숨은참조 ul
		const count0 = document.getElementsByClassName("header")[0].childNodes[1];	// 받는 사람 수 span
		const count1 = document.getElementsByClassName("header")[1].childNodes[1];
		const count3 = document.getElementsByClassName("header")[2].childNodes[1];
		// 모달창에서 임시로 쓸 배열
		let temp0 = [];
		let temp1 = [];
		let temp2 = [];
		let tempAlarm0 = [];
		let tempAlarm1 = [];
		let tempAlarm2 = [];
		
			/****** 초기화면 ******/
			$(document).on("click", ".address-btn", function(){
				// 임시 배열 빈 배열로
				temp0 = [];
				temp1 = [];
				temp2 = [];
				
				document.getElementById("all-dept").childNodes[1].innerHTML = memArr.length;
				
				let mailListHtml = "";
				let html0 = "";
				let html1 = "";
				let html2 = "";
				
				// 전체주소 뿌리기
				for(let i in memArr){
					mailListHtml += "<div id='" + memArr[i].no + "'>"
						   		  +		memArr[i].name + " &lt" + memArr[i].mail + "&gt"
						   		  + "</div>"
				}
				mailList.innerHTML = mailListHtml;
				
				// 받는,참조,숨은참조 입력되어있는값 뿌리기
				for(let i in arr0){
					for(let j in memArr){
						if(arr0[i] == memArr[j].mail){
							html0 += "<li>"
								   +	memArr[j].name + " &lt" + memArr[j].mail + "&gt"
								   +	"<button><img src='resources/icons/close.png'></button>"
								   + "</li>"
						}
					}
				}
				for(let i in arr1){
					for(let j in memArr){
						if(arr1[i] == memArr[j].mail){
							html1 += "<li>"
						 	   	   +		memArr[j].name + " &lt" + memArr[j].mail + "&gt"
							   	   +		"<button><img src='resources/icons/close.png'></button>"
							   	   + "</li>"
						}
					}
				}
				for(let i in arr2){
					for(let j in memArr){
						if(arr2[i] == memArr[j].mail){
							html2 += "<li>"
							       +	memArr[j].name + " &lt" + memArr[j].mail + "&gt"
							       +	"<button><img src='resources/icons/close.png'></button>"
							       + "</li>"
						}
					}
				}
				list0.innerHTML = html0;
				list1.innerHTML = html1;
				list2.innerHTML = html2;
				
				count0.innerHTML = arr0.length;
				count1.innerHTML = arr1.length;
				count3.innerHTML = arr2.length;
				
			})
			
			
			let deptArr = [];	// 부서 리스트 : 부서번호, 부서명, 부서멤버수
			function selectMemCount(){
				
				$.ajax({
					url:"selectCount.me",
					data:{},
					type:"post",
					success:function(dList){
						for(let i=0; i<dList.length; i++){
							deptArr.push({
								no:dList[i].departmentNo,
								name:dList[i].departmentName,
								count:dList[i].memCount
							})
						}
						
						let deptListHtml = "";
						const deptList = document.getElementById("mail-dept-list");
						for(let i in deptArr){
							deptListHtml += "<p id='deptList" + (Number(i) + 1) + "'>" + deptArr[i].name + " <span style='color:#6F50F8'>" + deptArr[i].count + "</span>" + "</p>";
						}
						deptList.innerHTML = deptListHtml;
						
					}, error:function(){
						console.log("부서별 멤버수 조회용 ajax 통신실패")
					}
				})
				
			}
			
			$(document).on("click", "#mail-address-group p", function(e){
				// 스타일 변경
				e.target.className += "dept-selected";
				deptList = document.querySelectorAll("#mail-address-group p");
				for(let i in deptList){
					if(deptList[i].id != e.target.id){
						deptList[i].className = "";
					}
				}

				if(e.target.id == "all-dept"){
					// 전체주소 뿌리기
					let value = "";
					for(let i in memArr){
						value += "<div id='" + memArr[i].no + "'>"
							   +	memArr[i].name + " &lt" + memArr[i].mail + "&gt"
							   + "</div>";
					}
					mailList.innerHTML = value;
				} else if(e.target.id == "likeList"){
					// 즐겨찾기 주소 뿌리기
					$.ajax({
						url:"selectLike.me",
						data:{},
						type:"post",
						success:function(mList){
							let value = "";
							for(let i in mList){
								value += "<div id='" + mList[i].userNo + "'>"
									   +	mList[i].userName + " &lt" + mList[i].mail + "&gt"
									   + "</div>";
							}
							mailList.innerHTML = value;
						}, error:function(){
							console.log("부서별 멤버 조회용 ajax 통신실패")
						}
					})
				} else {
					// 해당부서 주소 뿌리기
					let value = "";
					for(let i in memArr){
						if(memArr[i].dept == e.target.id.substr(8)){
							value += "<div id='" + memArr[i].no + "'>"
								   +	memArr[i].name + " &lt" + memArr[i].mail + "&gt"
								   + "</div>";
						}
						mailList.innerHTML = value;
					}
				}
			})
			
			
			$(document).on("click", "#mail-address-list div", function(e){
				const selectedBox = document.getElementsByClassName("selected")[0];
				if(selectedBox != null){
					const startIdx = e.target.innerHTML.indexOf(";") + 1;
					const endIdx = e.target.innerHTML.lastIndexOf("&");
					const mail = e.target.innerHTML.substring(startIdx, endIdx);
					const no = e.target.getAttribute('id');
					let value = "<li>"
					       	  +		e.target.innerHTML
					          +		"<button><img src='resources/icons/close.png'></button>"
					          + "</li>";
					
					if(selectedBox.id == "recipientBox"){
						if(!temp0.includes(mail) && !arr0.includes(mail)){	// 배열에 해당 메일이 없을 때 (중복으로 추가하지 않기 위해서)
							temp0.push(mail);
							tempAlarm0.push(no);
							document.querySelector("div.selected ul").innerHTML += value;
							document.querySelectorAll(".header span")[0].innerHTML = arr0.length + temp0.length;
						}
					} else if(selectedBox.id == "refBox"){
						if(!temp1.includes(mail) && !arr1.includes(mail)){	// 배열에 해당 메일이 없을 때 (중복으로 추가하지 않기 위해서)
							temp1.push(mail);
							tempAlarm1.push(no);
							document.querySelector("div.selected ul").innerHTML += value;
							document.querySelectorAll(".header span")[1].innerHTML = arr1.length + temp1.length;
						}
					} else {
						if(!temp2.includes(mail) && !arr2.includes(mail)){	// 배열에 해당 메일이 없을 때 (중복으로 추가하지 않기 위해서)
							temp2.push(mail);
							tempAlarm2.push(no);
							document.querySelector("div.selected ul").innerHTML += value;
							document.querySelectorAll(".header span")[2].innerHTML = arr2.length + temp2.length;
						}
					}
				}
				console.log(temp0);
				console.log(temp1);
				console.log(temp2);
			})
			
			function addTempAddress(){
				const spans = document.getElementsByClassName("span");
				const inputs = document.getElementsByClassName("mailInput");
				for(let i in temp0){
					arr0.push(temp0[i]);	// 배열에 넣고
					arrAlarm.push(tempAlarm0[i]);
					let value = "";
					for(let j in memArr){	// memArr에서 해당 메일값의 이름까지 불러오기
	   					if(memArr[j].mail == temp0[i]){
	   						value = "<button class='recipient-btn' type='button'>"
	       					 	  + 	memArr[j].name + " " + "&lt" + memArr[j].mail + "&gt"
	           					  + 	" <img src='resources/icons/close.png' style='width:7px; margin-bottom:3px;'>"
	           					  + "</button>";
	   					}
	   				}
					spans[0].innerHTML += value;
					let newWidth = 1000 - spans[0].offsetWidth;
					if(newWidth > 200) {
						inputs[0].style.width = newWidth.toString() + "px";
					} else {
						inputs[0].style.width = "1000px";
					}
				};
				for(let i in temp1){
					arr1.push(temp1[i]);
					arrAlarm.push(tempAlarm1[i]);
					let value = "";
					for(let j in memArr){	// memArr에서 해당 메일값의 이름까지 불러오기
	   					if(memArr[j].mail == temp1[i]){
	   						value = "<button class='recipient-btn' type='button'>"
	       					 	  + 	memArr[j].name + " " + "&lt" + memArr[j].mail + "&gt"
	           					  + 	" <img src='resources/icons/close.png' style='width:7px; margin-bottom:3px;'>"
	           					  + "</button>";
	   					}
	   				}
					spans[1].innerHTML += value;
					let newWidth = 1000 - spans[1].offsetWidth;
					if(newWidth > 200) {
						inputs[1].style.width = newWidth.toString() + "px";
					} else {
						inputs[1].style.width = "1000px";
					}
				};
				for(let i in temp2){
					arr2.push(temp2[i]);
					arrAlarm.push(tempAlarm2[i]);
					let value = "";
					for(let j in memArr){	// memArr에서 해당 메일값의 이름까지 불러오기
	   					if(memArr[j].mail == temp2[i]){
	   						value = "<button class='recipient-btn' type='button'>"
	       					 	  + 	memArr[j].name + " " + "&lt" + memArr[j].mail + "&gt"
	           					  + 	" <img src='resources/icons/close.png' style='width:7px; margin-bottom:3px;'>"
	           					  + "</button>";
	   					}
	   				}
					spans[2].innerHTML += value;
					let newWidth = 1000 - spans[2].offsetWidth;
					if(newWidth > 200) {
						inputs[2].style.width = newWidth.toString() + "px";
					} else {
						inputs[2].style.width = "1000px";
					}
				}
				console.log("받 : " + arr0);
				console.log("참 : " + arr1);
				console.log("숨 : " + arr2);
			}
		
			function select(e){
				let selectedArea = e.parentNode;
	  			const siblings = e.parentNode.parentNode.children;
	  			selectedArea.classList.add("selected");
	  			for(let i=0; i<siblings.length; i++){
		  			if(selectedArea != siblings[i]){
			  			siblings[i].classList.remove("selected");
		  			}
	  			}
		  	}
		  
		</script>
		
		<!-- Alert -->
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<!-- 메일 보내기 -->
		<script>
			function submitForm(){
				if(document.getElementById("recipientMail").value == ""){
					swal('', "받는사람이 지정되지 않았습니다.\n받는 사람 주소를 입력해주세요.", 'error')
				} else {
					document.getElementById("sendMailForm").submit();
					
					// 알림 관련
					let arrDup = [...new Set(arrAlarm)];
					let mailTo = arrDup.join("/");
					if(socket){
						let socketMsg = "12,${loginUser.userNo},${loginUser.userName}," + mailTo + ",4, ";
						socket.send(socketMsg);
					}
				}
			}
		</script>

	</div>

</body>
</html>