<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 /* content css */

    .worktitle{
        width: 100%;
    }

    .workcategory{
       /* border: 1px solid black; */
        width: 100%;
        margin-bottom: 30px;
    }

    .workcategory>a{
        font-size: 20px;
        font-weight: bold;
        margin-right: 20px;
        color: lightgray;
    }

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
    }

    .holititle{
        font-size: 18px;
        font-weight:600;
        margin: 5px;
    }

    label{
        font-size:18px;
        margin:5px 50px 30px 5px;
       
    }

    #homem { margin-right: 66px;}
    #homem2 { margin-right: 66px;}

    select{
        width: 150px;
        height: 30px;
    }

    .btn-holi{
        width: 70px;
        margin-left: 300px;
    }


    .profile{
        width: 100%;
        height: 110px;
       
    }

    .p_name{
        
        width: 400px;
        height: 100px;
        margin-bottom: 5px;
    }

    #profileImg{
        width:100px;
        height:100px;
        background: rgb(111, 80, 248);
        border-radius: 25%;
        margin-right: 20px;
        margin-bottom: 30px ;
    }

    .phone{
        width: 25px;
        height: 25px;
        background: rgb(111, 80, 248);
        margin: 2px 10px 2px 2px;
        border-radius: 10%;
    }
    .email{
        width: 25px;
        height: 25px;
        background: rgb(111, 80, 248);
        margin: 2px 2px 2px 2px;
        border-radius: 10%;
    }
    .myPagecategory{
        width: 100%;
        
    }
    .myPagecategory>a{
        font-size: 20px;
        font-weight: bold;
        margin-right: 20px;
    }
    #p_title{
        width: 100px;
        
    }
    .p_update{
        width: 25px;
        height: 25px;
        background: rgb(111, 80, 248);
        margin: 2px 2px 2px 2px;
        border-radius: 10%;
       
    }
</style>
</head>
<body>

	<jsp:include page="../common/menubar.jsp" />
	
	<div class="outer">


        <div id="content" style=" " >

            <div>
                <h2 >내 프로필</h2>
                <br>
            </div>
           
            <div class="profile">
                <div class="profileImg" style="float:left">
                    <img id="profileImg" src="" onclick="$('#profileImgFile').click();">
                    <input type="file" id="profileImgFile" style="display:none;">
                </div>
                <div class="p_name" style="float:left" >
                    <h4 >이름</h4>
                    <h5>소속</h5>
                    <div class="phone" style="float:left;"> <img src="resources/icons/phone_white.png" style="width:80%; margin:1px 3px 3px 3px;"></div>
                    <div class="email" style="float:left"> <img src="resources/icons/email_white.png" style="width:80%; margin:1px 3px 3px 3px;"></div>
                </div>
            </div>

            <div class="myPagecategory" style="float:left" >
                <a style="color:black">인사정보</a>
                <a style="color:lightgray">문서</a>
                <hr>
            </div>

            <div class="" style="float:right">
                <img src="resources/icons/approval.png" style="width:20px; margin:1px 3px 3px 3px;">
           </div>

           <script>
                /* 프로필 변경 모달 */

           </script>

            <div class="member" >
                <label id="p_title" for="">사번</label>
                <label for="">사번자리</label>
                <br>

                <label id="p_title" for="">입사일</label>
                <label for="">입사일자리</label>
                <br>
                
                <label id="p_title" for="">소속</label>
                <label for="">소속자리</label>
                <br>

                <label id="p_title" for="">직위</label>
                <label for="">직위자리</label>
                <br>

                <label id="p_title" for="">이메일</label>
                <label for="">이메일자리</label>
                <br>

                <label id="p_title" for="">휴대전화</label>
                <label for="">번호자리</label>
                <br>

                <label id="p_title" for="">주소</label>
                <label for="">주소자리</label>
                <br>

            </div>
            <br>

        </div>
    </div>

    <!-- 아이콘 클릭시 보여질 프로필변경 Modal -->
    <div class="modal" id="deleteForm">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">회원정보수정</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body" align="center">
                
                    <form action="" method="post" onsubmit="">
                        <div class="form-group">
                            
                            <label id="p_title" for="">사번</label>
                            <label for="">사번자리</label>
                            <input type="hidden" class="form-control" id="" name="" value="사번자리"><br>
                            <br>

                            <label id="p_title" for="">입사일</label>
                            <label for="">입사일자리</label>
                            <input type="hidden" class="form-control" id="" name="" value="입사일"><br>
                            <br>
                            
                            <label id="p_title" for="">소속</label>
                            <label for="">소속자리</label>
                            <input type="hidden" class="form-control" id="" name="" value="소속자리"><br>
                            <br>

                            <label id="p_title" for="">직위</label>
                            <label for="">직위자리</label>
                            <input type="hidden" class="form-control" id="" name="" value="직위자리"><br>
                            <br>

                            <label id="p_title" for="">이메일</label>
                            <label for="">이메일자리</label>
                            <input type="hidden" class="form-control" id="" name="" value="이메일자리"><br>
                            <br>

                            <label id="p_title" for="">휴대전화</label>
                            <input type="number" class="form-control" id="" name="" value="000-0000-0000"><br>
                            <br>

                            <label id="p_title" for="">주소</label>
                            <input type="text" class="form-control" id="" name="" value="00시 00동"><br>

                            <br>
                            
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

</body>
</html>