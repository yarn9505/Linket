<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Total Search Page</title>
<script type="text/javascript" src="/resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div>
		<div class="panel panel-default">
		  <div class="panel-heading">전체 검색</div>
		  <div class="panel-body">
		    <p id="keywordPId" style="display:inline;">${map.keywords}</p>로 검색한 결과입니다.
		  </div>
		
		  <!-- Table -->
		  <table class="table">
		  		<tr>
					<td><label>No</label></td>
					<td><label>제목</label></td>
					<td><label>글쓴이</label></td>
					<td><label>등록일</label></td>
					<td><label>조회수</label></td>
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
	</div>
	 <!-- 페이징 -->
			    <!-- << -->
			    <nav style="text-align:center;">
				  <ul class="pagination">
				    <li>
				      <a class="aT" href="${map.pageMaker.startPage-1}" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <c:forEach var="pageNum" begin="${map.pageMaker.startPage}" end="${map.pageMaker.endPage}">
					    <li><a class="aT" href="${pageNum}">${pageNum}</a></li>
				    </c:forEach>
				    <li>
				      <a class="aT" href="${map.pageMaker.endPage+1}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
			    <!-- >> -->
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