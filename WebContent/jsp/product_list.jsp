﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>商品列表</title>
		<%-- <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon/favicon.ico">
		<link rel="Bookmark" href="${pageContext.request.contextPath}/img/icon/favicon.ico"> --%>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"/>

		<style>
			body {
				margin-top: 20px;
				margin: 0 auto;
				width: 100%;
			}
			.carousel-inner .item img {
				width: 100%;
				height: 300px;
			}
		</style>
	</head>

	<body>
		
		<%@ include file="/jsp/header.jsp"%>

		<c:if test="${empty page.list }">
			<div class="row" style="width:1210px;margin:0 auto;">
				<div class="col-md-12">
					<h1>暂无商品信息</h1>
				</div>
			</div>
		</c:if>
		<c:if test="${not empty page.list }">
			<div class="row" style="width:1210px;margin:0 auto;">
				<div class="col-md-12">
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath}/">首页</a></li>
					</ol>
				</div>
			<c:forEach items="${page.list }" var="p">
				<div class="col-md-2">
					<a href="${pageContext.request.contextPath}/findProById?pid=${p.pid}">
						<img src="${pageContext.request.contextPath}/${p.pimage}" width="170" height="170" style="display: inline-block;">
					</a>
					<p><a href="${pageContext.request.contextPath}/findProById?pid=${p.pid}=2 " style='color:green'>${p.pname}</a></p>
					<p><font color="#FF0000">商城价：&yen;${p.shopPrice}</font></p>
				</div>
			</c:forEach>
			</div>
			<%@include file="/jsp/pageFile.jsp" %>
			
		</c:if>

		<!--
       		商品浏览记录:
        -->
		<%-- <div style="width:1210px;margin:0 auto; padding: 0 9px;border: 1px solid #ddd;border-top: 2px solid #999;height: 300px;">
			<h4 style="width: 50%;float: left;font: 14px/30px " 微软雅黑 ";">浏览记录</h4>
			<div style="width: 50%;float: right;text-align: right;"><a>more</a></div>
			<div style="clear: both;"></div>
			<div style="overflow: hidden;">
				<ul style="list-style: none;">
					<li style="width: 150px;height: 216;float: left;margin: 0 8px 0 0;padding: 0 18px 15px;text-align: center;">
						<div class="row" style="width:1210px;margin:0 auto;">
							<div class="col-md-2">
								<a href="${pageContext.request.contextPath}/findProById">
									<img src="${pageContext.request.contextPath}/${p.pimage}" width="170" height="170" style="display: inline-block;">
								</a>
								<p><a href="${pageContext.request.contextPath}/findProById?pid=${p.pid}=2 " style='color:green'>辣条</a></p>
								<p><font color="#FF0000">商城价：&yen;1</font></p>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div> --%>
		
		<%@ include file="/jsp/footer.jsp"%>

	</body>

</html>