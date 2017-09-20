<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/24
  Time: 14:24
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
    <title>基因钥匙| 个人信息中心</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bind.css">

    <!-- Modernizr JS -->
    <script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/js/respond.min.js"></script>
    <![endif]-->
    <!-- Modernizr JS -->
    <script src="${pageContext.request.contextPath}/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/js/respond.min.js"></script>
    <![endif]-->
    <script>
        window.onload=function()
        {
            var oT=document.getElementById('boxCode');
            oT.onkeydown=function(ev)
            {
                var oW=oT.value;
                var oEvent=ev||event;
                if(oEvent.keyCode==8)
                {
                    if(oW)
                    {
                        for(var i=0;i<oW.length;i++)
                        {
                            var newStr=oW.replace(/\s$/g,'');
                        }
                        oT.value=newStr
                    }
                }else{
                    for(var i=0;i<oW.length;i++)
                    {
                        var arr=oW.split('');

                        if( (i+1)% 5 ==0)
                        {
                            arr.splice(i,0,'-');
                        }
                    }
                    oT.value=arr.join('');
                }
            }
        }
    </script>
</head>
<body >

<div class="gtco-loader"></div>

<div >
    <%@include file="title.jsp"%>
    <div class="bind-page">
        <div class="container">
            <div class="bind-body" >
                <h3 class="page-header bind-head" >绑  定</h3>
                <form action="${pageContext.request.contextPath }/saliva_doBind.action" method="post">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group ">
                                    <label  class="formlabel">受检人姓名</label>
                                    <input type ="text" class="form-control" name="name" placeholder="请输入姓名" required="required">
                                </div>
                                <div class="clearfix"></div>
                                <div class="form-group ">
                                    <label  class="radio formlabel">受检人性别</label>
                                    <label class="sex" data-icon="fa-mars"><input type="radio" class="hidden" name="sex" value="1" /><i></i>男士</label>
                                    <label class="sex"><input type="radio" class="hidden" name="sex" value="0"/><i></i>女士</label>
                                </div>
                                <div class="clearfix"></div>
                                <div class="form-group">
                                    <label class="formlabel">出生日期</label>
                                    <div class="selClass">
                                        <select id="year" name="year">
                                            <option>请选择年份</option>
                                        </select>
                                        <select id="month" name="month">
                                            <option>请选择月份</option>
                                        </select>
                                        <select id="day" name="day">
                                            <option>请选择日</option>
                                        </select>
                                    </div >
                                </div>
                                <div class="clearfix"></div>
                                <div class="form-group ">
                                    <label  class="formlabel">盒子编号</label>
                                    <input type ="text" id="boxCode" class="form-control" name="boxCode" maxlength="19" pattern="\d{4}-\d{4}-\d{4}-\d{4}" placeholder="格式：xxxx-xxxx-xxxx-xxxx" required="">
                                </div>

                                <div class="clearfix"></div>
                                <input type="submit" value="保 存">
                            </div>
                            <div class="col-md-6">
                                <img class="boxPicture img-responsive center-block img-rounded" src="${pageContext.request.contextPath}/images/img_4.jpg" />
                                <p>编号位置如图</p>
                            </div>

                        </div>
                    </div>
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
<script type="text/javascript">

    var y=document.getElementById("year"),
        m=document.getElementById("month"),
        d=document.getElementById("day");

    //年
    var year=new Date().getFullYear();
    for(var i=year;i>=1900;i--){
        y.options[year+1-i]=new Option(i,i);    //第一个参数是option的文本值，第二个参数是option的value值
    }

    //月
    for(var i=1;i<=12;i++){
        m.options[i]=new Option(i,i);
    }

    //日
    var day = function(){
        d.length=1;        //初始化
        var y_value=y.value,
            m_value=m.value;
        if(y_value==""||m_value==""){
            return;
        }
        else{
            var arr=[31,28,31,30,31,30,31,31,30,31,30,31];
            if((y_value%4==0&&y_value%100!=0)||y_value%400==0){
                arr[1]++;
            }
            for(i=1;i<=arr[m_value-1];i++){
                d.options[i]=new Option(i,i);
            }
        }
    }

    y.onchange = function(){
        day();
    }
    m.onchange = function(){
        day();
    }

</script>
