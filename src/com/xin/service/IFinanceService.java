package com.xin.service;

import java.util.List;

import com.xin.bean.Finance;
import com.xin.commons.utils.PageInfo;


/**
 * <p>
 *  服务类
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
public interface IFinanceService {
	List<Finance> selectFinancePage(PageInfo pageinfo);
	
	int financeInsert(Finance notice);
	
	Finance selectfinanceById(int id);
	
	int updateFinance(Finance finance);
	
	void deleteFinance(int id);
	
	int updateBatchFinance(Finance finance);	
	
	List<Finance> selectFinanceAll(Finance finance);
}
