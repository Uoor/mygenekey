<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/23
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

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