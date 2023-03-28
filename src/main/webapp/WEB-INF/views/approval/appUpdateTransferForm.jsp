<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PPIC</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<style>
	.second-1, .second-2{
		box-sizing: border-box; 
		float: left;
	}
	
    /* 수정하기 */
    .title-area{
		float: left;
	}
    
    /* 기안 */
    .second-1{
		width: 75%;
	}
    .form-area{
		padding: 30px;
	}
    #tb{
		width:100%; 
		text-align: center;
	}
    #tb tr{
		height:40px;
	}
    .add-btn-area{
		float: left;
	}
    
    /* 승인, 참조 */
    .second-2{
		width: 25%;
	}
    .agree-area{
		margin-top: 6px; 
		border: 1px solid lightgray;
	}
    .line{
		width: 80%;
	}
    .line-content{
		text-align: left;
	}
    .person-title{
		float: left; 
		width: 90px;
	}
    .level-area{
		border:1px solid #b09eff; 
		border-radius:10px; 
		padding: 10px; 
		margin-bottom: 10px;
	}
    .level-area-pk{
		border:1px solid #fdbaba; 
		border-radius:10px; 
		padding: 10px; 
		margin-bottom: 10px;
	}
    .level{
		padding-left: 10px;
	}
    .person-img{
		font-size: x-large;
	}
    
    .btnn-pp{
		font-size: 14px; 
		background-color: white; 
		color: #6F50F8; 
		border:1px solid #6F50F8; 
		border-radius: 4px; 
		padding: 4px; 
		padding-left: 8px; 
		padding-right: 8px;
	}
    .btnn-pp:hover{
		background-color: #6F50F8; 
		color: white; 
		transition: 0.3s;
	}
    .btnn-gr{
		font-size: 14px; 
		background-color: white; 
		color: gray; 
		border:1px solid gray; 
		border-radius: 4px; 
		padding: 4px; 
		padding-left: 8px; 
		padding-right: 8px;
	}
    .btnn-gr:hover{
		background-color: gray; 
		color: white; 
		transition: 0.3s;
	}
    .btnn-pk{
		font-size: 14px; 
		background-color: white; 
		color: #fdbaba; 
		border:1px solid #fdbaba; 
		border-radius: 4px; 
		padding: 4px; 
		padding-left: 8px; 
		padding-right: 8px;
	}
    .btnn-pk:hover{
		background-color: #fdbaba; 
		color: white; 
		transition: 0.3s;
	}
    .btnn-sb{
		font-size: 14px; 
		background-color: white; 
		color: #00b5d1; 
		border:1px solid #00b5d1; 
		border-radius: 4px; 
		padding: 4px; 
		padding-left: 8px; 
		padding-right: 8px;
	}
    .btnn-sb:hover{
		background-color: #00b5d1; 
		color: white; 
		transition: 0.3s;
	}

    /* 승인, 참조 modal */
    .a-content-1, .r-content-1{
		height: 300px; 
		width: 250px; 
		float: left; 
		overflow: auto;
	}
    .a-content-1::-webkit-scrollbar, .r-content-1::-webkit-scrollbar{
		width: 8px;
	}
    .a-content-1::-webkit-scrollbar-thumb, .r-content-1::-webkit-scrollbar-thumb{
		background: lightgray; 
		border-radius: 10px;
	}
    .a-content-2, .r-content-2{
		border: 1px solid lightgray; 
		margin-left: 10px; 
		height: 300px; 
		width: 200px; 
		float: left; 
		overflow: auto;
	}
    .a-content-2::-webkit-scrollbar, .r-content-2::-webkit-scrollbar{
		width: 8px;
	}
    .a-content-2::-webkit-scrollbar-thumb, .r-content-2::-webkit-scrollbar-thumb{
		background: lightgray; 
		border-radius: 10px;
	}
    
    /* 첨부파일 */
    .insert .file-list {
		height: 140px; 
		border: 1px solid lightgray; 
		padding: 5px;
	}
	.insert .file-list .filebox p {
		font-size: 14px; 
		display: inline-block; 
		margin-bottom: 3px;
	}
	.insert .file-list .filebox .delete i, .deleteDB i{
		color: rgb(255, 100, 100); 
		margin-left: 5px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<script>
		window.onload = function(){
			// 작성일
			date = new Date();
			year = date.getFullYear();
			month = date.getMonth() + 1;
			if(month < 10){
				month = "0" + month;
			}
			day = date.getDate();
			if(day < 10){
				day = "0" + day;
			}
			document.getElementById("current-date").innerHTML = year + "-" + month + "-" + day;
			
			// 날짜 start max
			let now_utc = Date.now(); // 지금 날짜를 밀리초로 가져옴
			// getTimezoneOffset()은 현재 시간과의 차이를 분단위로 반환
			let timeOff = new Date().getTimezoneOffset()*60000; // 분단위를 밀리초로 변환
			// new Date(now_utc-timeOff).toISOString()은 '2023-03-20T18:09:38.134z'를 반환
			let today = new Date(now_utc-timeOff).toISOString().split("T")[0];
			document.getElementById("start").setAttribute("min", today);
			
			// 승인자 모달 각 행
			const a_tr = document.getElementsByClassName("a-trOver");
			for(let i=0; i<a_tr.length; i++){
				// user 선택 onclick
				a_tr[i].childNodes[5].addEventListener("click", function(){
					const check_img = this.nextSibling.nextSibling.childNodes[0]; // 화살표 이미지
					const input_userNo = this.previousSibling.previousSibling.previousSibling.previousSibling.value; // userNo
					const input_deptName = this.previousSibling.previousSibling.value; // deptName
					const userName = this.innerHTML; // userName
					const checked_area = document.getElementById("a-checked"); // 선택된 user 공간
					if(check_img.style.display == 'none'){ // 선택되지 않은 user를 클릭한 경우
						check_img.style.display = 'block';
						checked_area.innerHTML +=	"<tr class='a-checked-p'>"
												+		"<td>"
												+			"<input type='hidden' value='" + input_userNo + "'>"
												+			"<input type='hidden' value='" + input_deptName + "'>"
												+			"<span>" + userName + "</span>"
												+		"</td>"
												+	"</tr>";
					} else if(check_img.style.display == 'block'){ // 선택된 user를 클릭한 경우
						check_img.style.display = 'none';
						const ptr = document.getElementsByClassName("a-checked-p");	// 선택된 user 공간의 각 행
						for(let j=0; j<ptr.length; j++){ // 선택된 user 공간에서 찾아서 지움
							const checked_userName = ptr[j].childNodes[0].childNodes[2].innerHTML;	// 선택된 user 공간의 userName
							if(userName == checked_userName){ // 내가 클릭한 userName과 선택된 user 공간의 userName이 같을 경우
								document.getElementById("a-table").deleteRow(j);
							}
						}
					}
				});
			}

			// 기존 값
			let originAgr = document.getElementsByName("agrUserNo"); // 기존 승인자
			for(let j=0; j<originAgr.length; j++){
				for(let i=0; i<a_tr.length; i++){
					const input_userNo = a_tr[i].childNodes[1].value; // userNo
					if(input_userNo == originAgr[j].value){ // 기존 승인자를 승인자 모달 리스트에서 찾는 구문
					const check_img = a_tr[i].childNodes[7].childNodes[0]; // 화살표 이미지
					const input_deptName = a_tr[i].childNodes[3].value; // deptName
					const userName = a_tr[i].childNodes[5].innerHTML; // userName
					const checked_area = document.getElementById("a-checked"); // 선택된 user 공간
					check_img.style.display = 'block';
					checked_area.innerHTML +=	"<tr class='a-checked-p'>"
											+		"<td>"
											+			"<input type='hidden' value='" + input_userNo + "'>"
											+			"<input type='hidden' value='" + input_deptName + "'>"
											+			"<span>" + userName + "</span>"
											+		"</td>"
											+	"</tr>";
					}
				}
			}
			
			// 참조자 모달 각 행
			const r_tr = document.getElementsByClassName("r-trOver");
			for(let i=0; i<r_tr.length; i++){
				// user 선택 onclick
				r_tr[i].childNodes[5].addEventListener("click", function(){
					const check_img = this.nextSibling.nextSibling.childNodes[0]; // 화살표 이미지
					const input_userNo = this.previousSibling.previousSibling.previousSibling.previousSibling.value; // userNo
					const input_deptName = this.previousSibling.previousSibling.value; // deptName
					const userName = this.innerHTML; // userName
					const checked_area = document.getElementById("r-checked"); // 선택된 user 공간
					if(check_img.style.display == 'none'){ // 선택되지 않은 user를 클릭한 경우
						check_img.style.display = 'block';
						checked_area.innerHTML +=   "<tr class='r-checked-p'>"
												+		"<td>"
												+			"<input type='hidden' value='" + input_userNo + "'>"
												+			"<input type='hidden' value='" + input_deptName + "'>"
												+			"<span>" + userName + "</span>"
												+		"</td>"
												+   "</tr>";
					} else if(check_img.style.display == 'block'){ // 선택된 user를 클릭한 경우
						check_img.style.display = 'none';
						const ptr = document.getElementsByClassName("r-checked-p");	// 선택된 user 공간의 각 행
						for(let j=0; j<ptr.length; j++){ // 선택된 user 공간에서 찾아서 지움
							const checked_userName = ptr[j].childNodes[0].childNodes[2].innerHTML;	// 선택된 user 공간의 userName
							if(userName == checked_userName){ // 내가 클릭한 userName과 선택된 user 공간의 userName이 같을 경우
								document.getElementById("r-table").deleteRow(j);
							}
						}
					}
				});
			}

			// 기존 값
			let originRef = document.getElementsByName("refUserNo"); // 기존 참조자
			for(let j=0; j<originRef.length; j++){
				for(let i=0; i<r_tr.length; i++){
					const input_userNo = r_tr[i].childNodes[1].value; // userNo
					if(input_userNo == originRef[j].value){ // 기존 참조자를 참조자 모달 리스트에서 찾는 구문
					const check_img = r_tr[i].childNodes[7].childNodes[0]; // 화살표 이미지
					const input_deptName = r_tr[i].childNodes[3].value; // deptName
					const userName = r_tr[i].childNodes[5].innerHTML; // userName
					const checked_area = document.getElementById("r-checked"); // 선택된 user 공간
					check_img.style.display = 'block';
					checked_area.innerHTML +=	"<tr class='r-checked-p'>"
											+		"<td>"
											+			"<input type='hidden' value='" + input_userNo + "'>"
											+			"<input type='hidden' value='" + input_deptName + "'>"
											+			"<span>" + userName + "</span>"
											+		"</td>"
											+	"</tr>";
					}
				}
			}
			
			// 사원추가 모달 각 행
			const u_tr = document.getElementsByClassName("u-trOver");
			for(let i=0; i<u_tr.length; i++){
				// user 선택 onclick
				u_tr[i].childNodes[5].addEventListener("click", function(){
					const check_img = this.nextSibling.nextSibling.childNodes[0]; // 화살표 이미지
					const input_userNo = this.previousSibling.previousSibling.previousSibling.previousSibling.value; // userNo
					const input_deptName = this.previousSibling.previousSibling.value; // deptName
					const userName = this.innerHTML; // userName
					const checked_area = document.getElementById("u-checked"); // 선택된 user 공간
					if(check_img.style.display == 'none'){ // 선택되지 않은 user를 클릭한 경우
						check_img.style.display = 'block';
						checked_area.innerHTML +=   "<tr class='u-checked-p'>"
												+		"<td>"
												+			"<input type='hidden' value='" + input_userNo + "'>"
												+			"<input type='hidden' value='" + input_deptName + "'>"
												+			"<span>" + userName + "</span>"
												+		"</td>"
												+   "</tr>";
					} else if(check_img.style.display == 'block'){ // 선택된 user를 클릭한 경우
						check_img.style.display = 'none';
						const ptr = document.getElementsByClassName("u-checked-p");	// 선택된 user 공간의 각 행
						for(let j=0; j<ptr.length; j++){ // 선택된 user 공간에서 찾아서 지움
							const checked_userName = ptr[j].childNodes[0].childNodes[2].innerHTML;	// 선택된 user 공간의 userName
							if(userName == checked_userName){ // 내가 클릭한 userName과 선택된 user 공간의 userName이 같을 경우
								document.getElementById("u-table").deleteRow(j);
							}
						}
					}
				});
			}
		}
		
		// 승인자 추가
		function a_add(){
			const tr = document.getElementsByClassName("a-checked-p"); // 선택된 user 공간의 각 행
			if(tr[0] == null){ // 승인자가 한명도 선택되지 않은 경우
				alert("선택된 승인자가 없습니다.");
			}
			const a_content = document.getElementById("a-person-content"); // 승인자 공간
			let value = "";
			for(let i=0; i<tr.length; i++){ // value에 담기
				const userNo = tr[i].childNodes[0].childNodes[0].value;
				const deptName = tr[i].childNodes[0].childNodes[1].value;
				const namePosition = tr[i].childNodes[0].childNodes[2].innerHTML;
				value += "<div class='level-area'>"
		               +	"<div class='level'><h6><b>" + (i + 1) + "단계</b></h6></div>"
		               +	"<div class='level-person'>"
		               +		"<span class='person-img'>🧑🏻‍💻</span> "
		               +		"<input type='hidden' name='agrUserNo' value='" + userNo + "'>"
					   +		deptName + "부 " + namePosition
		               +	"</div>"
		               + "</div>";
			}
			a_content.innerHTML = value;
		}
		
		// 참조자 추가
		function r_add(){
			const tr = document.getElementsByClassName("r-checked-p"); // 선택된 user 공간의 각 행
			if(tr[0] == null){ // 참조자가 한명도 선택되지 않은 경우
				alert("선택된 참조자가 없습니다.");
			}
			const r_content = document.getElementById("r-person-content"); // 참조자 공간
			let value = "";
			for(let i=0; i<tr.length; i++){ // value에 담기
				const userNo = tr[i].childNodes[0].childNodes[0].value;
				const deptName = tr[i].childNodes[0].childNodes[1].value;
				const namePosition = tr[i].childNodes[0].childNodes[2].innerHTML;
				value += "<div class='level-area-pk'>"
		               +	"<div class='level-person'>"
		               +		"<span class='person-img'>🙋🏻‍♂️</span> "
		               +		"<input type='hidden' name='refUserNo' value='" + userNo + "'>"
					   +		deptName + "부 " + namePosition
		               +	"</div>"
		               + "</div>";
			}
			r_content.innerHTML = value;
		}
		
		// 사원추가
		function u_add(){
			const tr = document.getElementsByClassName("u-checked-p"); // 선택된 user 공간의 각 행
			if(tr[0] == null){ // 사원이 한명도 선택되지 않은 경우
				alert("선택된 사원이 없습니다.");
			}
			const u_content = document.getElementById("u-person-content"); // 사원추가 공간
			let value = "";
			for(let i=0; i<tr.length; i++){ // value에 담기
				const userNo = tr[i].childNodes[0].childNodes[0].value;
				const deptName = tr[i].childNodes[0].childNodes[1].value;
				const namePosition = tr[i].childNodes[0].childNodes[2].innerHTML;
				const arr = namePosition.split(" ");
				value += "<tr>"
		               +	"<td>"
		               +		"<input type='hidden' name='ftrList[" + i + "].userName' value='" + arr[0] + "'>"
					   +		arr[0]
		               +	"</td>"
		               +	"<td colspan='2'>"
		               +		"<input type='hidden' name='ftrList[" + i + "].departmentName' value='" + deptName + "'>"
					   +		deptName
		               +	"</td>"
		               +	"<td>"
		               +		"<input type='hidden' name='ftrList[" + i + "].currentPosition' value='" + arr[1] + "'>"
					   +		arr[1]
		               +	"</td>"
		               +	"<td>"
		               +		"<select style='width:140px; height:35px;' name='ftrList[" + i + "].promotePosition'>"
					   +			"<option>변경직급을 선택하세요</option>"
					   +			"<c:forEach var='p' items='${ pList }'>"
					   +				"<option>${ p.positionName }</option>"
               		   +            "</c:forEach>"
           			   +		"</select>"
           	           +	"</td>"
		               +	"<td>"
		               +		"<input type='text' style='width:380px; height:35px;' name='ftrList[" + i + "].remark'>"
		               +	"</td>"
		               + "</tr>";
			}
			u_content.innerHTML = value;
		}
		
		let fileNo = 0;
		const dataTransfer = new DataTransfer(); // Data를 담는 역할
		// 첨부파일 추가
		function addFile(obj){
		    let maxFileCnt = 5; // 첨부파일 최대 개수
		    let attFileCnt = document.querySelectorAll('.filebox').length; // 기존 추가된 첨부파일 개수
		    let remainFileCnt = maxFileCnt - attFileCnt; // 추가로 첨부가능한 개수
		    let curFileCnt = obj.files.length; // 현재 선택된 첨부파일 개수
		    // 첨부파일 개수 확인
		    if (curFileCnt > remainFileCnt) {
		        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
		    } else {
		    	for (const file of obj.files) {
		            // 목록 추가
	                let htmlData = '';
	                htmlData += '<div id="file' + fileNo + '" class="filebox">';
	                htmlData += '   <p class="name">' + file.name + '</p>';
	                htmlData += '   <a class="delete"><i class="far fa-minus-square"></i></a>';
	                htmlData += '</div>';
	                $('.file-list').append(htmlData);
	                fileNo++;
	                
	                // DataTransfer에 담기
	                dataTransfer.items.add(file);
		        }
		    	// FileList를 $("#file")[0].files에 대입
	            $("#file")[0].files = dataTransfer.files;
		    }
		}

		// 기존 첨부파일 삭제 click 이벤트
		let attNo = 0;
		$(function(){
			$(document).on("click", ".deleteDB", function(){
				$(this).parent().remove();

				let attachmentNo = $(this).parent().children()[0].value;
				let input = "<input type='hidden' name='delAttNo[" + attNo + "]' value='" + attachmentNo + "'>";
				$("#title-area-selop").append(input);

				attNo++;
			})
		});
		
		// 첨부파일 삭제 click 이벤트
		$(function(){
			$(document).on("click", ".delete", function(){
				deleteFile($(this).parent().attr("id").substring(4));
			})
		});
		
		// 첨부파일 삭제
		function deleteFile(num) {
		    document.querySelector("#file" + num).remove();
		    fileNo--;
		    
		    // id 변경
		    let $file = $("div[id^=file]");
		    for(let i=0; i<$file.length; i++){
				$file.eq(i).attr("id", "file" + i);
		    }
		    
		    // input type="file"에 multiple 속성을 사용할 경우 선택된 파일들에 접근하면 FileList로 처리됨 
            let files = $("#file")[0].files; // 선택된 파일들  (FileList)
            let fileArr = Array.from(files); // 파일들을 배열로 변환 (즉, FileList => Array)
            
            fileArr.splice(num, 1); // 전달받은 인덱스의 파일 1개만을 제거
			
            dataTransfer.clearData(); // 한번 비워주고
            
            // 제거가 다 끝난 Array => FileList로 다시 변환 
            fileArr.forEach(function(file){
                dataTransfer.items.add(file);
            })
            
            // FileList를 다시 $("#file")[0].files에 대입
            $("#file")[0].files = dataTransfer.files;
		}
		
		// 임시저장
		function tem(){
			document.getElementById("title-area-selop").innerHTML += "<input type='hidden' name='tem' value='임시저장'>";
		}

		// submit 조건
		function submitForm(){
			if(document.getElementById("u-person-content").childNodes.length == 0){ // 사원추가
				alert("1명 이상의 사원추가가 필요합니다.");
				return false;
			}else{
				const changePosition = document.getElementsByClassName("changePosition"); // 변경직급
				
				let cnt = 0;
				for(let i=0; i<changePosition.length; i++){
					if(changePosition[i].value == '변경직급을 선택하세요'){
						cnt++;
					}
				}
				if(cnt != 0){
					alert("변경직급을 선택하세요.");
					return false;
				}else{
					if(document.getElementById("a-person-content").childNodes.length == 0){ // 승인자
						alert("1명 이상의 승인자가 필요합니다.");
						return false;
					}else{
						return true;
					}
				}
			}
		}
	</script>
	
	<c:forEach var="t" items="${ ad.transfer }" varStatus="status">
		<script>
			// 기존 값
			$(function(){
				const $options = $('select[name^=ftrList]').eq(${status.index}).children(); // 변경직급
				for(let i=0; i<$options.length; i++){
					if($options.eq(i).html() == '${ t.promotePosition }'){
						$options.eq(i).prop('selected', true);
					}
				}
			});
		</script>
	</c:forEach>
	
	<div id="content" align="center">
        <form action="update.ap" method="post" enctype="multipart/form-data"  onsubmit="return submitForm();">
		    <div class="first">
	            <div class="title-area"><h2><b>수정하기</b></h2></div>
	            <div id="title-area-selop">
	            	<input type="hidden" name="approvalNo" value="${ ad.approvalNo }">
		            <input type="hidden" name="form" value="인사발령품의서">
	            </div>
	        </div>
	        <br clear="both">
	
	        <div class="second">
	            <div class="second-1">
	                <div class="form-area">
	                    <table id="tb" class="table-bordered">
	                        <thead>
	                            <tr>
	                                <th colspan="6"><br><h2><b>인사발령품의서</b></h2><br></th>
	                            </tr>
	                            <tr>
                                	<th width="13%">작성일</th>
	                                <td width="20%" id="current-date"></td>
	                                <th width="13%">완료일</th>
	                                <td width="20%"><span style="color:#6F50F8;">완료시 자동생성</span></td>
	                            	<th width="13%">문서번호</th>
                                	<td width="21%"><span style="color:#6F50F8;">완료시 자동생성</span></td>
	                            </tr>
	                            <c:forEach var="m" items="${ mList }">
		                            <c:if test="${ loginUser.userNo eq m.userNo }">
			                            <tr>
			                                <th>작성자</th>
			                                <td>${ m.userName }</td>
			                                <th>부서</th>
			                                <td>${ m.department }부</td>
			                                <th>직급</th>
			                                <td>${ m.position }</td>
			                                <input type="hidden" name="userNo" value="${ loginUser.userNo }">
			                            </tr>
			                        </c:if>
			                    </c:forEach>
	                            <tr>
	                                <th>제목</th>
	                                <td colspan="5"><input type="text" id="title" name="title" style="width:835px; height:35px;" placeholder="제목을 입력하세요" value="${ ad.app.title }" required></td>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <tr>
	                                <td colspan="6">
	
	                                    <!-- 인사발령품의서 -->
	                                    <table id="tb" class="table-bordered">
	                                        <colgroup>
					                    		<col style="width:15%">
					                    		<col style="width:5%">
					                    		<col style="width:10%">
					                    		<col style="width:15%">
					                    		<col style="width:15%">
					                    		<col style="width:40%">
					                    	</colgroup>
					                    	<thead>
						                    	<tr>
						                            <th colspan="2">시행일자</th>
						                            <td colspan="4" align="left"><input type="date" id="start" name="effectiveDate" style="width:190px; height:35px;" value="${ ad.transfer[0].effectiveDate }" required></td>
						                        </tr>
						                        <tr>
						                            <th>성명</th>
						                            <th colspan="2">부서</th>
						                            <th>현직급</th>
						                            <th>변경직급</th>
						                            <th>비고</th>
						                        </tr>
											</thead>
											
											<!-- 사원 추가 button -->
	                                        <div class="add-btn-area">
	                                        	<button type="button" class="btnn-pp" data-toggle="modal" data-target="#addUser">+ 사원추가</button>
	                                        	<span style="font-size:12px; color:gray;"> ※ 한번에 모든 사원을 선택하세요.</span>
	                                      	</div>
	                                        <br clear="both">
	                                        
	                                        <tbody id="u-person-content">
	                                        	<c:forEach var="t" items="${ ad.transfer }" varStatus="status">
	                                        		<tr>
		    											<td>
															<input type='hidden' name='ftrList[${ status.index }].userName' value='${ t.userName }'>
															${ t.userName }
														</td>
														<td colspan='2'>
		               										<input type='hidden' name='ftrList[${ status.index }].departmentName' value='${ t.departmentName }'>
															${ t.departmentName }
														</td>
														<td>
															<input type='hidden' name='ftrList[${ status.index }].currentPosition' value='${ t.currentPosition }'>
															${ t.currentPosition }
														</td>
														<td>
															<select style='width:140px; height:35px;' name='ftrList[${ status.index }].promotePosition'>
																<option>변경직급을 선택하세요</option>
																<c:forEach var='p' items='${ pList }'>
																	<option>${ p.positionName }</option>
																</c:forEach>
															</select>
														</td>
														<td>
															<input type='text' style='width:380px; height:35px;' name='${ t.remark }'>
														</td>
													</tr>
												</c:forEach>
	                                        </tbody>
	                                    </table>
	                                    
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>
	                    
	                    <!-- 사원 추가 모달 시작 -->
						<div class="modal" id="addUser">
							<div class="modal-dialog">
								<div class="modal-content">
	
									<!-- Modal Header -->
									<div class="modal-header">
									<h4 class="modal-title">사원추가</h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
	
									<!-- Modal body -->
									<div class="modal-body">
									    <div class="form">
									    	<div class="u-content-1">
	         									<table class="table table-hover">
													<c:forEach var="d" items="${ dList }">
														<tr>
														    <th colspan="2">${ d.departmentName }</th>
														</tr>
														<c:forEach var="m" items="${ mList }">
														<c:if test="${ d.departmentName eq m.department }">
															<tr class="u-trOver">
																<input type="hidden" value="${ m.userNo }">
													        	<input type="hidden" value="${ m.department }">
													            <td>${ m.userName } ${ m.position }</td>
																<td><div style="display:none;"><img src="resources/icons/goTo.png" width="20px;"></div></td>
															</tr>
														</c:if>
														</c:forEach>
													</c:forEach>
												</table>
	              							</div>
	             							<div class="u-content-2">
		                                    	<br>
		                                    	<table id="u-table">
		                                    		<tbody id="u-checked"></tbody>
		                                    	</table>
		                                    	<br>
		                                    </div>
	                                    	<br clear="both"><br>
	                                        <div class="m-footer">
												<button class="btnn-gr" data-dismiss="modal">취소</button>
												<button class="btnn-pp" data-dismiss="modal" onclick="u_add();">확인</button>
						                    </div>
						                </div>
						            </div>
	    
						        </div>
						    </div>
						</div>
	               		<!-- 사원 추가 모달 종료 -->
	                                        
	                    <div class="custom-file insert">
	                    	<input type="file" class="custom-file-input" id="file" name="upfile" onchange="addFile(this);" multiple>
		                    <label class="custom-file-label" for="file">Choose file</label>
		                    <div class="file-list">
								<c:if test="${ad.att[0] ne null}">
									<c:forEach var="at" items="${ad.att}">
										<div class="filebox">
											<input type="hidden" value="${at.attachmentNo}">
											<p>${at.originName}</p>
											<a class="deleteDB"><i class="far fa-minus-square"></i></a>
										</div>
									</c:forEach>
								</c:if>
							</div>
		                    <span>※ 첨부파일은 5개까지 첨부 가능합니다.</span>
	                    </div>

	                </div>
	            </div>
	            
	            <br>
	            <div class="second-2">
	                <div class="agree-area">
	                    <br>
	                    <h4><b>승인ㆍ참조</b></h4>
	                    <br>
		
	                    <div class="line">
	                        <div class="line-content">
	                            <div class="person-title"><h5><b>승인자</b></h5></div>
	                            <i class="fas fa-plus plus" data-toggle="modal" data-target="#addAgr"></i>
	                            <br clear="both">
	
	                            <div id="a-person-content">
	                            	<c:forEach var="p" items="${ ad.process }">
				                        <c:if test="${ p.processOrder ne 0 }">
				                        	<div class="level-area">
					                            <div class="level">
					                            	<h6><b>${ p.processOrder }단계</b></h6>
					                            </div>
					                            <div class="level-person">
					                                <span class="person-img">🧑🏻‍💻</span>
					                                <input type="hidden" name="agrUserNo" value="${ p.userNo }">
					                                ${ p.departmentName }부 <span id="nm">${ p.userName }</span> ${ p.positionName }
					                            </div>
					                    	</div>
					                    </c:if>
									</c:forEach>
	                            </div>
	
	                            <div class="person-title"><h5><b>참조자</b></h5></div>
	                            <i class="fas fa-plus plus" data-toggle="modal" data-target="#addRef"></i>
	                            <br clear="both">
	                            
	                            <div id="r-person-content">
		                            <c:forEach var="p" items="${ ad.process }">
		                            	<c:if test="${ p.approvalRole eq '참조' }">
			                            	<div class="level-area-pk">
			                            		<div class="level-person">
						                            <span class="person-img">🙋🏻‍♂️</span>
						                            <input type="hidden" name="refUserNo" value="${ p.userNo }">
					                                ${ p.departmentName }부 ${ p.userName } ${ p.positionName }
						                        </div>
						                    </div>
						                </c:if>
						            </c:forEach>
	                            </div>
	                            
	                        </div>
	                        <br>
	                    </div>
	                    
	                    <!-- 승인자 선택 모달 시작 -->
	                    <div class="modal" id="addAgr">
	                        <div class="modal-dialog">
	                            <div class="modal-content">
	                        
	                                <!-- Modal Header -->
	                                <div class="modal-header">
	                                <h4 class="modal-title">승인자</h4>
	                                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                                </div>
	                        
	                                <!-- Modal body -->
	                                <div class="modal-body">
	                                    <div class="form">
	                                    	<div class="a-content-1">
		                                        <table class="table table-hover">
								                    <c:forEach var="d" items="${ dList }">
								                        <tr>
								                            <th colspan="2">${ d.departmentName }</th>
								                        </tr>
								                        <c:forEach var="m" items="${ mList }">
								                            <c:if test="${ d.departmentName eq m.department }">
								                                <tr class="a-trOver">
								                                	<input type="hidden" value="${ m.userNo }">
				                                                    <input type="hidden" value="${ m.department }">
				                                                    <td>${ m.userName } ${ m.position }</td>
								                                    <td><div style="display:none;"><img src="resources/icons/goTo.png" width="20px;"></div></td>
								                                </tr>
								                            </c:if>
								                        </c:forEach>
								                    </c:forEach>
								                </table>
		                                    </div>
		                                    <div class="a-content-2">
		                                    	<br>
		                                    	<table id="a-table">
		                                    		<tbody id="a-checked"></tbody>
		                                    	</table>
		                                    	<br>
		                                    </div>
	                                    	<br clear="both"><br>
	                                        <div class="m-footer">
	                                            <button class="btnn-gr" data-dismiss="modal">취소</button>
	                                            <button class="btnn-pp" data-dismiss="modal" onclick="a_add();">확인</button>
	                                        </div>
	                                    </div>
	                                </div>
	                        
	                            </div>
	                        </div>
	                    </div>
	                    <!-- 승인자 선택 모달 종료-->
	                    
	                    <!-- 참조자 선택 모달 시작 -->
	                    <div class="modal" id="addRef">
	                        <div class="modal-dialog">
	                            <div class="modal-content">
	                        
	                                <!-- Modal Header -->
	                                <div class="modal-header">
	                                <h4 class="modal-title">참조자</h4>
	                                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                                </div>
	                        
	                                <!-- Modal body -->
	                                <div class="modal-body">
	                                    <div class="form">
	                                    	<div class="r-content-1">
		                                        <table class="table table-hover">
								                    <c:forEach var="d" items="${ dList }">
								                        <tr>
								                            <th colspan="2">${ d.departmentName }</th>
								                        </tr>
								                        <c:forEach var="m" items="${ mList }">
								                            <c:if test="${ d.departmentName eq m.department }">
								                                <tr class="r-trOver">
								                                	<input type="hidden" value="${ m.userNo }">
				                                                    <input type="hidden" value="${ m.department }">
				                                                    <td>${ m.userName } ${ m.position }</td>
								                                    <td><div style="display:none;"><img src="resources/icons/goTo.png" width="20px;"></div></td>
								                                </tr>
								                            </c:if>
								                        </c:forEach>
								                    </c:forEach>
								                </table>
		                                    </div>
		                                    <div class="r-content-2">
		                                    	<br>
		                                    	<table id="r-table">
		                                    		<tbody id="r-checked"></tbody>
		                                    	</table>
		                                    	<br>
		                                    </div>
	                                    	<br clear="both"><br>
	                                        <div class="m-footer">
	                                            <button class="btnn-gr" data-dismiss="modal">취소</button>
	                                            <button class="btnn-pp" data-dismiss="modal" onclick="r_add();">확인</button>
	                                        </div>
	                                    </div>
	                                </div>
	                        
	                            </div>
	                        </div>
	                    </div>
	                    <!-- 참조자 선택 모달 종료-->
	
	                </div>
	            </div>
	
	            <br clear="both">
	            
	            <button type="button" class="btnn-gr" onclick="location.href='list.ap?myt=1';">취소</button>
		        <button type="submit" class="btnn-pk" onclick="tem();">임시저장</button>
		        <button type="submit" class="btnn-pp">작성</button>
	        </div>
	    </form>
    </div>

</body>
</html>