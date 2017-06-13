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
					<div id="content-frame-mask1" style="right: 17px;"></div>
					<div class="what-row clearfix image-on-left">
						<div class="what-row clearfix image-on-right">
							<div>
								<div>
									<h4>쪽지 보내기</h4>
								</div>
								<table width="800px" border="1" cellspacing="0" cellpadding="0">
									<form id="formName" action="/note/insertNote" method="post">
										<!-- 세션에서 id를 넣어 놓음(어차피 로그인한 사용자만 가능해야함): 로그인 기능 구현 전까지 임의로 입력해 놓겠음. -->
										<input type="hidden" name="userId" value="sooingkr" />
										<tr>
											<th>받는 사람</th>
											<td><input style="width: 600px" type="text"
												name="recvId" value="${sendTo}" placeholder="받는 사람 id" /></td>
										</tr>
										<c:if test="${errors.ErecvId != null}">
											<tr>
												<th colspan="3"><b style="color: red;">${errors.ErecvId}</b></th>
											</tr>
										</c:if>
										<tr>
											<th>제목</th>
											<td><input style="width: 600px" type="text"
												name="mtitle" placeholder="제목" value="${NoteVO.mtitle}" /></td>
										</tr>
										<c:if test="${errors.Etitle != null}">
											<tr>
												<th colspan="3"><b style="color: red;">${errors.Etitle}</b></th>
											</tr>
										</c:if>
										<tr>
											<th>내용</th>
											<td><textarea rows="10" cols="100" name="mcontent">${NoteVO.mcontent}</textarea></td>
										</tr>
										<c:if test="${errors.Econtent != null}">
											<tr>
												<th colspan="3"><b style="color: red;">${errors.Econtent}</b></th>
											</tr>
										</c:if>
										<tr>
											<th colspan="2">
												<button id="sendBtn" type="button">보내기</button>
												<button id="cancelBtn" type="button">취소</button>
											</th>
										</tr>
									</form>
								</table>
							</div>
						</div>
					</div>
					<div class="arrow"></div>
				</div>
				<!-- END TEAM SECTION -->
				<script>
					$(document).ready(function() {

						var formN = $("#formName");

						$("#sendBtn").on("click", function(event) {
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