<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/sidebar.css">
</head>
<style>
input[type=checkbox] {
	display: none;
}

input[type=checkbox]+label {
	display: inline-block;
	cursor: pointer;
	position: relative;
	padding-left: 25px;
	margin-right: 15px;
	font-size: 13px;
}

input[type=checkbox]+label:before {
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
	box-shadow: inset 0px 1px 1px 0px rgba(0, 0, 0, .3), 0px 1px 0px 0px
		rgba(255, 255, 255, .8);
}

input[type=checkbox]:checked+label:before {
	content: "\2713"; /* 체크모양 */
	text-shadow: 1px 1px 1px rgba(0, 0, 0, .2);
	font-size: 18px;
	font-weight: 800;
	color: #fff;
	background: #2f87c1;
	text-align: center;
	line-height: 18px;
}
</style>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="page-header">
					<h3>
						<span class="glyphicon glyphicon-user" style="color: #0E3E59;"> &nbsp;회원정보수정</span>
					</h3>
				</div>
	
				<form role="form" id="form1">
					<div class="form-group">
						<label class="control-label">아이디</label>
						<input readonly="readonly" type="text" class="form-control"
								id="userId" name="userId" placeholder="아이디를 입력해주세요" value="${loginSession.userId}" /> 
						<div id="idchk-error"></div>
					</div>



					<div class="form-group">
						<label class="control-label">변경할 비밀번호 </label> 
						<input type="password" class="form-control" id="pw" name="userPw" placeholder="영문,숫자 조합해 6~15자이내 입력해주세요">
						<div id="pw-error"></div>
					</div>


					<div class="form-group">
						<label class="control-label">변경할 비밀번호 확인 </label> 
						<input type="password" class="form-control" id="pw2" name="pw2" placeholder="비밀번호 확인">
						<div id="pw2-error"></div>
					</div>


					<div class="form-group">
						<label class="control-label">이름</label> 
						<input value="${loginSession.userName }" readonly="readonly" name="userName" type="text" class="form-control" id="userName"placeholder="이름을 입력해 주세요" />
						<div id="name-error"></div>
					</div>


					<div class="form-group">
						<label class="control-label">휴대폰 번호 </label> 
						<input value="${loginSession.userHp}" type="text" class="form-control"
							id="userHp" name="userHp" placeholder="-를 제외하고 숫자만 입력하세요">
						<div id="hp-error"></div>
					</div>


					<div class="form-group">
						<label class="control-label">이메일 </label> 
						<input type="email" class="form-control" id="userEmail" name="userEmail"
							placeholder="이메일을 입력해주세요" value="${loginSession.userEmail}">
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
						<input value="${loginSession.addr1}" type="text" id="addr1" name="addr1" class="d_form large form-control" readonly> 
						<input value="${loginSession.addr2}" type="text" id="addr2" name="addr2" class="form-control" placeholder="상세주소를 입력하세요."> 
						<input value="${loginSession.lat}" type="hidden" id="latId" name="lat" />
						<input value="${loginSession.lon}" type="hidden" id="lonId" name="lon" />
					</div>

					<div class="form-group">
						<label class="control-label">관심분야 </label> <br/>
						<div class="input-group">
							<label class="checkbox-inline"> 
							<input type="checkbox" name="checkbox" id="cateId1" ${loginSession.cateId1 eq 'Y' ? 'checked' : '' }
								value="${loginSession.cateId1 eq 'Y' ? 'Y' :'N' }">
								<label for="cateId1">유아/취미/완구</label>
							</label> <label class="checkbox-inline"> 
							<input type="checkbox" name="checkbox" id="cateId2" ${loginSession.cateId2 eq 'Y' ? 'checked' : '' }
								value="${loginSession.cateId2 eq 'Y' ? 'Y' :'N' }">
								<label for="cateId2">뷰티/패션/잡화</label>
							</label> 
							
							<label class="checkbox-inline"> 
							<input type="checkbox" name="checkbox" id="cateId3" ${loginSession.cateId3 eq 'Y' ? 'checked' : '' }
								value="${loginSession.cateId3 eq 'Y' ? 'Y' :'N' }">
								<label for="cateId3">애완동물 용품</label>

							</label> <br /> <br /> 
							
							<label class="checkbox-inline"> 
							<input type="checkbox" name="checkbox" id="cateId4" ${loginSession.cateId4 eq 'Y' ? 'checked' : '' }
								value="${loginSession.cateId4 eq 'Y' ? 'Y' :'N' }">
								<label for="cateId4">홈인테리어/생활용품</label>
							</label> 
							
							<label class="checkbox-inline"> <input type="checkbox" name="checkbox" id="cateId5"
								${loginSession.cateId5 eq 'Y' ? 'checked' : '' }
								value="${loginSession.cateId5 eq 'Y' ? 'Y' :'N' }">
								<label for="cateId5">도서/음반</label>
							</label> 
							
							<label class="checkbox-inline"> 
							<input type="checkbox" name="checkbox" id="cateId6" ${loginSession.cateId6 eq 'Y' ? 'checked' : '' }
								value="${loginSession.cateId6 eq 'Y' ? 'Y' :'N' }">
								<label for="cateId6">지역 할인 쿠폰</label>

							</label> 
							<input type="hidden" name="uniqId" value="${loginSession.uniqId}" id="uniqId">
						</div>
					</div>

					<br /> <br />
					<div class="form-group text-center">
						<button id="cancelBtn1" type="button" class="btn btn-default" onclick="location.href='/mypage/myList'">취소</button>
						&nbsp;&nbsp;
						<button id="joinbtn" type="button" class="btn btn-primary">수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/resources/js/modifyInfoJS.js" />
</body>
</html>