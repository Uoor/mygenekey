package cn.mygenekey.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.mygenekey.user.service.UserService;
import cn.mygenekey.user.vo.User;
import cn.mygenekey.base.BaseAction;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import cn.mygenekey.utils.ValidateUtils;
import cn.mygenekey.utils.DataUtils;
import cn.mygenekey.utils.MessageSend;
import net.sf.json.JSONObject;

/**
 * 用户模块Action的类
 * 
 *  
 * 
 */
@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User> {
	// 模型驱动使用的对象
	private User user = new User();

	public User getModel() {
		return user;
	}
	// 接收验证码:
	private String checkcode;
	
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	// 注入UserService
	@Autowired
	private UserService userService;
/*
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
*/
	/**
	 * 跳转到注册页面的执行方法
	 */
	public String registPage() {
		return "registPage";
	}

	/**
	 * AJAX进行异步校验用户名的执行方法
	 * 
	 * @throws IOException
	 */
	public String findByName() throws IOException {
		// 调用Service进行查询:
		User existUser = userService.findByUsername(user.getUsername());
		// 获得response对象,项页面输出:
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		// 判断
		if (existUser != null) {
			// 查询到该用户:用户名已经存在
			response.getWriter().println("<font color='red'>该用户已经存在</font>");
		} else {
			// 没查询到该用户:用户名可以使用
			response.getWriter().println("<font color='green'>该用户名可以使用</font>");
		}
		return NONE;
	}

	/**
	 * 用户注册的方法:
	 */
	@Deprecated
	public String regist() {
		// 判断验证码程序:
		// 从session中获得验证码的随机值:
		String checkcode1 = (String) ServletActionContext.getRequest()
				.getSession().getAttribute("checkcode");
		if(!checkcode.equalsIgnoreCase(checkcode1)){
			this.addActionError("验证码输入错误!");
			return "checkcodeFail";
		}
		userService.save(user);
		this.addActionMessage("注册成功!请去邮箱激活!");
		return "msg";
	}



	/**
	 * 用户激活的方法
	 */
	@Deprecated
	public String active() {
		// 根据激活码查询用户:
		User existUser = userService.findByCode(user.getCode());
		// 判断
		if (existUser == null) {
			// 激活码错误的
			this.addActionMessage("激活失败:激活码错误!");
		} else {
			// 激活成功
			// 修改用户的状态
			existUser.setState(1);
			existUser.setCode(null);
			userService.update(existUser);
			this.addActionMessage("激活成功:请去登录!");
		}
		return "msg";
	}

	/**
	 * 跳转到登录页面
	 */
	public String loginPage() {
		return "loginPage";
	}

	/**
	 * 登录的方法
	 */
	public String login() {
		User existUser = userService.login(user);
		// 判断
		if (existUser == null) {
			// 登录失败
			this.addActionError("登录失败:用户名或密码错误");
			return LOGIN;
		} else {
			// 登录成功
			// 将用户的信息存入到session中
			ServletActionContext.getRequest().getSession()
					.setAttribute("existUser", existUser);
			// 页面跳转
			return "loginSuccess";
		}
	
	}
	
	/**
	 * 用户退出的方法
	 */
	public String quit(){
		// 销毁session
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}


	/**
	 * 短信注册
	 *
	 * @return
	 */
	public String mobileRegister() throws Exception {


		String phone1= getParameter("phone");
		String dynamic1 = getParameter("dynamicCode");
		String password1 = getParameter("password");
		System.out.println("phone1->" + phone1);
		System.out.println("dynamic1->" + dynamic1);

		String phone = (String) ServletActionContext.getRequest()
				.getSession().getAttribute("phone");
		String dynamic = (String) ServletActionContext.getRequest()
				.getSession().getAttribute("dynamic");
		String password = (String) ServletActionContext.getRequest()
				.getSession().getAttribute("password");

		String verificationCode = (String) getSession().get(
				"verificationCode");
		System.out.println("phone2->" + phone);
		System.out.println("dynamic2->" + dynamic);
		if (ValidateUtils.checkMobileNumber(phone)
				&& ValidateUtils.checkVerificationCode(dynamic)) {

			System.out.println("verificationCode->" + verificationCode);
			if (verificationCode != null) {
				// 进行短信验证码比较
				if (verificationCode.equals(dynamic)) {
					// 验证码通过，跳转至主页面

					System.out.println("创建新账号");
					User user = new User();
					user.setName(phone);
					user.setPassword(password);
					user.setPhone(phone);
					user.setState(1);
					userService.save(user);

					getSession().put("user", user);
					return "loginSuccess";

				} else {
					return "registPage";
				}
			} else {
				return "registPage";
			}
		} else {
			return "toLogin";
		}
	}



	/**
	 * 发送短信验证码
	 *
	 * @return
	 */
	//@Action(value = "sendVerification")
	public void sendVerification() throws Exception {
		String phone = (String) ServletActionContext.getRequest().getSession().getAttribute("phone");
		System.out.println("CustomerAction.sendVerification()");
		// 1.生成验证码
		String verificationCode = MessageSend.getVerificationCode();
		System.out.println("verificationCode:" + verificationCode);
		try {
			JSONObject result = JSONObject
					.fromObject(MessageSend.sendDynamicVerification(
							verificationCode, phone));
			if ("OK".equals(result.get("msg"))) {
				session.clear();
				session.put("verificationCode", verificationCode);
				writeStringToResponse("【ok】");
				mobileRegister();
			}
		} catch (Exception e) {
			log.error("发送验证码失败！");
			e.printStackTrace();
		}

	}

}
