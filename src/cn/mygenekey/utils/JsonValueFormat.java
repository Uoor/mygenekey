package cn.mygenekey.utils;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/***
 * json格式化数据实现
 * 实例：
 * JsonConfig config = new JsonConfig();
 * config.registerJsonValueProcessor(Date.class, new JsonValueFormat());
 * 
 * @author
 */
public class JsonValueFormat implements JsonValueProcessor {

	
	public JsonValueFormat(String pattern) {
		super();
		this.pattern = pattern;
	}

	public JsonValueFormat() {
		super();
		this.pattern = "yyyy-MM-dd HH:mm:ss";
	}
	//日期格式
	private String pattern;
	
	public Object processArrayValue(Object arg0, JsonConfig arg1) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public Object processObjectValue(String arg0, Object arg1, JsonConfig arg2) {
		// TODO Auto-generated method stub
		if(arg1 instanceof Timestamp){
			   String format=new SimpleDateFormat(pattern).format(arg1);
			   return format;
		}
		return null;
	}
}