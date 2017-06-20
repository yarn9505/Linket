<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html lang="en">
<%-- <%@include file="/WEB-INF/views/layout/header-footer-layout.jsp"%> --%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- 
	@File name : join.jsp
 	@author 송아름, 황영롱(다음 주소 api -> 네이버 주소->위도,경도 연동)
 	김용래(구글 api->데이터->회원가입)
  	@Desc 회원가입 form
 -->
 <style>
input[type=checkbox] {  
    display: none;  
}
 
 input[type=checkbox] + label{
    display: inline-block;  
    cursor: pointer;  
    position: relative;  
    padding-left: 25px;  
    margin-right: 15px;  
    font-size: 13px;
}

input[type=checkbox]+ label:before {     

    content: "";  
    display: inline-block;  
  
    width: 20px;  
    height: 20px;  
  
    margin-right: 10px;  
    position: absolute;  
    left: 0;  
    bottom: 1px;  
    background-color: #ccc;  
    border-radius: 2px; 
    box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px rgba(255, 255, 255, .8);  
}
input[type=checkbox]:checked + label:before { 

    content: "\2713";  /* 체크모양 */
    text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);  
    font-size: 18px; 
    font-weight:800; 
    color: #fff;  
    background:#2f87c1;
    text-align: center;  
    line-height: 18px;  

} 
 </style>
 
</head>
<body>
   <div class="container">
         <h3 style="color: #0E3E59;margin-bottom: 3%;" >
         <span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>&nbsp;회원가입</h3>
      <div class="col-md-6 col-md-offset-3">
         <form role="form" id="form1">
            <div class="form-group">
               <label class="control-label">아이디</label>
               <div class="input-group">
                  <input type="text" class="form-control"id="userId" name="userId"  placeholder="아이디를 입력해주세요" value="${UserVO.userId}"/> 
                  <span class="input-group-btn">
                     <input type="button" class="btn btn-primary" id="idcheck" value="중복체크" onclick="idCheck();"/>
                  </span>
               </div>
               <div id="idchk-error"></div>
            </div>
            
 
            <div class="form-group">
               <label class="control-label">비밀번호 </label>
               <input type="password" class="form-control" id="pw" name="userPw"  placeholder="영문,숫자 조합해 6~15자이내 입력해주세요">
               <div id="pw-error"></div>
            </div>
            
            <div class="form-group">
               <label class="control-label">비밀번호 확인 </label>
               <input type="password" class="form-control" id="pw2" name="pw2" placeholder="비밀번호 확인">
               <div id="pw2-error"></div>
            </div>
            
            <div class="form-group">
               <label class="control-label">이름</label>
                <input name="userName" type="text" class="form-control" id="userName" placeholder="이름을 입력해 주세요" 
                value="${UserVO.userName}">
                <div id="name-error"></div>
            </div>
            
            
            <div class="form-group">
               <label class="control-label">휴대폰 번호 </label>
               <input type="text" class="form-control" id="userHp" name="userHp"  placeholder="-를 제외하고 숫자만 입력하세요">
               <div id="hp-error"></div>
            </div>
            
            
            <div class="form-group">
               <label class="control-label">이메일  </label>
               <input type="email" class="form-control" id="userEmail" name="userEmail"  placeholder="이메일을 입력해주세요"
                 value="${UserVO.email}"> 
               <div id="email-error"></div>
            </div>
            
            
            <div class="form-group">
            <label class="control-label">우편번호 </label>
               <div class="input-group">
                  <input type="text" id="sample6_postcode" class="form-control" readonly>
                  <span class="input-group-btn">
                     <input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-primary" value="우편번호 검색">
                  </span>
               </div>
            </div>
            
            
	         <div class="form-group">
	            <label class="control-label">상세주소 </label>
	            <input type="text" id="addr1" name="addr1" class="d_form large form-control" readonly>
	            <input type="text" id="addr2" name="addr2" class="form-control" placeholder="상세주소를 입력하세요.">
	         	<input type="hidden" id="latId" name="lat"/>
	         	<input type="hidden" id="lonId" name="lon"/>
	         </div>

	      <div class="form-group">
	         <label class="control-label">관심분야 </label> 
	         <div class="input-group">
	            <label class="checkbox-inline"> 
	            <input type="checkbox" name="checkbox" id="cateId1" value="n" class="checkbox-style"  /><label for="cateId1">유아/취미/완구</label>
	            </label> 
	            <label class="checkbox-inline"> 
	            <input type="checkbox" name="checkbox" id="cateId2" value="n" class="checkbox-style"  /><label for="cateId2">뷰티/패션/잡화</label>
	            </label> 
	            <label class="checkbox-inline"> 
	            <input type="checkbox" name="checkbox" id="cateId3" value="n" class="checkbox-style"  /><label for="cateId3">음식/음료</label>
	            </label> 
	            <br/><br/>
	            <label class="checkbox-inline"> 
	            <input type="checkbox" name="checkbox" id="cateId4" value="n" class="checkbox-style"  /><label for="cateId4">홈인테리어/생활용품</label>
	            </label> 
	            <label class="checkbox-inline"> 
	            <input type="checkbox" name="checkbox" id="cateId5" value="n" class="checkbox-style"  /><label for="cateId5">도서/음반</label>
	            </label> 
	            <label class="checkbox-inline"> 
	            <input type="checkbox" name="checkbox"  id="cateId6" value="n" class="checkbox-style"  /><label for="cateId6">지역 할인 쿠폰</label>
	            </label>
	            
	             <input type="hidden" name="uniqId" value="${UserVO.uniqId}" id="uniqId">
	         </div>
	      </div>

         	<br/><br/>
            <div class="form-group text-center">
               <button id="cancelBtn" type="button" class="btn btn-default">가입취소</button> &nbsp;&nbsp;
                <button id="joinbtn" type="button" class="btn btn-primary">회원가입</button>
                
                <input name="idCheckboolean" id="idCheckboolean" type="hidden" value="n"> <%--아이디를 제대로 체크했고 중복됬는지 체크 --%>
            </div>
         </form>
      </div>
   </div>
</body>
</html>