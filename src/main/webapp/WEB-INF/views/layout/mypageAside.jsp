<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/sidebar.css" />


<div class="col-md-2">
	<!-- 네비게이션 -->
	<aside>
		<h3 class="navibar" style="margin-bottom: 20px;">
			My Page<span class="arrow-down glyphicon glyphicon-menu-down"
				aria-hidden="true" style="float: right;"></span>
		</h3>
		<ul class="navibar">
			<li><a href="javascript:favirtelist();"> 좋아요 목록</a></li>
			<li><a href="javascript:myWriteList();">내가 올린 글 </a></li>
			<li><a href="javascript:myExchangeList();">거래중인 게시물 </a></li>
			<li><a data-toggle="modal" data-target="#myModal">회원정보 수정</a></li>
		</ul>
	</aside>
</div>
