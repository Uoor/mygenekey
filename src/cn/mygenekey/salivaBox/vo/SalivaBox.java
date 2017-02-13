package cn.mygenekey.salivaBox.vo;

import cn.mygenekey.order.vo.Order;

import java.io.Serializable;
import java.util.Date;
import cn.mygenekey.user.vo.User;
/**
 * 唾液盒的实体类对象
 * @author
 *
 */
public class SalivaBox implements Serializable{
	private Integer sbid;
	private String sex;
	private String barCode;
	private Date birthday;
	private Integer dnaAccredit;

	// 用户相关 多对一:
	private User user;

	public Integer getSbid() {
		return sbid;
	}

	public void setSbid(Integer sbid) {
		this.sbid = sbid;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBarCode() {
		return barCode;
	}

	public void setBarCode(String barCode) {
		this.barCode = barCode;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Integer getDnaAccredit() {
		return dnaAccredit;
	}

	public void setDnaAccredit(Integer dnaAccredit) {
		this.dnaAccredit = dnaAccredit;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
