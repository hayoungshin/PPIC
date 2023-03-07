<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #alarm-popup{
    	background:white;
        border: 1px solid rgb(202, 199, 199);
        width:250px;
        height:450px;
        border-radius:5px;
        padding:15px;
        font-size: 12px;
        overflow: auto;
        position:fixed;
        z-index:100;
        top:120px;
        left:250px;
        display:none;
    }
    #alarm-popup::-webkit-scrollbar {
	    width: 8px; 
	}
	
	#alarm-popup::-webkit-scrollbar-thumb {
	    background: lightgray;
	    border-radius: 10px;
	}
    #allRead{
        color:white;
        width:70px;
        height:30px;
        font-size: 12px;
        background: rgb(111, 80, 248);
    }
    #alarm-popup td{
        padding:3px;
    }
    .icon{
        vertical-align: top;
    }
</style>
</head>
<body>
    <div id="alarm-popup">
	    <b style="font-size:17px;">새로운 알림</b>
	    <a href="" class="btn btn-sm" style="float:right" id="allRead">모두 읽음</a>
	    <br><br>
	    <table>
	        <tr>
	            <td class="icon">🔔</td>
	            <td>
	                '회의실 사용' 승인이 완료되었어요. <br>
	                <small>1분전</small>
	            </td>
	        </tr>
	    </table>
	    <br>
	    <b style="font-size:17px;">지난 알림</b>
	    <a href="" class="btn btn-sm" style="float:right;"><small>전체조회</small></a>
	    <br><br>
	    <table>
	        <tr>
	            <td class="icon">✔️</td>
	            <td>
	                하니님이 '계약서 검토 요청' 승인을 요청했어요. <br>
	                <small>50분전</small>
	            </td>
	        </tr>
	        <tr>
	            <td class="icon">✔️</td>
	            <td>
	                하니님이 '계약서 검토 요청' 승인을 요청했어요. <br>
	                <small>50분전</small>
	            </td>
	        </tr>
	        <tr>
	            <td class="icon">✔️</td>
	            <td>
	                하니님이 '계약서 검토 요청' 승인을 요청했어요. <br>
	                <small>50분전</small>
	            </td>
	        </tr>
	        <tr>
	            <td class="icon">✔️</td>
	            <td>
	                하니님이 '계약서 검토 요청' 승인을 요청했어요. <br>
	                <small>50분전</small>
	            </td>
	        </tr>
	        <tr>
	            <td class="icon">✔️</td>
	            <td>
	                하니님이 '계약서 검토 요청' 승인을 요청했어요. <br>
	                <small>50분전</small>
	            </td>
	        </tr>
	        <tr>
	            <td class="icon">✔️</td>
	            <td>
	                하니님이 '계약서 검토 요청' 승인을 요청했어요. <br>
	                <small>50분전</small>
	            </td>
	        </tr>
	        <tr>
	            <td class="icon">✔️</td>
	            <td>
	                하니님이 '계약서 검토 요청' 승인을 요청했어요. <br>
	                <small>50분전</small>
	            </td>
	        </tr>
	    </table>
    </div>
</body>
</html>