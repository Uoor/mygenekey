package test.barCode.dao;

import cn.mygenekey.barCode.dao.BarCodeDao;
import cn.mygenekey.barCode.vo.BarCode;
import cn.mygenekey.base.BaseDaoImpl;
import cn.mygenekey.user.vo.User;
import cn.mygenekey.utils.PageHibernateCallback;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

/**
 * 条形码 模块持久层代码:
 * 
 *  
 * 
 */
@Repository
public class BarCodeDaoTest {

	ApplicationContext ac =
			new ClassPathXmlApplicationContext("applicationContext.xml");

	//  UserDao userDao =(UserDao)ac.getBean("userDao");
	BarCodeDao barCodeDao = (BarCodeDao)ac.getBean("barCodeDao");
	@org.junit.Test
	public void test(){
		/*
		BarCode b = new BarCode();
		long temp = System.currentTimeMillis();
		b.setBarCode("temp");
		barCodeDao.save(b);
		*/

		BarCode b = barCodeDao.findByBarCode("222-333-444-555");



	}



}
