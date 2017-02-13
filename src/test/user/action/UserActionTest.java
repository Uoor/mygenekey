package test.user.action;

import cn.mygenekey.barCode.service.BarCodeService;
import cn.mygenekey.base.BaseAction;
import cn.mygenekey.utils.MessageSend;
import cn.mygenekey.utils.ValidateUtils;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import test.user.service.UserService;
import test.user.vo.User;
import cn.mygenekey.user.action.UserAction;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class UserActionTest {

	ApplicationContext ac =
			new ClassPathXmlApplicationContext("applicationContext.xml");


	//  UserDao userDao =(UserDao)ac.getBean("userDao");
	//BarCodeService barCodeService = (BarCodeService)ac.getBean("barCodeService");

	UserAction ua = (UserAction) ac.getBean("userAction");

	@Test
	public void sendVerificationTest() throws Exception {
		ua.sendVerification();
	}

	@Test
	public void mobileRegister() throws Exception {
		ua.mobileRegister();
	}

}
