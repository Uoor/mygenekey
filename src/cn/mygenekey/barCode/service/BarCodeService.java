package cn.mygenekey.barCode.service;

import cn.mygenekey.barCode.dao.BarCodeDao;
import cn.mygenekey.barCode.vo.BarCode;
import cn.mygenekey.user.vo.User;
import cn.mygenekey.utils.*;
import com.sun.xml.internal.bind.v2.TODO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户名模块业务层代码
 *  
 *
 */
@Transactional
@Service
public class BarCodeService {
	@Autowired
	private BarCodeDao barCodeDao;



//当生成订单时，随机生成一个 barCode
// 业务层完成
	//TODO barcode加 唯一索引
public BarCode newRandomBarCode() {
	BarCode tempBarCode = new BarCode();
	IdWorker idWorker = new IdWorker(0,0);
	String temp = idWorker.nextId() + "";
	System.out.println("temp: " + temp);

	tempBarCode.setBarCode(temp);
	barCodeDao.save(tempBarCode);
	BarCode bc = barCodeDao.findByBarCode(temp);
	// 说明有 数据再取出其主键
	if(null != bc) {
		int i = bc.getBcid();
		//通过主键和 随见值生成唯一 barCode，再update
		System.out.println(i);
		System.out.println("before: " + bc.getBarCode());
		bc.setBarCode(BarCodeUtil.getRandomBarCode(i));
		barCodeDao.update(bc);
		System.out.println("after: " + bc.getBarCode());

		return bc;
	}

	return null;


}
	
	

}
