package cn.mygenekey.barCode.vo;

import cn.mygenekey.order.vo.Order;
import cn.mygenekey.user.vo.User;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * 一级分类的实体类对象
 * @author
 *
 */
public class BarCode implements Serializable{
	private Integer bcid;
	private String barCode;
	private Integer status;
	private Integer uid;
	/*//绑定的盒子id
	private Integer sbid;
	//使用用户id
	private Integer uid;*/



	public Integer getBcid() {
		return bcid;
	}

	public void setBcid(Integer bcid) {
		this.bcid = bcid;
	}

	public String getBarCode() {
		return barCode;
	}

	public void setBarCode(String barCode) {
		this.barCode = barCode;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}
}
