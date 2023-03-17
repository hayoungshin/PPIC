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
	
	.holi-give {
        width: 49%;
        float: left;
        /* border: 1px solid black; */
    }

    .holi-out {
        width: 49%;
        /* border: 1px solid black; */
        float: left;
        margin-bottom: 30px;
    }

    .holidayinfo{
        background: lightgray;
        margin: auto;
        width: 90%;
        height: 30%; 
        float: left;
        padding: 5px 5px 5px 5px ;
        text-align: center;
        margin-top:30px;
    }

    .holititle{
        font-size: 18px;
        font-weight:600;
        margin: 5px;
    }

    label{font-size:18px; margin:5px 50px 30px 5px;}

    #homem { margin-right: 66px;}
    #homem2 { margin-right: 66px;}

    select{ width: 150px; height: 30px;}

    .btn-holi{width: 70px; margin-left: 300px;}
	
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
				<a id="info" >휴가현황</a>
                <a href="holiApply.ho">휴가신청</a>
                
                
                <!-- 관리자만 보이게 할거임 -->
                <a href="memberWork.wo">구성원근무</a>
                <a href="memberHoli.ho">전사원휴가현황</a>
                <a href="holiGive.ho">휴가지급|회수</a>
                <a href="holiApprove.ho">휴가승인</a>
                
                <br>
            </div>
            
            <script>
            $(function(){
        		$("#info").click(function(){
        			location.href = 'holiInfo.ho?no=' + ${loginUser.userNo}; 
        		})
        	})
            </script>

			
			<br>
			<br><br>
	
			
			<div class="holi-give"  >
				<div class="holititle">휴가지급</div>
				
				<br> 
				
				<form action="">
				    <label id="homem" >대상자</label>
				    
				    <select class="dept" name="dept" id="dept">
				    	<option value="">소속</option>
				    	<c:forEach var="d" items="${ list2 }">
			            	<option value="${ d.departmentNo }"> ${ d.departmentName }</option>
			            </c:forEach>
				    </select>
				    
				    <select name="member" id="member">
				    	<c:forEach var="m" items="${ list1 }">
				    			<option value="${m.userNo}"> ${ m.userName }(사번) </option>
				    	</c:forEach>
			        </select>
			        
			        <script>
			        	
		        		$("select[name=dept]").change(function(){
		        			var dept = $("select[name=dept] option:selected").text();
		        			console.log(dept);
		        			
		        			
		        			
		        			
		        		});
			      
			        </script>
				
				    <br><br>
				
				    <label>지급내역</label>
				    <select name="cause" id="cause">
				        <option value="">연차</option>
				        <option value="">여름휴가</option>
				    </select>
				
				    <br><br>
				
				    <label>지급일수</label>
				    <input type="number" id="" name="" style="width:150px">
				        
				    <br><br>
				
				    <input class="btn-purple btn-holi" type="submit" value="저장">
				</form>
				    
				
			</div>
			
			<div class="holi-out">
			    <div class="holititle">휴가회수</div>
			    
			    <br>
			
			    <form action="">
			        <label id="homem2">대상자</label>
			        <select name="" id="" >
			            <option value="">소속</option>
			        </select>
			        <select name="" id="">
			        	<c:forEach var="m" items="${ list }">
			            	<option value="${ m.userNo }"> ${ m.userName }(사번)</option>
			            </c:forEach>
			        </select>
			
			        <br><br>
			
			        <label>지급내역</label>
			        <select name="cause" id="cause">
			            <option value="1">연차</option>
			            <option value="1">여름휴가</option>
			        </select>
			
			        <br><br>
			
			        <label>지급일수</label>
			        <input type="number" id="" name="" style="width:150px">
			        
			        <br><br>
			
			        <input class="btn-purple btn-holi" type="submit" value="저장">
			    </form>
			    
			</div>
			
			<br><br><br><br>
			
			<div class="holidayinfo">
			    조직을 선택하여 휴가를 수동생성할 대상자를 선택하고, 현재 휴가에 추가로 생성 및 회수 할 수 있습니다. 
			    <br><br>
			    생성할 휴가 종류와 일수를 선택하여 사용자의 휴가를 생성하세요.
			    <br><br>
			    회수할 휴가 종류와 일수를 선택하여 사용자의 휴가를 회수하세요.
			    <br>
			    <br>
			</div>
			
			  

        </div>
    </div>	
	
</body>
</html>