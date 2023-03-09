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

    .position{
        width: 200px;
        height: 50px;
        background: rgb(221, 221, 221);
        color: black;
        border: none;
        border-radius: 35px;
        padding-top: 13px;
        margin-left:5px
    }

    .memberlist{
        width: 70%;
        border: 1px solid black;
    }
    
    #list th td{width:25%;}
    #list thead tr {height:50px;}
    #list tbody tr {height:70px;}

    .organizationchart{
        width:30%;
        border: 1px solid black;
    }
	
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
					location.href="memberList.me"
				}
			</script>
           
			<div class="memberCategory" style="float:left;" >
                
                <!-- 관리자만 보이게 할거임 -->
                <a href="memberWork.wo" >구성원</a>
                <a href="memberHoli.ho">권한설정</a>
               
                <br>
            </div>

			
			<br><br><br>
	
			 <div class="member"  >

                
                
                <div class="memberlist" style="float:left">
                   
                    <div >
                        전체
                        <div style="float:right">검색</div>
                        <div style="float:right">정렬</div>
                        <hr>
                    </div>

                    <table id="list">
                        <tbody align="center">
                            <tr>
                                <td width="80%">
                                    <div class="pro" style="float:left" >뫄뫄</div>
                                    <div style="float:left; margin-top: 10px; margin-left: 10px; font-size: 20px; font-weight: bold;" > 김뫄뫄</div>
                                </td>
                                <td>
                                    <div class="position" style="float:right" >00부 | 대리 </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                    


                </div>
                
                <div class="organizationchart" style="float:left">
                    <span id="org">조직도</span>

                    <li>총무부</li>
                    <li>기획부</li>
                    <li>인사부</li>
                </div>
                
            
                <script>
                    /* td 클릭시 모달창 */
                </script>

            </div>
			
			
			  

        </div>
    </div>	
	
</body>
</html>