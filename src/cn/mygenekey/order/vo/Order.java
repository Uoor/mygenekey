package cn.mygenekey.order.vo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import cn.mygenekey.logisticCompany.vo.LogisticsCompany;
import cn.mygenekey.user.vo.User;

/**
 * 订单实体
 * @author
 *CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `total` double DEFAULT NULL,
  `ordertime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FKC3DF62E5AA3D9C7` (`uid`),
  CONSTRAINT `FKC3DF62E5AA3D9C7` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
 */
public class Order {
	private Integer oid;
	private Double total;
	private Date ordertime;
	private Integer state;// 1:未付款   2:订单已经付款   3:已经发货   4:订单结束
	private String name;
	private String phone;
	private String addr;
	private Date acceptTime;
	private Date refuseTIme;
	private Date endTime;
	private Date supplyTime;
	private Integer balance;// 0:未付款 1:已付款
	private Integer paymentType;//1：微信支付  2：支付宝支付 3：网银支付
	private String accountNumber;
	private Date backTime;

	private String waybillNumber;
	//物流公司的外键
	private LogisticsCompany logisticsCompany;


	// 用户的外键:对象
	private User user;
	// 配置订单项的集合
	private Set<OrderItem> orderItems = new HashSet<OrderItem>();

	public Date getAcceptTime() {
		return acceptTime;
	}

	public Date getBackTime() {
		return backTime;
	}

	public void setBackTime(Date backTime) {
		this.backTime = backTime;
	}

	public void setAcceptTime(Date acceptTime) {
		this.acceptTime = acceptTime;

	}

	public Date getRefuseTIme() {
		return refuseTIme;
	}

	public void setRefuseTIme(Date refuseTIme) {
		this.refuseTIme = refuseTIme;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Date getSupplyTime() {
		return supplyTime;
	}

	public void setSupplyTime(Date supplyTime) {
		this.supplyTime = supplyTime;
	}

	public Integer getBalance() {
		return balance;
	}

	public void setBalance(Integer balance) {
		this.balance = balance;
	}

	public Integer getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(Integer paymentType) {
		this.paymentType = paymentType;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getWaybillNumber() {
		return waybillNumber;
	}

	public void setWaybillNumber(String waybillNumber) {
		this.waybillNumber = waybillNumber;
	}

	public LogisticsCompany getLogisticsCompany() {
		return logisticsCompany;
	}

	public void setLogisticsCompany(LogisticsCompany logisticsCompany) {
		this.logisticsCompany = logisticsCompany;
	}


	
	public Integer getOid() {
		return oid;
	}
	public void setOid(Integer oid) {
		this.oid = oid;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public Date getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	
}
