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
			<div class="col-md-10 col-md-offset-1">
				<h3>
					<span class="glyphicon glyphicon-volume-up" style="color: #0E3E59;">&nbsp;공지사항 수정하기</span>
				</h3>
				<br><br>
				<form id="updateForm" action="/notice/updateContentProc" method="post">
					<table class="table table-bordered">
						<tr>
							<th style="width: 20%; text-align: center; background-color: #EAEAEA">카테고리</th>
							<td>${cateDTO.cateName}<input type="hidden" name="cateId" value="${boardDTO.cateId}" /></td>
						</tr>
						<tr>
							<th style="width: 20%; text-align: center; background-color: #EAEAEA">작성자</th>
							<td>관리자<input type="hidden" name="userId" value="${boardDTO.userId}" /></td>
						</tr>
						<tr>
							<th style="width: 20%; text-align: center; background-color: #EAEAEA">제목</th>
							<td><input id="bTitle" class="form-control" type="text" name="bTitle" value="${boardDTO.bTitle}" required="required" /></td>
						</tr>
						<tr>
							<th style="width: 20%; text-align: center; background-color: #EAEAEA;">내용</th>
							<td><textarea id="bContent" name="bContent" rows="300" class="form-control" required="required">${boardDTO.bContent}</textarea></td>
						</tr>
						<!-- <tr>
							<th style="width: 20%;text-align: center;background-color: #EAEAEA" >첨부파일</th>
							<td><input style="width: 100%" type="file" /></td>
						</tr> -->
					</table>
					<div align="right">
						<input type="hidden" name="bNo" value="${boardDTO.bNo}" /> 
						<input type="hidden" name="pageNo" value="${param.pageNo}" />
						<button type="button" class="btn btn-default" onclick="javascript:history.back();">취소</button>
						<input type="submit" class="btn btn-warning" value="수정하기" />
					</div>
				</form>


			</div>
		</div>
		<script type="text/javascript">
					$("#updateForm").submit(function(event) {
						event.preventDefault ? event.preventDefault(): (event.returnValue = false);
						console.log("updateForm");
						var that = $(this); //updateForm
						var title = $("#bTitle").val(); // 제목	(빈 값 검사하기 위해)
						var content = $("#bContent").val(); // 내용

						if (title.trim() == ""|| content.trim() == "") { // trim() 앞,뒤 공백 제거
							alert("제목과 내용은 필수 입력사항입니다.");
							return;
						}

						/* var str = "";
						//fileDrop 클래스의 samll 태그 각각의 값을 가져와서 str에 input hidden 속성으로 붙임 value = file fullName
						$(".fileDrop small").each(function(index) {
						str += "<input type='hidden' name='files' value='"+ $(this).attr("data-src")+ "'>";
						});
						that.append(str); */

						that.action = "/notice/updateContentProc";
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