package com.xin.mapper;

import com.xin.bean.Finance;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.plugins.pagination.Pagination;

/**
 *缴费管理接口
 * @author com.xin
 * @since 2017-02-28
 */
public interface FinanceMapper {
	List<Finance> selectFinancePage(Pagination page, Map<String, Object> params);
	
	int financeInsert(Finance notice);
	
	Finance selectfinanceById(int id);
	
	int updateFinance(Finance finance);
	
	void deleteFinance(int id);
}