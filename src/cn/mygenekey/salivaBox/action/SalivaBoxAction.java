package cn.mygenekey.salivaBox.action;

import cn.mygenekey.base.BaseAction;
import cn.mygenekey.salivaBox.service.SalivaBoxService;
import cn.mygenekey.salivaBox.vo.SalivaBox;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by mh on 17-2-28.
 */
@Controller
@Scope("prototype")
public class SalivaBoxAction extends BaseAction<SalivaBox> {

	@Autowired
	SalivaBoxService salivaBoxService;
	/*跳转至绑定盒子
	必须先在 action中有方法，再映射到 struts.xml
	 */
	public String bindBox(){
		System.out.println("bindBox到这了吗？？");

		return "bindBoxPage";
	}

	public String doBindPage() {



		return "doBindPage";
	}

	//doBindPage.jsp 绑定按钮 提交到doBind.action，不需要在struts.xml注册
	public String doBind() throws ParseException{

		SalivaBox salivaBox = new SalivaBox();
		;
		String year = getParameter("year");
		String month = getParameter("month");
		String day = getParameter("day");

		salivaBox.setBarCode(getParameter("boxCode"));
		salivaBox.setUserName(getParameter("name"));
		salivaBox.setSex(getParameter("sex"));
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date birthday = format.parse( year + "-" + month + "-" + day);
		salivaBox.setBirthday(birthday);
		//接受DNA检验
		salivaBox.setDnaAccredit(1);

		salivaBoxService.save(salivaBox);


		return "bindBoxPage";
	}
}
