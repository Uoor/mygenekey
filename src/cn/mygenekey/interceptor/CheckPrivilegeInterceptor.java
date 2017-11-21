package cn.mygenekey.interceptor;

import cn.mygenekey.utils.*;
import cn.mygenekey.adminuser.vo.AdminUser;
import cn.mygenekey.user.vo.User;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import org.apache.struts2.ServletActionContext;

public class CheckPrivilegeInterceptor extends MethodFilterInterceptor {
	
	
	
	

	@Override
	public String doIntercept(ActionInvocation actionInvocation) throws Exception {
		User user = (User) ServletActionContext.getRequest()
				.getSession().getAttribute("existUser");
		String namespace = actionInvocation.getProxy().getNamespace();
		String actionName = actionInvocation.getProxy().getActionName();
		String privUrl = namespace + "|" +actionName; // 对应的权限URL

		System.out.println("前台privUrl" + " -->" + privUrl );

		if(user != null){
			// 已经登录过
			return actionInvocation.invoke();
		}else{
			if (actionName.startsWith("toLogin")
					|| actionName.startsWith("login")
					|| actionName.startsWith("user_sendVerification")
					|| actionName.startsWith("sendVerification")
					|| actionName.startsWith("user_regist")
					|| actionName.startsWith("user_regist")
					|| actionName.startsWith("user_input")
					|| actionName.startsWith("user_find")
					|| actionName.startsWith("user_login")
					|| actionName.startsWith("user_mobileRegister")
					|| actionName.startsWith("user_forgetPsw"))
			{
				// 如果是去登录，就放行
				return actionInvocation.invoke();
			}
			// 跳转到登录页面:
			ActionSupport support = (ActionSupport) actionInvocation.getAction();
			support.addActionError("您还没有登录!没有权限访问!跳转到：" + ActionSupport.LOGIN);
			return ActionSupport.LOGIN;
		}
				
		
	} //intercept

}//class
