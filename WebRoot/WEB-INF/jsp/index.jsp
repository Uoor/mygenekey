<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>基因钥匙| 首页</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<!-- <link href="https://fonts.googleapis.com/css?family=Droid+Sans" rel="stylesheet"> -->

	<!-- Animate.css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
	<!-- Themify Icons-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/themify-icons.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
	<!-- Flexslider -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
	<!-- Modernizr JS -->
	<script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="${pageContext.request.contextPath}/js/respond.min.js"></script>
	<![endif]-->

</head>
<body >
<div class="gtco-loader"></div>
<div >
	<%@include file="title.jsp"%>

	<div class="login-page">
		<div class="container">
			<div class="login-body" >
				<div>
					<s:iterator var="c" value="#session.cList">
						<li><a href="${ pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1"><s:property value="#c.cname"/></a> |</li>
					</s:iterator>
					<span>首页内容展示  ，这边要大修改 </span>
				</div>
			</div>
		</div>
	</div>
	<div class="fh5co-footer"  >
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<h3 class="section-title">关于我们</h3>
					<ul class="contact-info">
						<li><a href="#">公司概况</a></li>
						<li><a href="#">技术优势</a></li>
						<li><a href="#">顾问团队</a></li>

					</ul>
				</div>

				<div class="col-md-3 ">
					<h3 class="section-title">基因科普</h3>
					<ul class="contact-info" >
						<li><a href="#">基因知识宣传</a></li>
						<li><a href="#">媒体宣传</a></li>
						<li><a href="#">科技动态</a></li>

					</ul>
				</div>
				<div class="col-md-3 ">
					<h3 class="section-title">客户服务</h3>
					<ul class="contact-info">
						<li><a href="#">联系客服</a></li>
						<li><a href="#">常见问题</a></li>
						<li><a href="#">隐私声明</a></li>
						<li><a href="#">服务协议</a></li>
						<li><a href="#">商务合作</a></li>
					</ul>
				</div>

				<div class="col-md-3 to-animate">
					<h3 class="section-title">关注我们</h3>
					<ul class="contact-info" >
						<li>微信公众号:
							<span>weixinhao123</span></li>
						<li><img class="erweima" src="images/img_2.jpg"/></li>
						<li>电话:
							<span>12345667891</span></li>
						<li>邮箱:
							<span>mygenkey@mygenkey.com</span></li>

					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="${pageContext.request.contextPath}/js/jquery.countTo.js"></script>
	<!-- Flexslider -->
	<script src="${pageContext.request.contextPath}/js/jquery.flexslider-min.js"></script>
	<!-- Magnific Popup -->
	<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
</div>
</body>
</html>

