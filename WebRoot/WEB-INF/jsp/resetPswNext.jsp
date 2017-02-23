<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/22
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>基因钥匙| 重置密码</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Free HTML5 Website Template" />
    <meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
    <!-- <link href="https://fonts.googleapis.com/css?family=Droid+Sans" rel="stylesheet"> -->

    <!-- Animate.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/icomoon.css">
    <!-- Themify Icons-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/themify-icons.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
    <!-- Magnific Popup -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/magnific-popup.css">
    <!-- Owl Carousel  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl.theme.default.min.css">
    <!-- Flexslider -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/flexslider.css">
    <!-- Theme style  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">

    <!-- Modernizr JS -->
    <script src="${pageContext.request.contextPath }/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath }/js/respond.min.js"></script>
    <![endif]-->

</head>
<body >

<div class="gtco-loader"></div>

<div >
    <nav class="gtco-nav" >
        <div class="gtco-container">
            <div class="row">
                <div class="col-xs-2 ">
                    <div id="gtco-logo"><a href="index.html">基因钥匙</a></div>
                </div>
                <div class="col-xs-10 text-right menu-1 main-nav">
                    <ul>
                        <li ><a href="#">关于我们</a></li>
                        <li><a href="#" >商城</a></li>
                        <li><a href="#" >示例报告</a></li>
                        <li><a href="#">检测流程</a></li>
                        <li><a href="#" >商务合作</a></li>
                        <li><a href="#" >爱心公益</a></li>
                    </ul>
                </div>
            </div>

        </div>
    </nav>
    <div class="login-page">
        <div class="container">
            <div class="login-body" >
                <h3 class="page-header">找回密码</h3>


                <form action="#" method="post">
                    <div class="form-group ">
                        <label  class="formlabel">新密码</label>
                        <input type="password"  class="form-control" name="password" placeholder="请设置新密码" required ="">
                    </div>
                    <div class="clearfix"></div>
                    <input type="submit" value="完 成">
                    <h6> 未注册用户？<a href="register.html">立即注册</a></h6>
                </form>


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
                        <li><img class="erweima" src="${pageContext.request.contextPath }/images/img_2.jpg"/></li>
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
    <script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <!-- jQuery Easing -->
    <script src="${pageContext.request.contextPath }/js/jquery.easing.1.3.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    <!-- Waypoints -->
    <script src="${pageContext.request.contextPath }/js/jquery.waypoints.min.js"></script>
    <!-- Carousel -->
    <script src="${pageContext.request.contextPath }/js/owl.carousel.min.js"></script>
    <!-- countTo -->
    <script src="${pageContext.request.contextPath }/js/jquery.countTo.js"></script>
    <!-- Flexslider -->
    <script src="${pageContext.request.contextPath }/js/jquery.flexslider-min.js"></script>
    <!-- Magnific Popup -->
    <script src="${pageContext.request.contextPath }/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/magnific-popup-options.js"></script>
    <!-- Main -->
    <script src="${pageContext.request.contextPath }/js/main.js"></script>
</div>
</body>
</html>

