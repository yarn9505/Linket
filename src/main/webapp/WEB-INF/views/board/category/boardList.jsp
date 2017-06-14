<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${cateDTO.cateName}</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<section>
				<div class="content-frame">
					<div id="form-contact">
						<h2>
							<span class="glyphicon glyphicon-tags" style="color: #CC723D;">&nbsp;${cateDTO.cateName}</span>
						</h2>
						<form action="/board/category/boardList">
							<table align="right">
								<tr>
									<td><select name="searchType" class="form-control col-md-3">
											<option value="titleContent"
												<c:if test="${pagingDTO.searchType eq 'titleContent'}" > selected="selected" </c:if>>제목+내용</option>
											<option value="writer"
												<c:if test="${pagingDTO.searchType eq 'writer'}" > selected="selected" </c:if>>글쓴이</option>
											<option value="title"
												<c:if test="${pagingDTO.searchType eq 'title'}" > selected="selected" </c:if>>제목</option>
									</select></td>
									<td>&nbsp;&nbsp;</td>
									<td>
										<div class="input-group">
											<input type="text" name="searchText" class="form-control col-md-3" value="${pagingDTO.searchText }" /> 
											<input type="hidden" name="cateId" value="${cateDTO.cateId }" /> 
											<span class="input-group-btn">
												<button type="submit" class="btn btn-default btn-lg" style="padding-bottom: 7.5px;padding-top: 7px;">
													<span class="glyphicon glyphicon-search" aria-hidden="true" ></span>
												</button>
											</span>
										</div>
									</td>
								</tr>
							</table>
						</form>

						<br /> <br />

						<table class="table table-bordered">
							<tr style="background-color: #FFA800;">
								<th style="width: 10%; text-align: center;">No</th>
								<th style="width: 45%; text-align: center;">제목</th>
								<th style="width: 15%; text-align: center;">글쓴이</th>
								<th style="width: 20%; text-align: center;">등록일</th>
								<th style="width: 10%; text-align: center;">조회수</th>
							</tr>
							<c:if test="${empty boardList}">
								<tr>
									<td colspan="5" style="text-align: center">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach items="${boardList}" var="boardDTO" varStatus="status">
								<tr style="text-align: center">
									<td>${status.count }</td>
									<td><a
										href="/board/category/detailContent?bno=${boardDTO.bNo}&pageNo=${param.pageNo }">${boardDTO.bTitle }</a></td>
									<td>${boardDTO.userId }</td>
									<%-- <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardDTO.bRegDate }"/></td> --%>
									<td>${boardDTO.bRegDate }</td>
									<td><span class="badge" style="background-color: #BFC2C3;">${boardDTO.viewCnt}</span></td>
								</tr>
							</c:forEach>
						</table>


						<table align="right">
							<tr>
								<td>
									<!-- <a href="/category/writeForm" >글작성</a> -->
									<button type="button" class="btn btn-default"
										onclick="location.href='/board/category/writeBoardForm?cateId=${cateDTO.cateId}'">
										<img src="/resources/images/writeBtn.png" style="width: 60px;">
									</button>
								</td>
							</tr>
						</table>

						<div align="center">
							<ul class="pagination pagination-sm">
								<c:if test="${pagingDTO.groupNo > 1}">
									<li><a
										href="/board/category/boardList?cateId=${cateDTO.cateId }&groupNo=1&searchType=${param.searchType}&searchText=${param.searchText}">처음</a>
									</li>
									<li><a
										href="/board/category/boardList?cateId=${cateDTO.cateId }&pageNo=${pagingDTO.pageStartNo - 1}&searchType=${param.searchType}&searchText=${param.searchText}">◀</a>
									</li>

								</c:if>
								<c:forEach var="i" begin="${pagingDTO.pageStartNo}"
									end="${pagingDTO.pageEndNo}">
									<c:choose>
										<c:when test="${pagingDTO.pageNo != i}">
											<li><a
												href="/board/category/boardList?cateId=${cateDTO.cateId }&pageNo=${i}&searchType=${param.searchType}&searchText=${param.searchText}">${i}</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="#"
												style="background-color: #085B86; color: white; font-weight: bold;">&nbsp;${i}&nbsp;</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${pagingDTO.groupNo < pagingDTO.totalGroupCount}">
									<li><a
										href="/board/category/boardList?cateId=${cateDTO.cateId }&pageNo=${pagingDTO.pageEndNo + 1}">▶</a></li>
									<li><a
										href="/board/category/boardList?cateId=${cateDTO.cateId }&pageNo=${pagingDTO.totalPageCount}&searchType=${param.searchType}&searchText=${param.searchText}">마지막</a></li>
								</c:if>
							</ul>
						</div>

					</div>
				</div>
				</section>

				<!-- END CATEGORY CATEGORY SECTION -->
				<script>
					$(document).ready(function(){
						$("#portfolio").attr("class","active");
					})
				</script>


			</div>
		</div>
	</div>
</body>
</html>