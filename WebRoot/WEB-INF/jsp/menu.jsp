<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<div class="span10 last">
    <div class="topNav clearfix">
        <ul>
            <s:if test="#session.existUser == null">
                <div class="state-box">
                    <div class="container">
                        <ul class="state-no-login">
                            <li class="state-li">
                                <a type=" button" href="html/bind.html">绑定</a>
                            </li>
                            <li class="state-li">
                                <a type=" button" href="${ pageContext.request.contextPath }/user_loginPage.action">登录</a>
                            </li>
                            <li class="state-li">
                                <a type=" button" href="${ pageContext.request.contextPath }/user_registPage.action">注册</a>
                            </li>

                        </ul>
                    </div>
                </div>
            </s:if>
            <s:else>

                <div class="state-box">
                    <div class="container">
                        <ul class="state-no-login">
                            <li class="state-li">
                                <a type=" button" href="html/bind.html">绑定</a>
                            </li>
                            <li class="state-li">
                                <a type="button" href="login.html">检测报告</a>
                            </li>
                            <li class="state-li dropdown">

                                <a type=" dropdown-toggle" data-toggle="dropdown"  class="userid" >用户账号:<s:property value="#session.existUser.name"/><b class="caret"></b></a>
                                <ul class="dropdown-menu userlist ">
                                    <li ><a href="userInfo.html">信息中心</a></li>
                                    <li ><a href="${ pageContext.request.contextPath }/order_findByUid.action?page=1">我的订单</a>订单信息</a></li>
                                    <li ><a href="bindbox.html">绑定盒子</a></li>
                                    <li ><a href="resetPsw.html">修改密码</a></li>
                                    <a href="${ pageContext.request.contextPath }/user_quit.action">退出</a>|
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>


            </s:else>


        </ul>
    </div>
    <div class="cart">
        <a href="${ pageContext.request.contextPath }/cart_myCart.action">购物车</a>
    </div>

</div>
