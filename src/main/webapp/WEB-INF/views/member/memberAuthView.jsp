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
	
	.memberCategory{
	    width: 100%;
	    margin-bottom: 30px;
	}
	.memberCategory>a{
	    font-size: 20px;
	    font-weight: bold;
	    margin-right: 20px;
	    color: lightgray;
	    text-decoration:none;
	}
	
	.memberCategory a:link {color:lightgray; text-decoration:none;}
    .memberCategory a:visited {color:lightgray; text-decoration:none;}
	.memberCategory a:hover{color: black; text-decoration:none;}
	
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

    .proname{
    	float:left; 
    	margin-top: 10px; 
    	margin-left: 10px; 
    	font-size: 20px; 
    	font-weight: bold;"
    }

    .position{
        width: 200px;
        height: 50px;
        background: rgb(221, 221, 221);
        color: black;
        border: none;
        border-radius: 35px;
        padding-top: 13px;
        margin-left:5px;
        margin-right:20px;
    }

    .member{
        width: 70%;
        margin-right: 30px;
    }
    
    .memberList { overflow:auto; height:500px; white-space: nowrap;}
    .memberList::-webkit-scrollbar { width: 8px; }
	.memberList::-webkit-scrollbar-thumb {background: lightgray; border-radius: 10px;}
    
    #list {width:95%; margin-left:10px;}
   
    #list thead td{border: 1px solid darkgray;}
	#list thead td:first-child {border-left: 0;}
	#list thead td:last-child {border-right: 0;}
    
    #list thead tr {height:30px; }
    #list tbody tr {height:70px; }
    
    #list tbody{ overflow:auto; height:450px; white-space: nowrap; }
  
	.v-line{
        border-left: thin solid lightgray;
        height:70%;
        left: 50%;
        position: absolute;
        margin-left: 275px;
    }

	.organizationchart{ width:25%; padding: 20px;}

    #org{
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 30px;
    }

    .depttitle{ font-size: 15px; font-weight: 600; }

    .deptlist{
        font-size: 15px;
        font-weight: 600;
        margin-top:20px;
        margin-left: 20px;
    }

    .deptlist div{ margin-bottom: 10px; }
	
	
	/* modal */
	
	.form-group select { width:150px; margin-left:20px;}
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp" />	
	
	<div class="outer">


        <div id="content" style=" " >

            <div onclick="workback();">
				<h2 style="font-weight:bold">구성원</h2>
				    <br>
			</div>
			
			<script>
				function workback(){
					location.href="memberMain.me"
				}
			</script>
           
			<div class="memberCategory" style="float:left;" >
                
                <!-- 관리자만 보이게 할거임 -->
                <a href="memberList.me" >구성원</a>
                <a href="memberAuth.me" style="color:black;" >권한설정</a>
               
                <br>
            </div>

			<br><br><br>
			
			<div class="member" style="float:left">
			
				<div>
				    <div style="float:left; font-size: 18px; font-weight: bold; width:200px;">전체</div>
				
					<button class="btn-purple" style="float:right; margin-right:20px;" data-toggle="modal" data-target="#authUpdate">권한추가</button>
					
					<div style="float:right; margin-right:20px;">
						<img src="resources/icons/up-down.png" style="width:25px; ">
					</div>
					
					<div style="float:right; margin-right:10px;">
						<img src="resources/icons/search.png" style="width:25px; ">
					</div>
					
					
					
					<br><hr>
				</div>
			               
				<div class="memberList">
					
					<table id="list"  style="width:95%">
                        <thead>
                            <tr style="height:50px">
                                <th width="45%">이름</th>
                                <th width="20%">소속</th>
                                <th width="20%">권한</th>
                            </tr>
                        </thead>
                        <tbody style="height:60px">
                            <tr>
                                <td>
                                    <div class="pro" style="float:left" align="center" >뫄뫄</div>
                                    <div class="proname"> 김뫄뫄</div>
                                </td>
                                <td> 관리자</td>
                                <td> ALL</td>
                            </tr>

                            <tr >
                                <td>
                                    <div class="pro" style="float:left" align="center" >뫄뫄</div>
                                    <div style="float:left; margin-top: 10px; margin-left: 10px; font-size: 20px; font-weight: bold;" > 김뫄뫄</div>
                                </td>
                                <td> 관리자</td>
                                <td> 문서 | 회사소식</td>
                            </tr>
                        </tbody>
                    </table>
					
				</div>
				
			</div>

            <div class="v-line"></div>
            
            <div class="organizationchart" style="float:left">
                <div id="org">조직도</div>
				<div class="depttitle"> 전체 구성원 (00) </div>
                <div class="deptlist">
                    <div> 00부 (00) </div>
                    <div> 00부 (00) </div>
                    <div> 00부 (00) </div>
                </div>
            </div>
              
		</div>
			
	</div>
	
	<!-- 권한 추가 Modal -->
	    <div class="modal" id="authUpdate">
	        <div class="modal-dialog">
	            <div class="modal-content">
	            
	                <!-- Modal Header -->
	                <div class="modal-header">
	                <h4 class="modal-title">권한추가</h4>
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                </div>
	                
	                <!-- Modal body -->
	                <div class="modal-body" style="padding:50px; font-size:18px;">
	                
	                    <form action="" method="post" onsubmit="">
	                        <div class="form-group">
	                            
	                            <label>대상</label>
	                            <select name="" id="">
	                                <option value="1">부서</option>
	                                <option value="1">부서</option>
	                                <option value="1">부서</option>
	                            </select>
	                            <select>
	                                <option value="">사원리스트</option>
	                            </select>
	
	                            <br><br>
	
	                            <label for="">권한</label>
	                            <select name="" id="">
	                                <option value="ALL">ALL</option>
	                                <option value="ALL">ALL</option>
	                                <option value="ALL">ALL</option>
	                            </select>
	
	
	                            
	                        </div>
	                        <br>
	                        <div class="btns" align="center">
	                            <button type="submit" class="btn-purple btn-holi">적용하기</button>
	                            
	                        </div>
	                    </form>
	
	                </div>
	                
	            </div>
	        </div>
	    </div>
    	
	
</body>
</html>