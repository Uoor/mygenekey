package test.barCode.service;

import cn.mygenekey.barCode.dao.BarCodeDao;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.transaction.annotation.Transactional;
import test.barCode.dao.BarCodeDaoTest;
import cn.mygenekey.barCode.service.BarCodeService;
/**
 * 用户名模块业务层代码
 *  
 *
 */
@Transactional
public class BarCodeServiceTest {
	ApplicationContext ac =
			new ClassPathXmlApplicationContext("applicationContext.xml");

	//  UserDao userDao =(UserDao)ac.getBean("userDao");
	BarCodeService barCodeService = (BarCodeService)ac.getBean("barCodeService");


//当生成订单时，随机生成一个 barCode
	
	@Test
	public void  newRandomBarCodeTest() {
		System.out.println("hi");
		barCodeService.newRandomBarCode();
	}
	

}
