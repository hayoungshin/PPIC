<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#mail-menu div{
		display:inline-block;
		margin: 0px 20px;
		font-size: 20px;
		color: gray;
	}
	#mail-menu div:hover{
		cursor:pointer;
		color: rgb(60,60,60);
		font-weight:600;
	}
	#mail-search-area{
		position:relative;
	}
	#mail-search-btn{
		position:absolute;
		top:0; bottom:0; right:52px;
		width:50px; height:24px;
		padding:0px 5px;
		margin-top:1px;
		background:none;
		border:none;
	}
	#detail-modal-btn{
		position:absolute;
		top:0; bottom:0; right:0px;
		background:none;
		color:gray;
	}

	/* 테이블 */
	#mail-list-table>tbody>tr:hover{cursor:pointer; opacity: 0.7;}
	#mail-list-table td{
		font-size:15px;
		padding:7px 12px;
		border-bottom: 1px solid rgb(200,200,200);
	}
	#table-head{background:rgb(230,230,230);}
	#table-head a{
		text-decoration: none;
		color:rgb(60,60,60);
	}
	#table-head a:hover{font-weight:700;}

	/* 페이징 */
	#paging{
		width:100%;
		height:25px;
	}
	#paging>ul{
		list-style-type:none;
		padding:0;
		margin:0;
		width:220px;
		height:100%;
	}
	#paging li{
		border-radius:5px;
		width:25px; height:21px;
		float:left;
		margin:3px;
		text-align:center;
		background:rgb(230,230,230);
	}
	#paging a{
		text-decoration:none;
		color:rgb(60,60,60);
		font-size:13px;
		width:100%;
		display:block;
		line-height:20px;
	}
	#paging a:hover{font-weight:700;}
	#paging .active{background:#6F50F8;}
	#paging .active a{color:white;}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	
	<div class="outer">
		<div id="content">
		
			<div style="display:inline-block;">
				<span style="font-size:30px;">메일</span>
			</div>
			<div style="display:inline-block;">
				<a href="">
					<img src="resources/icons/addressBook.png" style="width:30px; margin-left:20px; vertical-align:bottom">
				</a>
			</div>
		    <div style="display:inline-block; margin-left: 1000px;">
		        <button class="btn-purple" style="width:200px; height:40px">메일쓰기</button>
		    </div>

			<br><br><br>

			<div id="mail-menu">
				<div style="margin-left:0; color:rgb(60,60,60); font-weight: 600;">
					받은메일
					<span style="color:#6F50F8;">12</span>
				</div>
				<div>보낸메일</div>
				<div>중요메일</div>
				<div>임시보관함</div>
				<div>휴지통</div>
				<div id="mail-search-area" style="font-size:15px; margin-left:400px;">
					<form action="">
						<input type="text" placeholder="메일검색" style="width:300px; border-radius:5px; border:1px solid gray; padding-left:10px;">
						<button id="mail-search-btn">
							<img src="resources/icons/search-g.png" style="width:20px;">
						</button>
						<button id="detail-modal-btn" type="button">
							│ 상세
						</button>
					</form>
				</div>
			</div>


			<!-- 리스트 -->

			<div id="mail-list-paging" align="center">
				<table id="mail-list-table" style="margin-top:30px;">
					<thead>
						<tr id="table-head">
							<td colspan="6" style="width:30px;">

								<input type="checkbox" name="" id="">

								<div class="dropdown" style="display:inline-block;">
									<button style="margin:0px; padding:0; background:none;" class="dropdown-toggle" data-toggle="dropdown"></button>
									<div class="dropdown-menu" style="font-size:13px; padding:0;">
										<a class="dropdown-item" href="#" style="padding:3px 10px;">전체선택</a>
										<a class="dropdown-item" href="#" style="padding:3px 10px;">읽은메일</a>
										<a class="dropdown-item" href="#" style="padding:3px 10px;">읽지않은메일</a>
										<a class="dropdown-item" href="#" style="padding:3px 10px;">중요메일</a>
										<a class="dropdown-item" href="#" style="padding:3px 10px;">중요표시안한메일</a>
										<a class="dropdown-item" href="#" style="padding:3px 10px;">선택해제</a>
									</div>
								</div>

								<a href="" style="margin:0px 48px;">읽음</a>
								<a href="" style="margin:0px 60px;">삭제</a>
								<span style="margin:0px 60px; color:gray;">│</span>

								<div class="dropdown" style="display:inline-block;">
									<a href="" style="margin:0px 30px 0px 60px;" class="dropdown-toggle" data-toggle="dropdown">이동</a>
									<div class="dropdown-menu" style="font-size:13px; padding:0;">
										<a class="dropdown-item" href="#" style="padding:3px 10px;">받은메일함</a>
										<a class="dropdown-item" href="#" style="padding:3px 10px;">보낸메일함</a>
										<a class="dropdown-item" href="#" style="padding:3px 10px;">중요메일함</a>
										<a class="dropdown-item" href="#" style="padding:3px 10px;">휴지통</a>
									</div>
								</div>

								<div class="dropdown" style="display:inline-block;">
									<a href="" style="margin:0px 30px" class="dropdown-toggle" data-toggle="dropdown">필터</a>
									<div class="dropdown-menu" style="font-size:13px; padding:0;">
										<a class="dropdown-item" href="#" style="padding:3px 10px;">모든메일</a>
										<a class="dropdown-item" href="#" style="padding:3px 10px;">안읽은메일</a>
										<a class="dropdown-item" href="#" style="padding:3px 10px;">중요메일</a>
										<a class="dropdown-item" href="#" style="padding:3px 10px;">나에게온메일</a>
										<a class="dropdown-item" href="#" style="padding:3px 10px;">첨부메일</a>
									</div>
								</div>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width:30px;">
								<input type="checkbox" name="" id="">
							</td>
							<td style="width:50px;text-align:right;">
								<img src="resources/icons/star.png" style="width:18px; margin-bottom:3px;">
							</td>
							<td style="width:70px; text-align:left;">
								<img src="resources/icons/mail-c.png" style="width:20px;">
							</td>
							<td style="width:200px">shin@ppic.kr</td>
							<td style="width:750px">제목제목 나는 제목~~~ 여기는 제목자리~~~</td>
							<td style="width:150px; text-align:right;">2023.02.21 15:10</td>
						</tr>
						<tr>
							<td style="width:30px;">
								<input type="checkbox" name="" id="">
							</td>
							<td style="width:50px;text-align:right;">
								<img src="resources/icons/star-y.png" style="width:18px; margin-bottom:3px;">
							</td>
							<td style="width:70px; text-align:left;">
								<img src="resources/icons/mail-opened.png" style="width:20px;">
							</td>
							<td style="width:200px">shin@ppic.kr</td>
							<td style="width:750px">제목제목 나는 제목~~~ 여기는 제목자리~~~</td>
							<td style="width:150px; text-align:right;">2023.02.21 15:10</td>
						</tr>
						<tr>
							<td style="width:30px;">
								<input type="checkbox" name="" id="">
							</td>
							<td style="width:50px;text-align:right;">
								<img src="resources/icons/star-y.png" style="width:18px; margin-bottom:3px;">
							</td>
							<td style="width:70px; text-align:left;">
								<img src="resources/icons/mail-opened.png" style="width:20px;">
							</td>
							<td style="width:200px">shin@ppic.kr</td>
							<td style="width:770px">
								제목제목 나는 제목~~~ 여기는 제목자리~~~
								<img src="resources/icons/clip.png" style="width:18px; margin:0px 5px;">
							</td>
							<td style="width:130px; text-align:right;">2023.02.21 15:10</td>
						</tr>
						<tr>
							<td style="width:30px;">
								<input type="checkbox" name="" id="">
							</td>
							<td style="width:50px;text-align:right;">
								<img src="resources/icons/star.png" style="width:18px; margin-bottom:3px;">
							</td>
							<td style="width:70px; text-align:left;">
								<img src="resources/icons/mail-c.png" style="width:20px;">
							</td>
							<td style="width:200px">shin@ppic.kr</td>
							<td style="width:750px">제목제목 나는 제목~~~ 여기는 제목자리~~~</td>
							<td style="width:150px; text-align:right;">2023.02.21 15:10</td>
						</tr>
						<tr>
							<td style="width:30px;">
								<input type="checkbox" name="" id="">
							</td>
							<td style="width:50px;text-align:right;">
								<img src="resources/icons/star.png" style="width:18px; margin-bottom:3px;">
							</td>
							<td style="width:70px; text-align:left;">
								<img src="resources/icons/mail-c.png" style="width:20px;">
							</td>
							<td style="width:200px">shin@ppic.kr</td>
							<td style="width:750px">제목제목 나는 제목~~~ 여기는 제목자리~~~</td>
							<td style="width:150px; text-align:right;">2023.02.21 15:10</td>
						</tr>
					</tbody>
				</table>

				<br>

				<div id="paging">
					<ul>
						<li><a href="#"><</a></li>
						<li><a href="#">1</a></li>
						<li class="active"><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">></a></li>
					</ul>
				</div>

			</div>

			<!-- Button to Open the Modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
				Open modal
			</button>
			
			<!-- The Modal -->
			<div class="modal" id="myModal">
				<div class="modal-dialog">
				<div class="modal-content">
			
					<!-- Modal Header -->
					<div class="modal-header">
					<h4 class="modal-title">Modal Heading</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
			
					<!-- Modal body -->
					<div class="modal-body">
					Modal body..
					</div>
			
					<!-- Modal footer -->
					<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
			
				</div>
				</div>
			</div>


		</div>
	</div>

</body>
</html>