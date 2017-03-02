package cn.mygenekey.salivaBox.action;

import cn.mygenekey.base.BaseAction;
import cn.mygenekey.salivaBox.vo.SalivaBox;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Created by mh on 17-2-28.
 */
@Controller
@Scope("prototype")
public class SalivaBoxAction extends BaseAction<SalivaBox> {
	/*跳转至绑定盒子
	 */
	public String bindBox(){
		System.out.println("到这了吗？？");

		return "bindBox";
	}
}
