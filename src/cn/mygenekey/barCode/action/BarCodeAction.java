package cn.mygenekey.barCode.action;

import cn.mygenekey.barCode.vo.BarCode;
import cn.mygenekey.base.BaseAction;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

/**
 * Created by mh on 17-2-28.
 */
@Scope("prototype")
@Controller
public class BarCodeAction extends BaseAction<BarCode>{

	/*跳转至绑定盒子
	 */
	public String bindBox(){
		return "bindBox";
	}

}
