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
				<h4>
					<span class="glyphicon glyphicon-envelope" style="color: #0E3E59;">&nbsp;쪽지 상세보기</span>
				</h4>
				<br> <br>
				<table class="table table-bordered">
					<tr>
						<th style="text-align: center; width: 20%;background: #E9EFF5;">보낸사람</th>
						<td>${NoteVO.userId}</td>
					</tr>
					<tr>
						<th style="text-align: center;background: #E9EFF5;">받은시간</th>
						<td><fmt:formatDate pattern="yyyy년MM월dd일 (a) hh:mm:ss" value="${NoteVO.date_sender}" /></td>
					</tr>
					<tr>
						<th style="text-align: center;background: #E9EFF5;">읽은시간</th>
						<td><fmt:formatDate pattern="YYYY년MM월dd일  HH:mm:ss" value="${NoteVO.date_receiver}" /></td>
					</tr>
					<tr>
						<th style="text-align: center;background: #E9EFF5;">제목</th>
						<td>${NoteVO.mtitle}</td>
					</tr>
					<tr>
						<th
							style="text-align: center; height: 200px; vertical-align: middle;background: #E9EFF5;">내용</th>
						<td>${NoteVO.mcontent}</td>
					</tr>
				</table>
				<div align="right">
					<button type ="button" id="cancelBtn" class="btn btn-default">목록보기</button>
					<button type ="button" id="delBtn" class="btn btn-default">삭제</button>
					<button type ="button" class="btn btn-primary" data-target="#layerpop" data-toggle="modal">답장</button>
					<br />
				</div>
			</div>
		</div>
		<div class="arrow"></div>
	</div>
	<!-- END TEAM SECTION -->


	<!-- 답글 작성시 이용하기위해 만듬 -->
	<input type="hidden" id="sender" value="${NoteVO.userId }" />
	<input type="hidden" id="receiver" value="${NoteVO.recvId}" />

	<form id="form1">
		<input type="hidden" name="mno" value="${NoteVO.mno }" />
	</form>


	<!-- 답글달기 모달창 -->
	<div class="modal fade" id="layerpop">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
					<!-- header title -->
					<center>
						<h3 class="modal-title">
							<span class="glyphicon glyphicon-envelope" style="color: #0E3E59;">&nbsp;답장 보내기</span>
						</h3>
					</center>
				</div>
				<!-- body -->
				<div class="modal-body">
					<form id="form2">
						<table class="table-bordered" style="width: 100%;">
							<h5 align="right" style="color: navy;">from: ${NoteVO.recvId}</h5>
							<input type="hidden" class="form-control" name="userId" value="${NoteVO.recvId }"/>
							<tr>
								<th style="text-align: center; width: 15%;">받는 사람</th>
								<td><input type="text" class="form-control" name="recvId" value="${NoteVO.userId}" readonly="readonly" /></td>
							</tr>
							<tr>
								<th style="text-align: center;">제목</th>
								<td><input type="text" class="form-control" name="mtitle" autofocus="autofocus" /></td>
							</tr>
							<tr>
								<th style="text-align: center;">내용</th>
								<td><textarea rows="10" cols="50" name="mcontent" class="form-control"></textarea></td>
							</tr>
						</table>
						<br>
						<div align="right">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							<button id="sendTo" class="btn btn-warning">보내기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<script>
				$(document).ready(function() {

					var formN = $("#form1");
					// 삭제 버튼 클릭시...

					// 취소버튼 클릭시
					$("#cancelBtn").on("click", function() {
						history.go(-1);
					}); // end of cancelBtn

					$("#delBtn").on("click", function() {
						var result = confirm("삭제하시겠습니까?");
						if (result == true) {
							formN.attr("action", "/note/delFromReceiver");
							formN.attr("method", "post");
							formN.submit();
						}

					});// end of delBtn

					// 쪽지 답장하기 버튼 클릭시...
					$("#replyBtn").on("click", function() {
						var sender = $("#sender").val();
						var receiver = $("#receiver").val();
						self.location = "/note/replyNoteForm?userId=" + userId
						"+recvId=" + recvId;
					}); // 쪽지 답장하기 클릭

					$("#sendTo").on("click", function() {
						var formName = $("#form2");
						formName.attr("action", "/note/replyNote");
						formName.attr("method", "POST");
						formName.submit();
					}); // end of sendTo click
				});
			</script>


</body>
</html>