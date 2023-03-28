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
    /* 작성하기 */
    .title-area{
		float: left;
	}
    
    /* button */
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
    .btnn-pp{
        text-align: center; 
        width: 350px; 
        font-size: 35px; 
        background-color: white; 
        color: #6F50F8; 
        border:3px solid #6F50F8; 
        border-radius: 10px; 
        padding: 40px; 
        margin: 20px;
    }
	.btnn-pp:hover{
        background-color: #6F50F8; 
        color: white; 
        transition: 0.3s;
    }
	.btnn-kk{
        text-align: center; 
        width: 350px; 
        font-size: 35px; 
        background-color: white; 
        color: #de81fb; 
        border:3px solid #de81fb; 
        border-radius: 10px; padding: 40px; 
        margin: 20px;
    }
	.btnn-kk:hover{
        background-color: #de81fb; 
        color: white; 
        transition: 0.3s;
    }
	.btnn-pk{
        text-align: center; 
        width: 350px; 
        font-size: 35px; 
        background-color: white; 
        color: #fdbaba; 
        border:3px solid #fdbaba; 
        border-radius: 10px; 
        padding: 40px; 
        margin: 20px;
    }
    .btnn-pk:hover{
        background-color: #fdbaba; 
        color: white; 
        transition: 0.3s;
    }
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
    			<td><div class="btnn-pp" onclick="location.href='enrollForm.ap?form=1'"><b>업무기안</b></div></td>
    			<td><div class="btnn-kk" onclick="location.href='enrollForm.ap?form=2'"><b>인사발령품의서</b></div></td>
    		</tr>
    		<tr>
    			<td><div class="btnn-kk" onclick="location.href='enrollForm.ap?form=3'"><b>비품신청서</b></div></td>
    			<td><div class="btnn-pk" onclick="location.href='enrollForm.ap?form=4'"><b>지출결의서</b></div></td>
    		</tr>
    	</table>
        <br><br><br>
        
        <button class="btnn-gr" onclick="location.href='list.ap?myi=1';">목록</button>
    </div>
</body>
</html>