package test;

import cn.mygenekey.barCode.dao.BarCodeDao;
import cn.mygenekey.barCode.vo.BarCode;
import cn.mygenekey.user.dao.UserDao;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * Created by mh on 17-2-6.
 */
public class Test {

    ApplicationContext ac =
            new ClassPathXmlApplicationContext("applicationContext.xml");

  //  UserDao userDao =(UserDao)ac.getBean("userDao");
    BarCodeDao barCodeDao = (BarCodeDao)ac.getBean("barCodeDao");
    @org.junit.Test
    public void test(){
        BarCode b = new BarCode();
        b.setBarCode("222-333-444-555");
        barCodeDao.save(b);
       System.out.print("end");


    }


}
