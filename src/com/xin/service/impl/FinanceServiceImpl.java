package com.xin.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.xin.bean.Finance;
import com.xin.commons.utils.PageInfo;
import com.xin.commons.utils.PageJson;
import com.xin.mapper.FinanceMapper;
import com.xin.service.IFinanceService;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
@Service
public class FinanceServiceImpl implements IFinanceService {
	
	@Autowired
	private FinanceMapper financeMapper;
	
	@Override
	public List<Finance> selectFinancePage(PageInfo pageInfo) {
		Page<Finance> page = new Page<Finance>(pageInfo.getNowpage(), pageInfo.getPagesize());
		String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
		List<Finance> list = financeMapper.selectFinancePage(page, pageInfo.getCondition());
		pageInfo.setRows(list);
		pageInfo.setTotal(page.getTotal());
		return list;
	}

	@Override
	public int financeInsert(Finance notice) {
		return financeMapper.financeInsert(notice);
	}

	@Override
	public Finance selectfinanceById(int id) {
		return financeMapper.selectfinanceById(id);
	}

	@Override
	public int updateFinance(Finance finance) {
		finance.setFDate(new Date());
		return financeMapper.updateFinance(finance);
	}

	@Override
	public void deleteFinance(int id) {
		financeMapper.deleteFinance(id);
	}

	@Override
	public int updateBatchFinance(Finance finance) {
		return financeMapper.updateBatchFinance(finance);
	}

	@Override
	public List<Finance> selectFinanceAll(Finance finance) {
		List<Finance> list = financeMapper.selectFinanceAll(finance);
		return list;
	}

	@Override
	public List<Finance> financepage(String stuno, int offset, int limit) {
		return financeMapper.financepage(stuno, offset, limit);
	}

	@Override
	public long queryTotal(String stuno) {
		PageJson<Finance> pages = financeMapper.queryTotal(stuno);
		return pages.getTotal();
	}
	
}
