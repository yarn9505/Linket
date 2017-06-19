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
					<span class="glyphicon glyphicon-volume-up" style="color: #0E3E59;">&nbsp;공지사항 상세보기</span>
				</h3>
				<br> <br>
				<table class="table table-bordered" style="border-radius: 25px;">
					<tr>
						<th style="width: 15%; text-align: center; background-color: #E9EFF5">작성자</th>
						<td>${boardDTO.userId}<input type="hidden" name="bCategory" value="${boardDTO.cateId}" /></td>
						<th style="text-align: center; background-color: #E9EFF5">조회수</th>
						<td>${boardDTO.viewCnt }</td>
					</tr>
					<tr>
						<th style="width: 15%; text-align: center; background-color: #E9EFF5">작성일</th>
						<td>${boardDTO.bRegDate }</td>
						<th style="text-align: center; background-color: #E9EFF5">수정일</th>
						<td>${boardDTO.bModifyDate }</td>
					</tr>

					<tr>
						<th style="width: 15%; text-align: center; background-color: #E9EFF5">제목</th>
						<td colspan="4">${boardDTO.bTitle}</td>
					</tr>
				</table>
				
				<br/><br/>
				<span style="height: 500px; border: 1px solid #BDBDBD;" class="form-control">${boardDTO.bContent}</span>
				<br/><br/>
				<div align="right">
					<c:if test="${loginSession.rank == 1 }">
						<button type="button" class="btn btn-default" onclick="deleteContent()">글삭제</button>
						<button type="button" class="btn btn-default" onclick="location.href='/notice/updateContentForm?bNo=${boardDTO.bNo}&pageNo=${param.pageNo }'">수정</button>
					</c:if>
					<button type="button" class="btn btn-default" onclick="location.href='/notice/boardList?cateId=${cateDTO.cateId}&pageNo=${param.pageNo }'">목록</button>
				</div>
				<br /> <br />
			</div>
		</div>
		
		<script type="text/javascript">
		
			//게시글 삭제 버튼 클릭시
			function deleteContent() {
				if (confirm("정말 삭제하시겠습니까?")) {
					location.href = "/notice/deleteContentProc?bno=${boardDTO.bNo}&cateId=${cateDTO.cateId}&pageNo=${param.pageNo}";
				} else {
					return;
				}
			}
		</script>
		<!-- 각 페이지별 메뉴 색깔 제어 -->
		<script>
			$(document).ready(function(){
				$("#talktous").attr("class","active");
			})
		</script>
	</div>
</body>
</html>