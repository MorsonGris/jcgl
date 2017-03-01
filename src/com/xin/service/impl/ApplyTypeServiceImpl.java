package com.xin.service.impl;

import com.xin.bean.ApplyType;
import com.xin.commons.utils.PageInfo;
import com.xin.mapper.ApplyTypeMapper;
import com.xin.service.IApplyTypeService;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

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
public class ApplyTypeServiceImpl extends ServiceImpl<ApplyTypeMapper, ApplyType> implements IApplyTypeService {

	@Autowired
	private ApplyTypeMapper applytypemapper;
	
	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		Page<ApplyType> page = new Page<>(pageInfo.getNowpage(),pageInfo.getSize());
		List<ApplyType> list = applytypemapper.selectPage(page, pageInfo.getCondition());
		pageInfo.setRows(list);
		pageInfo.setTotal(page.getTotal());
	}
	
}
