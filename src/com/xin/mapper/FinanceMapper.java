package com.xin.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.xin.bean.Finance;
import com.xin.commons.utils.PageJson;

/**
 *缴费管理接口
 * @author com.xin
 * @since 2017-02-28
 */
public interface FinanceMapper {
	List<Finance> selectFinancePage(Pagination page, Map<String, Object> params);
	
	int financeInsert(Finance notice);
	
	Finance selectfinanceById(int id);
	
	Finance selectBystuno(String id);
	
	int updateFinance(Finance finance);
	
	void deleteFinance(int id);
	
	int updateBatchFinance(Finance finance);
	
	List<Finance> selectFinanceAll(Finance finance);
	
	List<Finance> financepage(String stuno,int offset,int limit);
	PageJson<Finance> queryTotal(String stuno);
	
	List<Finance> financepagebyteaid(String teaid,int offset,int limit);
	PageJson<Finance> queryTotalbyteaid(String teaid);
}