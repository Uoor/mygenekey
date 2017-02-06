package cn.mygenekey.logisticCompany.vo;

import cn.mygenekey.categorysecond.vo.CategorySecond;
import cn.mygenekey.order.vo.Order;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 一级分类的实体类对象
 * @author
 *
 */
public class LogisticsCompany implements Serializable{
	private Integer lcid;
	private String logisticName;
	// 订单相关 一对多:
	private Set<Order> orders = new HashSet<Order>();

	public Integer getLcid() {
		return lcid;
	}

	public void setLcid(Integer lcid) {
		this.lcid = lcid;
	}

	public String getLogisticName() {
		return logisticName;
	}

	public void setLogisticName(String logisticName) {
		this.logisticName = logisticName;
	}

	public Set<Order> getOrders() {
		return orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}




	
}
