package cn.mygenekey.user.action;

import cn.mygenekey.base.BaseAction;
import cn.mygenekey.user.service.UserService;
import cn.mygenekey.user.vo.User;
import cn.mygenekey.utils.MessageSend;
import cn.mygenekey.utils.ValidateUtils;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 用户模块Action的类
 * 
 *  
 * 
 */
@Controller
@Scope("prototype")
public class UserAction extends BaseAction<User> {
	private User user = new User();

	public User getModel() {
		return user;
	}
	// 接收验证码:
	private String checkcode;

	//接收注册时的phone参数信息；
	//private String phone;
	
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
//获取注册页面中的phone参数
//	public void setPhone(String phone) {
//		this.phone = phone;
//	}

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


	/*
	AJAX进行异步校验手机号是否存在的的执行方法
	 */
	public String findByPhone() throws IOException {
		// 调用Service进行查询:
		//user作为模型驱动，后面get的是在传过来页面的参数内容
		User existUser = userService.findByUserphone(user.getPhone());
		// 获得response对象,向页面输出:
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		// 判断
		if (existUser != null) {
			// 查询到该用户:用户名已经存在
			response.getWriter().println("<font color='red'>该手机号已经存在</font>");
		} else {
			// 没查询到该用户:用户名可以使用
			response.getWriter().println("<font color='green'>该手机号可以使用</font>");
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
		String checkcode1 = getParameter("checkcode");
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


		String phone= getParameter("phone");
		String dynamic = getParameter("dynamicCode");
		String password = getParameter("password");

		String verificationCode = (String) getSession().get(
				"verificationCode");

//        String verificationCode = (String)ActionContext.getContext().getSession().get("verificationCode");


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
					user.setUsername(phone);
					user.setPassword(password);
					user.setPhone(phone);
					user.setState(1);
					userService.save(user);

					this.addActionMessage("注册成功!请登陆!");
					return "loginPage";

				} else {
					this.addActionMessage("注册失败!验证码有误!verificationCode.equals(dynamic)不相等");
					return "registPage";
				}
			} else {
				this.addActionMessage("注册失败!验证码有误!verificationCode为空");
				return "registPage";
			}
		} else {
			this.addActionMessage("注册失败!验证码有误!");
			return "registPage";
		}
	}

	/**
	 * 找回密码 页面
	 * 要判断 手机号是否已经存在 动作
	 * @return
	 */
		public String findPasswordBackPage() throws Exception {
			return "findPasswordBackPage";
	}




		/**
		 * 找回密码
		 * 要判断 手机号是否已经存在 动作
		 * @return
		 */
	public String findPasswordBack() throws Exception {


		String phone= getParameter("phone");
		String dynamic = getParameter("dynamicCode");

        System.out.println("dynamicCode->" + dynamic);

		String pswdBackCode = (String) getSession().get("pswdBackCode");
        //String pswdBackCode = (String)ActionContext.getContext().getSession().get("pswdBackCode");

		if (ValidateUtils.checkMobileNumber(phone)
				&& ValidateUtils.checkVerificationCode(dynamic)) {

			System.out.println("pswdBackCode->" + pswdBackCode);
			if (pswdBackCode != null) {
				// 进行短信验证码比较
				if (pswdBackCode.equals(dynamic)) {
					// 验证码通过，跳转至主页面
					//根据用户名找到改用户
					User findPasswordUser = userService.findByUsername(user.getUsername());
					getSession().put("findPasswordUser", findPasswordUser);

					return "findPasswordBackNext";

				} else {
					this.addActionMessage("找回密码失败!");
					return "findPasswordBackPage";
				}
			} else {
				this.addActionMessage("找回密码失败!");
				return "findPasswordBackPage";
			}
		} else {
			this.addActionMessage("找回密码失败!");
			return "findPasswordBackPage";
		}
	}


	/**
	 * 注册发送短信验证码
	 *
	 * @return
	 */
	//@Action(value = "sendVerification")
	public void sendVerification() throws Exception {
		String phone = getParameter("phone");
		// 1.生成验证码
		String verificationCode = MessageSend.getVerificationCode();
		System.out.println("verificationCode:" + verificationCode);
		try {
			JSONObject result = JSONObject
					.fromObject(MessageSend.sendDynamicVerification(
							verificationCode, phone));


			if ("OK".equals(result.get("msg"))) {
			    //改用session原生方式
                //ActionContext.getContext().getSession().put("verificationCode", verificationCode);
				session.clear();
				session.put("verificationCode", verificationCode);
				writeStringToResponse("【ok】");
			}
		} catch (Exception e) {
			log.error("发送验证码失败！");
			e.printStackTrace();
		}

	}

	/**
	 * 找回密码发送短信验证码
	 *
	 * @return
	 */
	public void findPswdBack() throws Exception {
		String phone = getParameter("phone");
		// 1.生成验证码,6位数值
		String pswdBackCode = MessageSend.getVerificationCode();
		System.out.println("pswdBackCode:" + pswdBackCode);
		try {
			JSONObject result = JSONObject
					.fromObject(MessageSend.findpswdDynamicVerification(
							pswdBackCode, phone));
			if ("OK".equals(result.get("msg"))) {
				session.put("pswdBackCode", pswdBackCode);

                //ActionContext.getContext().getSession().put("pswdBackCode", pswdBackCode);
				writeStringToResponse("【ok】");
			}
		} catch (Exception e) {
			log.error("发送验证码失败！");
			e.printStackTrace();
		}

	}

	public String forgetPsw(){
	    return "forgetPsw";
    }



    /*
重置密码，不能获取自己这边的验证码内容
 */
    public String findPasswordBackNext() throws Exception {

        String password= getParameter("password");
 //       User findPasswordUser = userService.findByUsername(user.getUsername());
       User findPasswordUser = (User)getSession().get("findPasswordUser");

        findPasswordUser.setPassword(password);
        userService.update(findPasswordUser);
        return "login";


    }


	/**
	 *跳转至用户个人中心
	 */

public String userInfo(){

	return "userInfo";
}




}
