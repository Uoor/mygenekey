package cn.mygenekey.user.vo;

import java.util.HashSet;
import java.util.Set;

import cn.mygenekey.order.vo.Order;
import cn.mygenekey.salivaBox.vo.SalivaBox;

/**
 * 用户名模块实体类:
 * @author
 *CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
 */
public class User {
	private Integer uid;
	private String username;
	private String password;
	private String name;
	private String email;


	private String phone;
	private String addr;
	private Integer state;
	private String code;
	private String barCode;

	// 一个用户对应多个订单:
	private Set<Order> orders = new HashSet<Order>();
	// 一个用户对应多个唾液盒:
	private Set<SalivaBox> salivaBoxs = new HashSet<SalivaBox>();

	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	public String getBarCode() {
		return barCode;
	}

	public void setBarCode(String barCode) {
		this.barCode = barCode;
	}

	public Set<SalivaBox> getSalivaBoxs() {
		return salivaBoxs;
	}

	public void setSalivaBoxs(Set<SalivaBox> salivaBoxs) {
		this.salivaBoxs = salivaBoxs;
	}
	
}
