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
		width:1160px;
		border-bottom:1px solid rgb(200,200,200);
	}
	.td input{
		width:1100px; height:30px;
		border: none;
		border-radius:5px;
	}
	.recipient-btn{
		border:none;
		border-radius:10px;
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
    #mail-address-group p, #mail-address-detail p{
        margin:10px 0;
        font-size: 14px;
        cursor:pointer;
    }
    #mail-address-modal .header{
        cursor: pointer;
        font-size: 15px;
        font-weight:600;
        height:25%;
        padding: 10px;
    }
    .select-area{
        height:33.3%;
    }
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
		<form action="" style="padding:0px 20px;">
			
			<button class="btn-purple" style="font-size:13px; padding:3px 10px; margin:0 5px;">보내기</button>
			<button type="button" style="font-size:13px; padding:3px 10px;  margin:0 5px;">임시저장</button>
			<button type="button" style="font-size:13px; padding:3px 10px;  margin:0 5px;">미리보기</button>

			<table style="margin:20px 0; font-size:14px;" id="mail-send-form">
				<tr id="recipient-area">
					<th colspan="2" style="width:150px;">받는사람</th>
					<td class="td">
						<button class="recipient-btn">
							신하영 &ltuser01@ppic.kr&gt
							<img src="resources/icons/close.png" style="width:7px; margin-bottom:3px;">
						</button>
						<input type="text" class="mailInput" onkeyup="selectAutoComplete(0, this);"  placeholder="메일 주소 사이에 콤마(,) 또는 세미콜론(;)으로 구분하여 입력하세요" style="width:900px;">
						<button type="button" class="address-btn" data-toggle="modal" data-target="#myModal">주소록</button>
						
						<div class="autocomplete-area" style="display:none;"></div>
						
					</td>
				</tr>
				<tr id="ref-area">
					<th colspan='2'>참조</th>
					<td class="td">
						<input class="mailInput" onkeyup="selectAutoComplete(1, this);" type="text">
						<button type="button" class="address-btn" data-toggle="modal" data-target="#myModal">주소록</button>
						
						<div class="autocomplete-area" style="display:none;"></div>
						
					</td>
				</tr>
				<tr id="hid-ref-area">
					<th colspan="2">숨은참조</th>
					<td class="td">
						<input class="mailInput" onkeyup="selectAutoComplete(2, this);" type="text">
						<button type="button" class="address-btn" data-toggle="modal" data-target="#myModal">주소록</button>
						
						<div class="autocomplete-area" style="display:none;"></div>
						
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td style="width:50px; font-size:11px;">
						<input type="checkbox" id="important-check" style="vertical-align: middle;">
						<label for="important-check" style="margin:0;">중요</label>
					</td>
					<td class="td">
						<input type="text" style="height:30px; border:none;">
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						
					</td>
					<td class="recipient-list">
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
				<tr>
					<td colspan="3" style="padding-top:30px;">
						<textarea id="summernote"></textarea>
					</td>
				</tr>
			</table>
			
			
			<!-- 자동완성 -->
			<script>
				/* 페이지 로딩되자마자 전체 회원의 이름, 메일주소 조회 */
				$(function(){selectMemberList();})				
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
		        					dept:mList[i].department
		        				});
	        				}
	        				console.log(memArr);
	        			}, error:function(){
	        				console.log("회원조회용 ajax 통신실패")
	        			}
	        		})
				}
				
				/* 키업때마다 자동완성 조회 */
				function selectAutoComplete(type, e){
					
					let result = "";
					let count = 0;
       				for(let i in memArr){
       					// 포함되어있을 경우 area에 추가
       					if(memArr[i].name.indexOf(e.value) != -1 || memArr[i].mail.indexOf(e.value) != -1){
       						count += 1;
       						result += "<p class='autocomplete-items'>"
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
				}
				
				$(document).on("click", ".autocomplete-items", function(){
        			console.log($(this));
        		})
				
				$(document).on("click", function(e){
					console.log(e.target);
					if(!$(e.target).hasClass("mailInput")){
						// mailInput 클래스를 갖고 있는 영역을 클릭했을 때 빼고 area 안보이게
						for(let i=0; i<autocompleteArea.length; i++){
							autocompleteArea[i].style.display = "none";
						}
						//console.log(e.target.innerHTML);
					}
				})
				
				
				
				
				/*
				recipientInput.onkeyup = function(e){
					if(e.key == ',' || e.key == ';'){
						// , 또는 ;으로 구분
						
					}
				}*/
				
				
				
				
			</script>

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
					console.log('파일닿았따!!!');
					fileArea.className = "drag-enter";
				})
				fileArea.addEventListener("dragover",function(e){
					e.preventDefault();
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
					fileArea.innerHTML += "<p class='input-file-list'>" + "<img src='resources/icons/close.png' style='width:7px; margin-bottom:3px'> " + e.dataTransfer.files[0].name + "</p>";
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
			<div class="modal-header"><h4 class="modal-title">메일 주소록</h4></div>
			
			<!-- Modal body -->
			<div class="modal-body" id="mail-address-modal">
			  <div style="width:25%;" id="mail-address-group">
				  <p>전체 <span><b>10</b></span></p>
				  <p>미지정 <span><b>2</b></span></p>
				  <hr style="margin:10px 0px;">
				  <p>인사부 <span><b>4</b></span></p>
				  <p>회계부 <span><b>4</b></span></p>
				  <hr style="margin:10px 0px;">
				  <p>즐겨찾기</p>
			  </div>
			  <div style="width:35%;" id="mail-address-detail">
				  <p>전체</p>
				  <hr style="margin:10px 0px;">
				  <p>신하영 &ltuser01@ppic.kr&gt</p>
				  <p>신하영 &ltuser01@ppic.kr&gt</p>
				  <p>신하영 &ltuser01@ppic.kr&gt</p>
			  </div>
			  <div style="width:40%; padding:0; margin-bottom:10px;">

				  <div class="select-area">
					  <div class="header" onclick="select(this);">받는 사람 <span style="color:#00b5d1;">0</span></div>
					  <ul class="selected-list">
						  <li>신하영 &ltuser01@ppic.kr&gt<button><img src="resources/icons/close.png"></button></li>
						  <li>신하영 &ltuser01@ppic.kr&gt<button><img src="resources/icons/close.png"></button></li>
						  <li>신하영 &ltuser01@ppic.kr&gt<button><img src="resources/icons/close.png"></button></li>
						  <li>신하영 &ltuser01@ppic.kr&gt<button><img src="resources/icons/close.png"></button></li>
						  <li>신하영 &ltuser01@ppic.kr&gt<button><img src="resources/icons/close.png"></button></li>
					  </ul>
				  </div>
				  <div class="select-area">
					  <div class="header" onclick="select(this);">참조 <span style="color:#00b5d1;">0</span></div>
					  <ul class="selected-list">
						  <li>신하영 &ltuser01@ppic.kr&gt<button><img src="resources/icons/close.png"></button></li>
						  <li>신하영 &ltuser01@ppic.kr&gt<button><img src="resources/icons/close.png"></button></li>
						  <li>신하영 &ltuser01@ppic.kr&gt<button><img src="resources/icons/close.png"></button></li>
						  <li>신하영 &ltuser01@ppic.kr&gt<button><img src="resources/icons/close.png"></button></li>
						  <li>신하영 &ltuser01@ppic.kr&gt<button><img src="resources/icons/close.png"></button></li>
					  </ul>
				  </div>
				  <div class="select-area">
					  <div class="header" onclick="select(this);">숨은참조 <span style="color:#00b5d1;">0</span></div>
					  <ul class="selected-list">
						  <li>신하영 &ltuser01@ppic.kr&gt<button><img src="resources/icons/close.png"></button></li>
						  <li>신하영 &ltuser01@ppic.kr&gt<button><img src="resources/icons/close.png"></button></li>
						  <li>신하영 &ltuser01@ppic.kr&gt<button><img src="resources/icons/close.png"></button></li>
						  <li>신하영 &ltuser01@ppic.kr&gt<button><img src="resources/icons/close.png"></button></li>
						  <li>신하영 &ltuser01@ppic.kr&gt<button><img src="resources/icons/close.png"></button></li>
					  </ul>
				  </div>

			  </div>
			  <br>
			  <p style="font-size:13px; color:gray;">받는사람 / 참조 / 숨은참조 영역 선택 후 좌측의 주소를 선택하면 해당 영역에 입력됩니다.</p>
			</div>
			
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" data-dismiss="modal" style="font-size:14px; width:60px;">취소</button>
				<button class="btn-purple" style="font-size:14px; width:60px;">추가</button>
			</div>
			
		  </div>
		</div>

		<script>
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

	</div>

</body>
</html>