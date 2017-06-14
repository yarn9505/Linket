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
			<div class="col-md-10 col-md-offset-1">
						<h3>
							<span class="glyphicon glyphicon-envelope"
								style="color: #0E3E59;">&nbsp;받은 쪽지함</span>
						</h3>
						<br><br>
						<table class="table">
							<tr style="background-color: #D1E0EF">
								<th style="text-align: center;">No</th>
								<th style="text-align: center;">보낸사람</th>
								<th style="width: 40%; text-align: center;">제목</th>
								<th style="text-align: center;">보낸날짜</th>
								<th style="text-align: center;">삭제</th>
							</tr>
							<c:if test="${empty list}">
								<tr>
									<td colspan="5" style="text-align: center">받은 쪽지가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="NoteVO" items="${list}" varStatus="status">
								<tr>
									<td style="text-align: center;">${status.count}</td>
									<td style="text-align: center;">${NoteVO.userId}</td>
									<td style="text-align: center;"><a
										href="/note/readDetail?mno=${NoteVO.mno}" id="mtitleCheck">${NoteVO.mtitle}</a></td>
									<td style="text-align: center;"><fmt:formatDate
											value="${NoteVO.date_sender}" pattern="YY년MM월dd일 " /></td>
									<td style="text-align: center;">
										<button id="delBtn" type="button" class="btn btn-link">삭제</button>
									</td>
									<input id="mnoId" type="hidden" value="${NoteVO.mno}" />
								</tr>
							</c:forEach>
						</table>

						<!-- 
                       	[이전][1][2][3]...[10][다음] 부분 작성
                        -->
						<!-- [이전] -->
						<div class="text-center">
							<ul class="pagination pagination-sm">
								<li><a href="/note/listReceive${pageMaker.pageQuery(1)}">처음</a>
								</li>
								<c:if test="${pageMaker.prev}">
									<li><a 
										href="/note/listReceive${pageMaker.pageQuery(pageMaker.startPage-1)}">◀</a>
									</li>
								</c:if>
								<!-- [1][2][3]...[10] -->
								<c:forEach var="index" begin="${pageMaker.startPage}"
									end="${pageMaker.endPage}">
									<li ${pageMaker.page == index ? 'class=active' : '' }><a
										href="/note/listReceive${pageMaker.pageQuery(index)}">${index}</a>
									</li>
								</c:forEach>
								<!-- [다음] -->
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="/note/listReceive${pageMaker.pageQuery(pageMaker.endPage+1)}">▶</a>
									</li>
								</c:if>
								<!-- [마지막] -->
								<li><a
									href="/note/listReceive${pageMaker.pageQuery(pageMaker.entireEndPage)}">마지막</a>
								</li>
							</ul>
						</div>
						<!-- 쪽지 페이징 처리 -->

					</div>

				</div>
				<div class="arrow"></div>
			</div>
			<script>
				$(document).ready(function() {
					$("#sel td").on("click", "#delBtn", function() {
						//var mno = $(this).parent().value();
						var mno = $(this).parent().next().val();
						self.location = "/note/delFromReceiver?mno=" + mno;
					}); // end of delBtn click

				})
			</script>

</body>
</html>