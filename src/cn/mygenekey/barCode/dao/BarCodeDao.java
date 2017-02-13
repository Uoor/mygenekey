package cn.mygenekey.barCode.dao;

import cn.mygenekey.barCode.vo.BarCode;
import cn.mygenekey.base.BaseDaoImpl;
import cn.mygenekey.user.vo.User;
import cn.mygenekey.utils.PageHibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;
import org.junit.Test;
import org.springframework.stereotype.Repository;

/**
 * 条形码 模块持久层代码:
 * 
 *  
 * 
 */
@Repository
public class BarCodeDao extends BaseDaoImpl<BarCode> {


	// 按barCode（可能是 时间戳）查询是否有该用户:
	public BarCode findByBarCode(String timeStamp) {
		String hql = "from BarCode where barCode = ?";
		List<BarCode> list = this.getHibernateTemplate().find(hql, timeStamp);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	//根据时间戳获取器主键

	//--------------------------------
	// 按名次查询是否有该用户:
	public User findByUsername(String username) {
		String hql = "from User where username = ?";
		List<User> list = this.getHibernateTemplate().find(hql, username);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}



	// 根据激活码查询用户
	public User findByCode(String code) {
		String hql = "from User where code = ?";
		List<User> list = this.getHibernateTemplate().find(hql, code);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}


	// 用户登录的方法
	public User login(User user) {
		String hql = "from User where username = ? and password = ? and state = ?";
		List<User> list = this.getHibernateTemplate().find(hql,
				user.getUsername(), user.getPassword(), 1);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}



	public int findCount() {
		System.out.println("hi junit");
		String hql = "select count(*) from barcode ";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			System.out.println(list.get(0).intValue());
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<User> findByPage(int begin, int limit) {
		String hql = "from User";
		List<User> list = this.getHibernateTemplate().execute(
				new PageHibernateCallback<User>(hql, null, begin, limit));
		return list;
	}

	public User findByUid(Integer uid) {
		return this.getHibernateTemplate().get(User.class, uid);
	}


}
