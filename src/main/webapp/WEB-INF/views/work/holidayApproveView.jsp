<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PPIC</title>
<style>

	<!-- 카테고리 css -->
	
	.workcategory{
	    width: 100%;
	    margin-bottom: 30px;
	}
	.workcategory>a{
	    font-size: 20px;
	    font-weight: bold;
	    margin-right: 20px;
	    color: lightgray;
	    text-decoration:none;
	}
	
	.workcategory>a:link {color:lightgray; text-decoration:none;}
    .workcategory>a:visited {color:lightgray; text-decoration:none;}
	.workcategory>a:hover{color: black; text-decoration:none;}
	
	/* content */
	
	.pro{
        width: 50px;
        height: 50px;
        background: rgb(111, 80, 248);
        color: white;
        border: none;
        border-radius: 10px;
        padding-top: 13px;
        margin-left:5px
    }

    #holidaylist{
        width: 100%;
        /* border:1px solid black; */
        margin-top : 50px;

    }

    #holidayList th td{width:25%;}
    #holidayList thead>tr {height:50px;}
    #holidayList tbody>tr {height:70px;}
	
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />	
	
	<div class="outer">


        <div id="content" style=" " >

            <div onclick="workback();">
				<h2 style="font-weight:bold">근무</h2>
				    <br>
			</div>
			
			<script>
				function workback(){
					location.href="workMain.wo"
				}
			</script>
           
			<div class="workcategory" style="float:left;" >
                <a href="workList.wo" >출퇴근기록</a>
                <a href="workInfo.wo" >올해근무정보</a>
				<a href="holiInfo.ho" >휴가현황</a>
                <a href="holiApply.ho">휴가신청</a>
                
                
                <!-- 관리자만 보이게 할거임 -->
                <a href="memberWork.wo">구성원근무</a>
                <a href="memberHoli.ho">전사원휴가현황</a>
                <a href="holiGive.ho" >휴가지급|회수</a>
                <a href="holiApprove.ho" style="color:black;">휴가승인</a>
                
                <br>
            </div>

			
			<br>
			<br><br>
			
			<div class="holi-give"  >

                <table id="holidaylist">
                    <thead>
                        <tr align="center">
                            <th>이름</th>
                            <th>항목</th>
                            <th>기간</th>
                            <th>사용기간</th>
                        </tr>
                    </thead>
                    <tbody align="center">
                        <tr >
                            <td>
                                <div class="pro" style="float:left" >뫄뫄</div>
                                <div style="float:left; margin-top: 10px; margin-left: 10px; font-size: 20px; font-weight: bold;" > 김뫄뫄</div>
                            </td>
                            <td>연차 / 반차</td>
                            <td>0000.00.00 - 0000.00.00</td>
                            <td>00 일  | 오전,오후 </td>
                        </tr>
                        <tr >
                            <td>
                                <div class="pro" style="float:left" >뫄뫄</div>
                                <div style="float:left; margin-top: 10px; margin-left: 10px; font-size: 20px; font-weight: bold;" > 김뫄뫄</div>
                            </td>
                            <td>연차 / 반차</td>
                            <td>0000.00.00 - 0000.00.00</td>
                            <td>00 일  | 오전,오후 </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="pro" style="float:left" >뫄뫄</div>
                                <div style="float:left; margin-top: 10px; margin-left: 10px; font-size: 20px; font-weight: bold;" > 김뫄뫄</div>
                            </td>
                            <td>연차 / 반차</td>
                            <td>0000.00.00 - 0000.00.00</td>
                            <td>00 일  | 오전,오후 </td>
                        </tr>
                    </tbody>
                </table>
            
                <script>
                    /* td 클릭시 모달창  */
                </script>

            </div>
                
            <!-- 행 클릭시 보여질 휴가승인 Modal -->
            <div class="modal" id="deleteForm">
                <div class="modal-dialog">
                    <div class="modal-content">
                    
                        <!-- Modal Header -->
                        <div class="modal-header">
                        <h4 class="modal-title">휴가승인</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        
                        <!-- Modal body -->
                        <div class="modal-body" align="center">
                        
                            <form action="" method="post" onsubmit="">
                                <div class="form-group">
                                    
                                    <input type="text" class="form-control" id="userId" name="" value="연차" readonly><br>
                                    
                                    <label for="">일정</label>
                                    <input type="text" class="form-control" id="userName" name="" value="휴가 시작일" readonly><br>
                                    <input type="text" class="form-control" id="userName" name="" value="휴가 종료일" readonly><br>
                                    
                                    <label for="">기간</label>
                                    <input type="number" class="form-control" id="" name="" value="00일"><br>

                                    <label for="email"> 사유 </label> <br>
                                    <textarea name="" id="" cols="30" rows="10">휴가 사유 들어갈 자리 </textarea>

                                </div>
                                <br>
                                <div class="btns" align="center">
                                    <button type="submit" class="btn-purple btn-holi">수정하기</button>
                                    
                                </div>
                            </form>

                        </div>
                        
                    </div>
                </div>
            </div>
			
			
			
			  

        </div>
    </div>	
	
</body>
</html>