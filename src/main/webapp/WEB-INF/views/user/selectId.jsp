<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="/resources/js/user/Idselect.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
					<h3 align="center">
						<span class="glyphicon glyphicon-paperclip" style="color: #0E3E59;">&nbsp;아이디 찾기</span>
					</h3>
					<br><br>

					<div style="float: center; background-color: #E9EFF5; padding: 5% 7% 3% 7%;; border-radius: 13px;">
						<form role="form" id="form1">
							<div class="form-group">
								<label class="control-label">이름</label> 
								<input name="userName" type="text" class="form-control" id="userName" placeholder="이름을 입력해 주세요" >
								<div id="name-error"></div>
							</div>

							<div class="form-group">
								<label class="control-label">휴대폰 번호 </label> 
								<input type="text" class="form-control" id="userHp" name="userHp" placeholder="-를 제외하고 숫자만 입력하세요">
								<div id="hp-error"></div>
							</div>
							<br />
							<div class="form-group text-center">
								<button id="cancelBtn" type="button" class="btn btn-default">취소</button>
								&nbsp;&nbsp;
								<button id="select" type="button" class="btn btn-primary">찾기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>