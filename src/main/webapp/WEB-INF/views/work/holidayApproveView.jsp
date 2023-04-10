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
	
	.inputcss{
		width:150px;
		border-radious:5px;
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
					location.href="workMain.wo?no="+${loginUser.userNo }
				}
			</script>
           
            <div class="workcategory" style="float:left;" >
                <a href="workList.wo?no=${loginUser.userNo }" >출퇴근기록</a>
				<a href="holiInfo.ho?no=${loginUser.userNo }" >휴가현황</a>
                <a href="holiApply.ho?no=${loginUser.userNo }">휴가신청</a>
                
                
                <br>
            </div>
			<div class="workcategory mworkcategory">
				<!-- 관리자만 보이게 할거임 -->
				<a href="memberWork.wo">구성원근무</a>
				<a href="memberHoli.ho">전사원휴가현황</a>
				<a href="holiGive.ho">휴가지급|회수</a>
				<a href="holiApprove.ho" style="color:black;">휴가승인</a>
			</div> 
            
            
            <script>
				$(function(){
	        		
	        		$(".mworkcategory").hide();
	        		
	        		var a = "${loginUser.authorityNo}";
	        		
	
	        		if (a.includes('2') || a.includes('0')) {
	        			$(".mworkcategory").show();
	       			} else {
	       				
	       			}
	        	})
			</script>

			
			<br>
			<br><br>
			
			<div class="holi-give"  >

                <table id="holidaylist">
                    <thead>
                        <tr align="center">
                            <th>이름</th>
                            <th>종류</th>
                            <th>일정</th>
                            <th>사용기간</th>
                            <th>사유</th>
                            <th>승인</th>
                        </tr>
                    </thead>
                    <tbody align="center">
                        <c:forEach var="h" items="${ list }">
                        <tr >
                            <td>
                            	<div id="holidayNo" style="float:left; display:none;" >${h.holidayNo }</div>
                                <div class="pro" style="float:left" >${h.userName }</div>
                                <div style="float:left; margin-top: 10px; margin-left: 10px; font-size: 20px; font-weight: bold;" > ${h.userName }</div>
                            </td>
                            <td id="holitype">${h.type }</td>
                            <td><label id="holistart">${h.start }</label> - <label id="holifinish">${h.finish }</label></td>
                            <c:choose>
                            	<c:when test="${ h.type eq '연차'  }">
                            		<td id="holidate">${h.datea}일</td>
                            	</c:when>
                            	<c:otherwise>
                            		<td id="holisort">${h.sort} </td>
                            	</c:otherwise>
                            </c:choose>
                            <td id="holireason">${ h.reason }</td>
                            <td>
                            	<button type="button" name="type" 
                            	onClick="a(${h.holidayNo}, '${h.type}', '${h.start }', '${h.finish }','${h.datea}','${h.sort}','${ h.reason }', ${h.userNo})" 
                            	class="btn-purple" data-toggle="modal" data-target="#holidayApprove" id="gg">휴가승인</button>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
                <script>
                	function a(a, b, c, d, e, f, g, h){
                		var holidayNo = a;
                 	    $("#no").val(holidayNo);
                 	    
                 		var type =b;
               	    	$("#type").val(type);
               	    	
	               	    var start =c;
	             	    $("#start").val(start);
               	    	
	             	    var finish=d;
	            	    $("#finish").val(finish);
	            	    
	            	    var datea=e;
	            	    $("#datea").val(datea);
	            	    
	            	    var sort=f;
	            	    $("#sort").val(sort);
	            	    
	            	    var reason=g;
	            	    $("#reason").text(reason);
	            	    
	            	    var userNo=h;
	            	    $("#uNo").val(userNo);
                	}
                </script>
            	
            </div>
                
            <!-- 버튼 클릭시 보여질 휴가승인 Modal -->
            <div class="modal" id="holidayApprove">
                <div class="modal-dialog">
                    <div class="modal-content">
                    
                        <!-- Modal Header -->
                        <div class="modal-header">
                        <h4 class="modal-title">휴가승인</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        
                        <!-- Modal body -->
                        <div class="modal-body" align="center">
                        
                            <form action="approve.ho" method="post" >
                                <div class="form-group">
                                 			<input type="hidden" id="uNo" name=userNo value="" >
                                	<table style="float:none; margin-bottom:30px;">
                                		<tr>
                                			<td style="width:150px;">종류</td>
                                			<td>
                                				<input type="hidden" class="inputcss" id="no" name="holidayNo" value="" readonly>
                                				<input type="text" class="inputcss" id="type" style="border:none" name="" value="" readonly>
                                			</td>
                                			<td></td>
                                		</tr>
                                		<tr>
                                			<td>일정</td>
                                			<td>
                                				<input type="text" class="inputcss" id="start" style="border:none; width:100px" name="" value="" readonly> -
                                    			<input type="text" class="inputcss" id="finish" style="border:none; width:100px" name="" value="" readonly>
                                			</td>
                                			<td></td>
                                		</tr>
                                		
                                			<tr>
                                			<td>기간</td>
                                			<td id="optionY">
                                				<input type="text" class="inputcss" id="datea" name="datea" style="border:none" value="" readonly>
                                			</td>
                                		
                                			<td></td>
                                		</tr>
                                		
                                		<tr>
                                			<td>사유</td>
                                			<td id="reason"></td>
                                			<td id="causeY">
                                				<input type="hidden" style="width:100px;" class="inputcss"  name="cause" value="연차사용">
                                			</td>
                                			
                                		</tr>
                                		
                                	</table>
                                   
									<select style="float:none;" name="status" id="option" onchange="changehtml();" style="margin-left:150px;">
										<option value="승인">승인하기</option>
										<option value="거절">승인거부</option>
									</select>
									
									<script>
										function changehtml(){
											var option = document.getElementById('option').value;
											var a = document.getElementById('causeY')
											
											if(option=="승인"){
												a.innerHTML ='<input type="hidden" style="width:100px;" class="inputcss"  name="cause" value="연차사용">';
											}else if(option=="거절") {
												a.innerHTML ='<input type="hidden" style="width:100px;" class="inputcss"  name="cause" value="승인거절">';
											}
										}
									</script>
									
									
                                </div>
                                <br>
                                <div class="btns" align="center">
                                    <button type="submit" class="btn-purple btn-holi">저장하기</button>
                                </div>
                            </form>
                            
                           

                        </div>
                        
                    </div>
                </div>
            </div>
			
			<!-- 알림 관련 -->
			<script>
				$(".btn-holi").click(function(){
					if($("select[name=status]").val() == '승인'){
						alarmCategory(9,  $("#uNo").val(), 3, $("#type").val());
					}else{
						alarmCategory(10,  $("#uNo").val(), 3, $("#type").val());
					}
				})
			</script>
			
			  

        </div>
    </div>	
	
</body>
</html>