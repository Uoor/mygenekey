package cn.mygenekey.salivaBox.service;

import cn.mygenekey.barCode.dao.BarCodeDao;
import cn.mygenekey.barCode.vo.BarCode;
import cn.mygenekey.salivaBox.dao.SalivaBoxDao;
import cn.mygenekey.utils.BarCodeUtil;
import cn.mygenekey.utils.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户名模块业务层代码
 *  
 *
 */
@Transactional
@Service
public class SalivaBoxService {
	@Autowired
	private SalivaBoxDao salivaBoxDao;



}
