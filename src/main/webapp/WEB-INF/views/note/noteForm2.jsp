<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="content-frame">
					<div class="what-row clearfix image-on-left">
						<div class="what-row clearfix image-on-right">
							<div>
								<!-- 쪽지쓰기 모달창 띄우기 -->
								<div class="panel">
									<a href="#login_form" id="login_pop">쪽지 쓰기</a>
								</div>

								<!-- popup form #1 -->
								<a href="#x" class="overlay" id="login_form"></a>
								<div class="popup">
									<center>
										<h3 alicn="center">쪽지 쓰기</h3>
									</center>
									<br>
									<form id="formName" action="/note/insertNote" method="post">
										<table class="table-bordered">
											<!-- 세션에서 id를 넣어 놓음(어차피 로그인한 사용자만 가능해야함): 로그인 기능 구현 전까지 임의로 입력해 놓겠음. -->
											<h5 align="right" style="color: navy;">[ from:
												${loginSession.userId} ]</h5>
											<tr>
												<th
													style="text-align: center; width: 15%; background-color: #F6F6F6">받는
													사람</th>
												<td><input type="text" class="form-control"
													name="recvId" id="recvId" value="${sendTo}" /></td>
											</tr>

											<tr>
												<th style="text-align: center; background-color: #F6F6F6">제목</th>
												<td><input type="text" class="form-control"
													name="mtitle" id="mtitle" value="${NoteVO.mtitle}" /></td>
											</tr>

											<tr>
												<th style="text-align: center; background-color: #F6F6F6">내용</th>
												<td><textarea rows="10" cols="80" name="mcontent"
														id="mcontent" class="form-control">${NoteVO.mcontent}</textarea></td>
											</tr>
										</table>

										<br>
										<div align="right">
											<button id="cancelBtn" type="button" class="btn btn-default">취소</button>
											<button id="sendBtn" type="button" class="btn btn-warning">보내기</button>
										</div>
									</form>
									<a class="close" href="#close"></a>
								</div>

							</div>
						</div>
					</div>
					<div class="arrow"></div>
				</div>
				<!-- END TEAM SECTION -->
				<script>
					$(document).ready(function() {

						var formN = $("#formName");
						var Esize = $("#errors.errorSize");
						$("#sendBtn").on("click", function(event) {
							if ($('#recvId').val() == "") {
								alert("받는 사람 아이디를 입력해주세요.");
								return false;
							}

							if ($('#mtitle').val() == "") {
								alert("제목을 입력해주세요.");
								return false;
							}

							if ($('#mcontent').val() == "") {
								alert("내용을 입력해주세요.");
								return false;
							}

							formN.submit();
						}); // end of sendBtn
						$("#cancelBtn").on("click", function(evnet) {
							history.back(); // 뒤로가기
						}); // end of cancelBtn

					})
				</script>
			</div>
		</div>
	</div>

</body>
</html>