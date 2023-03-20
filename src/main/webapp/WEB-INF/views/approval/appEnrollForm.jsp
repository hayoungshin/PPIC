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
	.second-1, .second-2{box-sizing: border-box; float: left;}

    .title-area{float: left;}
    #title-area-selop{float: left; margin-top: 5px; margin-left: 50px;}
    
    .second-1{width: 75%;}
    .form-area{padding: 30px;}
    #tb{width:100%; text-align: center;}
    #tb tr{height:40px;}
    .add-btn-area{float: left;}
    .btnn-pp{font-size: 14px; background-color: white; color: #6F50F8; border:1px solid #6F50F8; border-radius: 4px; padding: 4px; padding-left: 8px; padding-right: 8px;}
    .btnn-pp:hover{background-color: #6F50F8; color: white; transition: 0.3s;}
    
    .second-2{width: 25%;}
    .agree-area{margin-top: 6px; border: 1px solid lightgray;}
    .line{width: 80%;}
    .line-content{text-align: left;}
    .person-title{float: left; width: 80px;}
    .plus{cursor: pointer;}
    .level{padding-left: 10px;}
    .level-person{margin-bottom: 30px;}
	.person-img{font-size: x-large;}
	
    .btnn-gr{font-size: 14px; background-color: white; color: gray; border:1px solid gray; border-radius: 4px; padding: 4px; padding-left: 8px; padding-right: 8px;}
    .btnn-gr:hover{background-color: gray; color: white; transition: 0.3s;}
    .btnn-pp{text-align: center; width: 350px; font-size: 35px; background-color: white; color: #6F50F8; border:3px solid #6F50F8; border-radius: 10px; padding: 40px; margin: 20px;}
	.btnn-pp:hover{background-color: #6F50F8; color: white; transition: 0.3s;}
	.btnn-kk{text-align: center; width: 350px; font-size: 35px; background-color: white; color: #de81fb; border:3px solid #de81fb; border-radius: 10px; padding: 40px; margin: 20px;}
	.btnn-kk:hover{background-color: #de81fb; color: white; transition: 0.3s;}
	.btnn-pk{text-align: center; width: 350px; font-size: 35px; background-color: white; color: #fdbaba; border:3px solid #fdbaba; border-radius: 10px; padding: 40px; margin: 20px;}
    .btnn-pk:hover{background-color: #fdbaba; color: white; transition: 0.3s;}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div id="content" align="center">
		<div class="first">
            <div class="title-area"><h2><b>작성하기</b></h2></div>
        </div>
        <br clear="both"><br>
        
    	<table>
    		<tr>
    			<td><div class="btnn-pp" onclick="location.href='enrollDraftForm.ap'"><b>업무기안</b></div></td>
    			<td><div class="btnn-kk" onclick="location.href='enrollTransferForm.ap'"><b>인사발령품의서</b></div></td>
    		</tr>
    		<tr>
    			<td><div class="btnn-kk" onclick="location.href='enrollConsumeForm.ap'"><b>비품신청서</b></div></td>
    			<td><div class="btnn-pk" onclick="location.href='enrollCashForm.ap'"><b>지출결의서</b></div></td>
    		</tr>
    	</table>
        <br><br><br>
        
        <button class="btnn-gr" onclick="javascript:history.go(-1);">목록</button>
    </div>
</body>
</html>