<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<div id="form-contact">
				<h3><span class="glyphicon glyphicon-volume-up" style="color: #CC723D;">&nbsp;공지사항 상세보기</span></h3>
				<br><br>
				<table class="table table-bordered">
					<tr>
						<th style="width: 20%;text-align: center;background-color: #EAEAEA" >카테고리</th>
						<td >${cateDTO.cateName}<input type="hidden" name="bCategory" value="${boardDTO.cateId}" /></td>
						<th style="width: 20%;text-align: center;background-color: #EAEAEA">조회수</th>
						<td>${boardDTO.viewCnt }</td>
					</tr>
					<tr>
						<th style="width: 20%;text-align: center;background-color: #EAEAEA">작성일</th>
						<td>${boardDTO.bRegDate } </td>
						<th style="width: 20%;text-align: center;background-color: #EAEAEA">수정일</th>
						<td>${boardDTO.bModifyDate } </td>
					</tr>
					<tr>
						<th style="width: 20%;text-align: center;background-color: #EAEAEA">작성자</th>
						<td colspan="3">${boardDTO.userId}</td>
					</tr>
					<tr>
						<th style="width: 20%;text-align: center;background-color: #EAEAEA">제목</th>
						<td colspan="3">${boardDTO.bTitle}</td>
					</tr>
					<tr>
						<th style="width: 20%;height:200px; text-align: center;background-color: #EAEAEA">내용</th>
						<td colspan="3"><pre style="height:500px; border:0px">${boardDTO.bContent}</pre></td>
					</tr>
				</table>
				
				<div align = "right">
					<button type="button" class="btn btn-danger btn-sm" onclick="deleteContent()">글삭제</button>
					<button type="button" class="btn btn-warning btn-sm" onclick="location.href='/notice/updateContentForm?bNo=${boardDTO.bNo}&pageNo=${param.pageNo }'">글수정</button>
					<button type="button" class="btn btn-default btn-sm"  onclick="location.href='/notice/boardList?cateId=${cateDTO.cateId}&pageNo=${param.pageNo }'">목록</button>
					
				</div>		
				<br/><br/>
				
			</div>
		</div>
		<script type="text/javascript">
		
			//게시글 삭제 버튼 클릭시
			function deleteContent(){
				if(confirm("정말 삭제하시겠습니까?")){
					location.href="/notice/deleteContentProc?bno=${boardDTO.bNo}&cateId=${cateDTO.cateId}&pageNo=${param.pageNo}";
				}else{
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
		</div>
	</div>
</body>
</html>