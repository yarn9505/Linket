<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="/resources/js/user/pwmodify.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<article class="container">
				<div class="page-header">
					<h1>비밀번호 찾기</h1>
				</div>
				<div class="col-md-6 col-md-offset-3" style="position: static;">
					<form role="form" id="form1">
						<div class="form-group">

							<label class="control-label">아이디</label> <input type="text"
								class="form-control" id="userId" name="userId"
								placeholder="아이디를 입력해주세요" value="${id}" readonly="readonly" />
						</div>

						<div class="form-group">
							<label class="control-label">변경할 비밀번호 </label> <input
								type="password" class="form-control" id="pw" name="userPw"
								placeholder="영문,숫자 조합해 6~15자이내 입력해주세요">
							<div id="pw-error"></div>
						</div>


						<div class="form-group">
							<label class="control-label">변경할 비밀번호 확인 </label> <input
								type="password" class="form-control" id="pw2" name="pw2"
								placeholder="비밀번호 확인">
							<div id="pw2-error"></div>
						</div>


						<br />
						<br />
						<div class="form-group text-center">
							<button id="cancelBtn" type="button" class="btn btn-default">취소</button>
							&nbsp;&nbsp;
							<button id="select" type="button" class="btn btn-success">수정하기</button>

						</div>

					</form>

				</div>
				</article>
			</div>
		</div>
	</div>
</body>
</html>