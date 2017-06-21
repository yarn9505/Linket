<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<h3>
					<span class="glyphicon glyphicon-volume-up" style="color: #0E3E59;">&nbsp;공지사항 작성하기</span>
				</h3>
				<br> <br>
				<form id="insertForm" action="/notice/writeBoardProc" method="post">
					<table class="table">
						<tr>
							<th style="width: 10%; vertical-align: middle ; text-align: center;">카테고리</th>
							<td><input type="text" class="form-control" value = "${cateDTO.cateName}" readonly>
								<input type="hidden" name="cateId" value="${cateDTO.cateId}" />
							</td>
						</tr>
						<tr>
							<th style="width: 10%; vertical-align: middle ; text-align: center;">작성자</th>
							<td>
								<input type="text" class="form-control" value = "관리자" readonly>
								<input type="hidden" name="userId" value="${loginSession.userId }" />
							</td>
						</tr>
						<tr>
							<th style="width: 10%; vertical-align: middle ; text-align: center;">제목</th>
							<td><input id="bTitle" class="form-control" type="text" name="bTitle" value="${boardDTO.bTitle}" /></td>
						</tr>
						<tr>
							<th style="width: 10%; vertical-align: middle ; text-align: center;">내용</th>
							<td><textarea id="bContent" name="bContent" style="height: 400px;" class="form-control"></textarea></td>
						</tr>
					</table>
					<div align="right">
						<button type="button" class="btn btn-default" onclick="javascript:history.back();">취소</button>
						<button type="submit" class="btn btn-default">
							<img src="/resources/images/writeBtn.png" style="width: 60px;">
						</button>
					</div>
					<br/><br/>
				</form>
			</div>
		</div>
	
		<script type="text/javascript">
			$("#insertForm").submit(function(event) {
				event.preventDefault ? event.preventDefault(): (event.returnValue = false);
				var that = $(this); //insertForm
				var title = $("#bTitle").val(); // 제목	(빈 값 검사하기 위해)
				var content = $("#bContent").val(); // 내용

				if (title.trim() == ""|| content.trim() == "") { // trim() 앞,뒤 공백 제거
					alert("제목과 내용은 필수 입력사항입니다.");
					return;
				}

				that.action = "/notice/writeBoardProc";
				that.method = "post";
				alert("게시글 작성이 완료되었습니다.");
				that.get(0).submit(); // get(0) : 순수 DOM 객체를 얻어냄

			});
		</script>
		<!-- 각 페이지별 메뉴 색깔 제어 -->
		<script>
			$(document).ready(function() {
				$("#talktous").attr("class", "active");
			})
		</script>
	</div>

</body>
</html>