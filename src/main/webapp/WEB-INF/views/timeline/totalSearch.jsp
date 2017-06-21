<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체 검색</title>
<script type="text/javascript" src="/resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class="panel panel-primary">
					<div class="panel-heading"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;전체 검색</div>
					<div class="panel-body" style="text-align: center;">
						<p id="keywordPId" style="display: inline;">"${map.keywords}"</p>
						(으)로 검색한 결과입니다.
					</div>

					<!-- Table -->
					<table class="table table-hover">
						<tr> 
							<th style="text-align: center;">No</th>
							<th style="text-align: center;">제목</th>
							<th style="text-align: center;">글쓴이</th>
							<th style="text-align: center;">등록일</th>
							<th style="text-align: center;">조회수</th>
						</tr>
						<c:forEach var="temp" items="${map.list}" varStatus="status">
							<tr>
								<td>${status.count}</td>
								<td><a href="/board/category/detailContent?bno=${temp.bno}">${temp.btitle}</a></td>
								<td>${temp.userId}</td>
								<td>${temp.bregdate}</td>
								<td>${temp.viewcnt}</td>
							</tr>
						</c:forEach>
					</table>

				</div>
			
			<!-- 페이징 -->
			<!-- << -->
			<nav style="text-align:center;">
			<ul class="pagination">
				<li><a class="aT" href="${map.pageMaker.startPage-1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<c:forEach var="pageNum" begin="${map.pageMaker.startPage}" end="${map.pageMaker.endPage}">
					<li class="active"><a class="aT" href="${pageNum}">${pageNum}</a></li>
				</c:forEach>
				<li><a class="aT" href="${map.pageMaker.endPage+1}" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
			</nav>
			<!-- >> -->
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			$(document).on("click",".aT",function(event){
				event.preventDefault();
				var keywords = $("#keywordPId").text();
				var obj = $(this);
				// href에 입력되어 있는 page값을 가져옴
				var page = obj.attr("href");
				self.location = "/timeline/totalSearch?keywords="+escape(encodeURIComponent(keywords))+"&page="+page;
			});
		});
	</script>
</body>
</html>