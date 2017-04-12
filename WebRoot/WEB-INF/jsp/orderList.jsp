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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userInfo.css">

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
    <div class="info-page">
        <div class="container">
            <div class="info-body" >
                <h3 class="page-header">信息中心</h3>
                <div class="container">
                    <div class="row">
                        <div class="col-md-2">
                            <ul class="list-group list-unstyled infoLs">
                                <li><a  class="list-group-item" href="${pageContext.request.contextPath}/user_userInfo.action">
                                    <i class="glyphicon glyphicon-user"></i>
                                    个人账户</a></li>
                                <li><a class="list-group-item  active"  href="${pageContext.request.contextPath}/order_findByUid.action?page=1">
                                    <i class="glyphicon glyphicon-list-alt"></i>
                                    订单详情</a></li>
                                <li><a class="list-group-item" href="${pageContext.request.contextPath}/saliva_bindBox.action">
                                    <span class="glyphicon glyphicon-th-large" aria-hidden="false"></span>
                                    绑定盒子</a></li>
                            </ul>
                        </div>

                        <div class="col-md-10">
                           <%-- <table class="table table-responsive  table-hover orderTb">
                                <thead>
                                <tr>
                                    <td class="reactid">订单号</td>
                                    <td>产品名 -2 </td>
                                    <td >单价 - 2</td>
                                    <td class="number">数量 - 2</td>
                                    <td >总价 -2</td>
                                    <td class="reactTime">交易时间 -？</td>
                                    <td class="interflow">物流信息 - ？</td>
                                </tr></thead>
                                <tr>
                                    <td class="reactid"> <s:property value="#order.oid" /> </td>
                                    <td class="productsName">检测产品三人</td>
                                    <td class="pricePer">3999</td>
                                    <td class="number">4</td>
                                    <td class="totalPrice">15996</td>
                                    <td class="reactState">2017-01-12 16:09:21</td>
                                    <td class="operat">
                                        <a href="#" title="物流信息" >已发货</a>
                                    </td>
                                </tr>
                            </table>--%>

                             <table class="table table-responsive  table-hover orderTb">


                                        <tr>
                                        <td class="reactid">订单号</td>
                                        <td >总价</td>
                                        <td>支付</td>

                                        <td>产品名</td>
                                        <td >单价</td>
                                        <td class="number">数量</td>

                                        <td class="reactTime">交易时间</td>
                                        <td class="interflow">物流信息</td>
                                        </tr>

                                        <s:iterator var="order" value="pageBean.list">
                                         <s:iterator var="orderItem" value="#order.orderItems">
                                        <tr>

                                        <td class="reactid"> <s:property value="#order.oid" /> </td>
                                        <td class="totalPrice"><s:property value="#order.total" /></td>

                                        <td >
                                        <s:if test="#order.state == 1">
                                            <a href="${ pageContext.request.contextPath }/order_findByOid.action?oid=<s:property value="#order.oid" />">待付款</a>
                                        </s:if>
                                        <s:if test="#order.state == 2">
                                            已付款
                                        </s:if>
                                        <s:if test="#order.state == 3">
                                            <a href="${ pageContext.request.contextPath }/order_updateState.action?oid=<s:property value="#order.oid" />">确认收货</a>
                                        </s:if>
                                        <s:if test="#order.state == 4">
                                            交易成功
                                        </s:if>
                                        </td>

                                        <td class="productsName"><s:property value="#orderItem.product.pname" /></td>
                                        <td class="pricePer"><s:property value="#orderItem.product.shop_price" /></td>
                                        <td class="number"><s:property value="#orderItem.count" /></td>

                                        <td class="reactState">?2017-01-12 16:09:21</td>
                                        <td class="operat">
                                        <a href="#" title="物流信息" >?已发货</a>
                                        </td>
                                        </tr>
                                        </s:iterator>
                                    </s:iterator>
                                 <tr>
                                     <th colspan="5">
                                         <div class="pagination">
							<span>第<s:property value="pageBean.page" />/<s:property
                                    value="pageBean.totalPage" />页 </span>
                                             <s:if test="pageBean.page != 1">
                                                 <a
                                                         href="${ pageContext.request.contextPath }/order_findByUid.action?page=1"
                                                         class="firstPage">&nbsp;</a>
                                                 <a
                                                         href="${ pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="pageBean.page-1"/>"
                                                         class="previousPage">&nbsp;</a>
                                             </s:if> <s:iterator var="i" begin="1" end="pageBean.totalPage">
                                             <s:if test="pageBean.page != #i">
                                                 <a
                                                         href="${ pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="#i"/>"><s:property
                                                         value="#i" />
                                                 </a>
                                             </s:if>
                                             <s:else>
									<span class="currentPage"><s:property value="#i" />
									</span>
                                             </s:else>
                                         </s:iterator>
                                             <s:if test="pageBean.page != pageBean.totalPage">
                                                 <a class="nextPage"
                                                    href="${ pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
                                                 <a class="lastPage"
                                                    href="${ pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
                                             </s:if>
                                         </div>
                                     </th>
                                 </tr>
                              </table>

                            <%--  <table>

                                <tbody>
                                <s:iterator var="order" value="pageBean.list">
                                    <tr>
                                        <th colspan="5">订单编号:<s:property value="#order.oid" />&nbsp;&nbsp;&nbsp;&nbsp;订单金额:<font
                                                color="red"><s:property value="#order.total" />
                                        </font>
                                            &nbsp;&nbsp;&nbsp;&nbsp;<font color="red">
                                                <s:if test="#order.state == 1">
                                                    <a href="${ pageContext.request.contextPath }/order_findByOid.action?oid=<s:property value="#order.oid" />">付款</a>
                                                </s:if>
                                                <s:if test="#order.state == 2">
                                                    已付款
                                                </s:if>
                                                <s:if test="#order.state == 3">
                                                    <a href="${ pageContext.request.contextPath }/order_updateState.action?oid=<s:property value="#order.oid" />">确认收货</a>
                                                </s:if>
                                                <s:if test="#order.state == 4">
                                                    交易成功
                                                </s:if>
                                            </font>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th>商品</th>
                                        <th>价格</th>
                                        <th>数量</th>
                                        <th>小计</th>
                                    </tr>
                                    <s:iterator var="orderItem" value="#order.orderItems">
                                        <tr>

                                            <td><s:property value="#orderItem.product.pname" /></td>
                                            <td><s:property value="#orderItem.product.shop_price" /></td>
                                            <td class="quantity" width="60"><s:property
                                                    value="#orderItem.count" /></td>
                                            <td width="140"><span class="subtotal">￥<s:property
                                                    value="#orderItem.subtotal" />
								</span></td>
                                        </tr>
                                    </s:iterator>
                                </s:iterator>
                                <tr>
                                    <th colspan="5">
                                        <div class="pagination">
							<span>第<s:property value="pageBean.page" />/<s:property
                                    value="pageBean.totalPage" />页 </span>
                                            <s:if test="pageBean.page != 1">
                                                <a
                                                        href="${ pageContext.request.contextPath }/order_findByUid.action?page=1"
                                                        class="firstPage">&nbsp;</a>
                                                <a
                                                        href="${ pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="pageBean.page-1"/>"
                                                        class="previousPage">&nbsp;</a>
                                            </s:if> <s:iterator var="i" begin="1" end="pageBean.totalPage">
                                            <s:if test="pageBean.page != #i">
                                                <a
                                                        href="${ pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="#i"/>"><s:property
                                                        value="#i" />
                                                </a>
                                            </s:if>
                                            <s:else>
									<span class="currentPage"><s:property value="#i" />
									</span>
                                            </s:else>
                                        </s:iterator> <s:if test="pageBean.page != pageBean.totalPage">
                                            <a class="nextPage"
                                               href="${ pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
                                            <a class="lastPage"
                                               href="${ pageContext.request.contextPath }/order_findByUid.action?page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
                                        </s:if>
                                            </s:iterator>
                                        </div>
                                    </th>
                                </tr>
                                </tbody>
                            </table>--%>


                            <dl id="giftItems" class="hidden" style="display: none;">
                            </dl>
                        </div>


                        <div class="col-md-10">
                        </div>
                    </div>
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