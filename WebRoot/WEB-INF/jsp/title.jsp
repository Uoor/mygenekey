<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/23
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<nav class="gtco-nav" >
    <div class="span10 last">
        <div class="topNav clearfix">
            <ul>
                <s:if test="#session.existUser == null">
                    <div class="state-box">
                        <div class="container">
                            <ul class="state-no-login">
                                <!--新版的23 没有绑定
                                <li class="state-li">
                                    <a type=" button" href="${ pageContext.request.contextPath }/saliva_bindBox.action">绑定</a>
                                </li>
                                -->
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
                                    <a type=" button" href="${ pageContext.request.contextPath }/saliva_bindBox.action">绑定</a>
                                </li>
                                <li class="state-li">
                                    <a type="button" href="login.html">检测报告</a>
                                </li>
                                <li><a type="button" href="${ pageContext.request.contextPath }/cart_myCart.action">购物车</a></li>
                                <li class="state-li dropdown">
                                    <a type=" dropdown-toggle" data-toggle="dropdown"  class="userid" >
                                        <s:property value="#session.existUser.name"/><b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu userlist ">

                                        <li ><a href="${ pageContext.request.contextPath }/user_userInfo.action">个人中心</a></li>
                                        <li ><a href="${ pageContext.request.contextPath }/order_findByUid.action?page=1">我的订单</a></li>
                                        <li ><a type=" button" href="${ pageContext.request.contextPath }/saliva_bindBox.action">绑定盒子</a></li>
                                        <li ><a href="${ pageContext.request.contextPath }/user_resetPsw.action">修改密码</a></li>
                                        <a href="${ pageContext.request.contextPath }/user_quit.action">退出</a>|
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </s:else>
            </ul>
        </div>

    </div>


    <div class="gtco-container">
        <div class="row">
            <div class="col-xs-2 ">
                <div id="gtco-logo"><a href="index.action">基因钥匙</a></div>
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
