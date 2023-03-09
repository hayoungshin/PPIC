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
	
	
	
	.holiday{
	    width: 50%;
	    margin-top : 50px;
	}
	
	.holidayList{
	    
	    width:100%;
	    height: 400px;
	    padding: 2px;
	   
	}
	
	.holidayList table {
		width:100%;
		margin-left:20px;
		font-size : 20px;
	}
	
	.H_date{
	    width: 150px;
	}
	
	.holidaystatus{
	    font-size: 15px;
	    color:white;
	    background: rgb(111, 80, 248);
	    width: 100px;
	    border-radius: 10px;
	    margin: auto;
	    margin-left: 6px;
	}
	
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
                <a href="holiApply.ho" style="color:black;">휴가신청</a>
                
                
                <!-- 관리자만 보이게 할거임 -->
                <a href="memberWork.wo">구성원근무</a>
                <a href="memberHoli.ho">전사원휴가현황</a>
                <a href="holiGive.ho">휴가지급|회수</a>
                <a href="holiApprove.ho">휴가승인</a>
                
                <br>
            </div>
			
			<br>
	
			
			
            
            <!-- 연차 -->
            <div class="holiday" style="float:left">
                <h5 style="margin-bottom:30px">휴가등록</h5>
                <form>
	                <select style="width:150px;">
	                    <option> 연차</option>
	                    <option> 반차</option>
	                </select>
	                <br>
	                <br>
	
	                <label>휴가일정</label> <br>
	                <input type="text" class="H_date" name="date"> &nbsp;&nbsp;-&nbsp;&nbsp; <input type="text" class="H_date" name="date">
					
					<br>
	                <br>
	                
					<label>휴가기간</label> <br>
	                <input type="number" class="H_date" name="">
	                
	                <br><br>
	                <label>사유</label> <br>
	                <textarea  cols="80" rows="5" style="resize:none;"></textarea>
	
	                <br><br>
	                <div style="margin-left:250px">
	                	<input class="btn-purple" type="submit" value="휴가신청">
	                </div>
                </form>
            </div>

            <!-- 반차 -->
            <!-- <div class="holidayinsert" style="float:left">
                <h5 style="margin-bottom:20px">휴가등록</h5>
                
                <select>
                    <option> 연차</option>
                    <option> 반차</option>
                </select>
                <br>
                <br>

                <label>휴가일정</label> <br>
                <input type="text" class="H_date" name="date"> &nbsp;&nbsp;-&nbsp;&nbsp; <input type="text" class="H_date" name="date">

                <br><br>
                <input type="radio" > 오전 <input type="radio" > 오후 <br>
                <input type="text" class="H_date" name="date"> &nbsp;&nbsp;-&nbsp;&nbsp; <input type="text" class="H_date" name="date">

                <br><br>
                <label>사유</label> <br>
                <textarea></textarea>

                <br><br>
                <button>휴가신청</button>
            </div>

            <div class="holidaylist" style="float:left">
                <h5>예정휴가</h5>
                <div>

                </div>
            </div> -->

            <div class="holiday" style="float:left">
                <h5 style="margin-bottom:20px">예정휴가</h5>
                
                <div class="holidayList">

                    <table  >
                        <tr height="100px">
                            <td width="100px">
                            	<img src="resources/icons/vacations.png" width="90%">
							</td>
                            <td>연차 | 2023.03.20 - 2023.03.20</td>
                            <td><div class="holidaystatus" align="center">승인완료</div></td>
                        </tr>
                         <tr height="100px">
                            <td width="100px">
                            	<img src="resources/icons/vacations.png" width="90%">
							</td>
                            <td>연차 | 2023.03.20 - 2023.03.20</td>
                            <td><div class="holidaystatus" align="center">승인완료</div></td>
                        </tr>
                         <tr height="100px">
                            <td width="100px">
                            	<img src="resources/icons/vacations.png" width="90%">
							</td>
                            <td>연차 | 2023.03.20 - 2023.03.20</td>
                            <td><div class="holidaystatus" align="center">승인완료</div></td>
                        </tr>
                    </table>

                </div>
            </div>
			 
			
			  

        </div>
    </div>	

</body>
</html>