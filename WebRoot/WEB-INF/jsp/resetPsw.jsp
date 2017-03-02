<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/22
  Time: 16:50
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
    <script type="text/javascript">

        var countdown = 60;
        function settime(obj) {
            if(countdown == 60){
                sendmessage();
                obj.setAttribute("disabled", true);
                obj.value="重新发送(" + countdown + ")";
                countdown--;
            }else if (countdown == 0) {
                obj.removeAttribute("disabled");
                obj.value="发送验证码";
                countdown = 60;
                return;
            } else {
                obj.setAttribute("disabled", true);
                obj.value="重新发送(" + countdown + ")";
                countdown--;
            }
            setTimeout(function() {
                    settime(obj) }
                ,1000)
        }

        function sendmessage() {
            //设置button效果，开始计时
            var phone = $("#login-mobile").val();
            $.ajax({
                type: "POST", //用POST方式传输
                dataType: "text", //数据格式:JSON
                url: 'user_findPswdBack', //目标地址
                data: "phone=" + phone/* +"&uid=" + uid + "&code=" + code*/,
                error: function (XMLHttpRequest, textStatus, errorThrown) { },
                success: function (msg){
                    if(msg!="【ok】"){
                        //do something
                    }
                }
            });
        }
    </script>
</head>
<body >

<div class="gtco-loader"></div>

<div >
    <%@include file="title.jsp"%>
    <div class="login-page">
        <div class="container">
            <div class="login-body" >
                <h3 class="page-header">找回密码</h3>


                <form action="${pageContext.request.contextPath }/user_findPasswordBack.action" method="post">
                    <div class="form-group ">
                        <label  class="formlabel">手机号</label>
                        <input type ="text" id="login-mobile" class="form-control" name="phone" placeholder="请输入手机号" required="">
                    </div>
                    <div class="clearfix"></div>
                    <div class="form-group ">
                        <label  class="formlabel">手机验证码</label>
                        <input type ="text"  name="dynamicCode" class="phoneCheck form-control" placeholder="请输入短信验证码" required="">
                        <input type="button" class="getphoneCode form-control"  value="发送验证码" onclick="settime(this)" />
                    </div>
                    <div class="clearfix"></div>
                    <input type="submit" value="下一步" >
                    <h6> 未注册用户？<a href="${ pageContext.request.contextPath }/user_registPage.action">立即注册</a></h6>
                </form>



            </div>
        </div>
    </div>

   <%@include file="foot.jsp"%>
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


