<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<div id="content-frame-mask1" style="right: 17px;"></div>
					<div class="what-row clearfix image-on-left">
						<div class="what-row clearfix image-on-right">
							<div>
								<h4>안 읽은 쪽지함</h4>
								<table width="100%" border="1" cellspacing="0" cellpadding="0">
									<tr>
										<th>No</th>
										<th>보낸사람</th>
										<th>제목</th>
										<th colspan="2">보낸날짜</th>
									</tr>
									<c:forEach var="NoteVO" items="${list}" varStatus="status">
										<tr id="sel"
											${NoteVO.recv_read eq 'Y' ? "style='color:gray'":"style='color:blue'"}>
											<td><a href="/note/readDetail?mno=${NoteVO.mno}">${status.count}</a></td>
											<td><a href="/note/readDetail?mno=${NoteVO.mno}">${NoteVO.userId}</a></td>
											<td><a href="/note/readDetail?mno=${NoteVO.mno}">${NoteVO.mtitle}</a></td>
											<td colspan="2"><a
												href="/note/readDetail?mno=${NoteVO.mno}"><fmt:formatDate
														value="${NoteVO.date_sender}"
														pattern="(E) YY년MM월dd일 HH:mm:ss" /></a></td>
											<input id="mnoId" type="hidden" value="${NoteVO.mno}" />
										</tr>
									</c:forEach>
								</table>

								<!-- 
                       	[이전][1][2][3]...[10][다음] 부분 작성
                        -->
								<!-- [이전] -->
								<div class="text-center">
									<ul class="pagination">
										<li><a href="/note/listNotOpen${pageMaker.pageQuery(1)}">[처음]</a>
										</li>
										<c:if test="${pageMaker.prev}">
											<li><a
												href="/note/listNotOpen${pageMaker.pageQuery(pageMaker.startPage-1)}">[이전]</a>
											</li>
										</c:if>
										<!-- [1][2][3]...[10] -->
										<c:forEach var="index" begin="${pageMaker.startPage}"
											end="${pageMaker.endPage}">
											<li ${pageMaker.page == index ? 'class=active' : '' }><a
												href="/note/listNotOpen${pageMaker.pageQuery(index)}">[${index}]</a>
											</li>
										</c:forEach>
										<!-- [다음] -->
										<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
											<li><a
												href="/note/listNotOpen${pageMaker.pageQuery(pageMaker.endPage+1)}">[다음]</a>
											</li>
										</c:if>
										<!-- [마지막] -->
										<li><a
											href="/note/listNotOpen${pageMaker.pageQuery(pageMaker.entireEndPage)}">[마지막]</a>
										</li>
									</ul>
								</div>
								<!-- 쪽지 페이징 처리 -->

							</div>
						</div>
					</div>
					<div class="arrow"></div>
				</div>
			</div>
		</div>
</body>
</html>