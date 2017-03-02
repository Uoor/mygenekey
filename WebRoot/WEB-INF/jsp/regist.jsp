<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>基因钥匙| 注册</title>
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
        function checkphone() {
            var phone = document.getElementById("login-mobile").value;
            var isMobile=/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
            if(phone == null || phone == ''){
                document.getElementById("span1").innerHTML="手机号不能为空!";
                return false;
            }
            else if(!isMobile.test(phone)) {
                document.getElementById("span1").innerHTML="手机号输入不正确!";
                return false;
            }
            checkUsername();
            if(document.getElementById("span1").innerHTML=="用户名不可用")
                return false;
            else
                return true;

        }
        function checkPassw() {
            var password = document.getElementById("password").value;
            if(password == null || password == ''){
                document.getElementById("span2").innerHTML="密码不能为空!";
                return false;
            }
            else return true;
        }
        function recheckpassw(){
            // 校验确认密码:
            var password = document.getElementById("password").value;
            var repassword = document.getElementById("repassword").value;
            if(repassword != password){
                document.getElementById("span3").innerHTML="两次密码输入不一致!";
                return false;
            }
            return true;
        }
        function checkForm(){
            //检查是否同意法律声明
            var check=document.getElementById("acc");
            if(check.checked == "")
                alert("请阅读法律声明！");
            return false;
            var ok = false;
            var phoneOk = false;
            var passwOk = false;

            if(checkphone()){ phoneOk = true; }  //验证name
            if(checkPassw())
                if(recheckpassw())
                { passwOk = true; } //验证password

            if(phoneOk==true )
                if(passwOk==true ){
                alert("注册成功 ..");  //注册成功
                return true;
            }
            return false;  //有误，注册失败
        }
        var countdown=60;
        function settime(obj) {
            var ok=false;
            var phoneOk =checkphone();
            var passwOk = recheckpassw();
            if(!phoneOk || !passwOk){
                alert("验证码发送失败！");
                return false;}
            if(countdown == 60){
                sendmessage();
                obj.setAttribute("disabled", true);
                obj.value="重新发送(" + countdown + ")";
                countdown--;
            }else if (countdown == 0) {
                obj.removeAttribute("disabled");
                obj.value="免费获取验证码";
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
                url: 'user_sendVerification', //目标地址
                data: "phone=" + phone,     <!-- /* +"&uid=" + uid + "&code=" + code*/, -->
                error: function (XMLHttpRequest, textStatus, errorThrown) { },
                success: function (msg){
                    if(msg!="【ok】"){
                        //do something
                    }
                }
            });
        }

        function checkUsername(){
            // 获得文件框值:
            var username = document.getElementById("login-mobile").value;
            // 1.创建异步交互对象
            var xhr = createXmlHttp();
            // 2.设置监听
            xhr.onreadystatechange = function(){
                if(xhr.readyState == 4){
                    if(xhr.status == 200){
                        document.getElementById("span1").innerHTML = xhr.responseText;
                    }
                }
            }
            // 3.打开连接
            xhr.open("GET","${pageContext.request.contextPath}/user_findByName.action?time="+new Date().getTime()+"&username="+username,true);
            // 4.发送
            xhr.send(null);
        }

        function createXmlHttp(){
            var xmlHttp;
            try{ // Firefox, Opera 8.0+, Safari
                xmlHttp=new XMLHttpRequest();
            }
            catch (e){
                try{// Internet Explorer
                    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch (e){
                    try{
                        xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    catch (e){}
                }
            }
            return xmlHttp;
        }

    </script>

</head>
<body >
<div class="gtco-loader"></div>
<div >

<%@include file="title.jsp"%>

    <div class="login-page" >
        <div class="container">
            <div class="login-body" >
                <h3 class="page-header">注 册</h3>
                <form action="${pageContext.request.contextPath }/user_mobileRegister.action"  method="post" novalidate="novalidate" onsubmit="return checkForm();">
                    <div class="form-group ">
                        <label  class="formlabel">手机号</label>
                        <input type ="text" id="login-mobile" class="form-control" name="phone" pattern="\d{11}" placeholder="请输入手机号" required="required" onblur="checkphone()">
                        <span id="span1" class="info"></span><!-- 补充ajax中返回参数-->
                    </div>
                    <div class="clearfix"></div>
                    <div class="form-group ">
                        <label  class="formlabel">密码</label>
                        <input type="password"  id="password"class="form-control" name="password" placeholder="请设置密码" required ="required" onblur="checkPassw()">
                        <span id="span2"class="info"></span>
                    </div>
                    <div class="clearfix"></div>
                    <div class="form-group ">
                        <label  class="formlabel">确认密码</label>
                        <input type="password" id="repassword"  class="form-control"name="passwordCheck" placeholder="请重新密码" required ="required" onblur="recheckpassw()">
                        <span id="span3"class="info"></span>
                    </div>
                    <div class="clearfix"></div>
                    <div class="form-group ">
                        <label  class="formlabel">验证码</label>
                        <input type ="text"  name="dynamicCode" class="phoneCheck form-control" placeholder="短信验证码" required="required">
                        <input type="button" class="getphoneCode form-control"  value="发送验证码" onclick="settime(this)" />
                    </div>
                    <div class="clearfix"></div>
                    <div class="container">
                        <label class="checkbox">
                            <input type="checkbox"  name="checkbox">我已阅读并同意
                            <a href="#">《法律声明》</a></label>
                        <div class="clearfix"></div>
                    </div>
                    <input type="submit" value="注 册">
                    <h6> 已有账号？<a href="${ pageContext.request.contextPath }/user_loginPage.action">马上登录</a></h6>
                    <div class="clearfix"></div>
                </form>
            </div>
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


