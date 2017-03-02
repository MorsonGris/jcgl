package com.xin.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.plugins.Page;
import com.xin.bean.ApplyType;
import com.xin.commons.utils.PageInfo;
import com.xin.mapper.ApplyTypeMapper;
import com.xin.service.IApplyTypeService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
@Service
public class ApplyTypeServiceImpl implements IApplyTypeService {

	@Autowired
	private ApplyTypeMapper applytypemapper;
	
	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		Page<ApplyType> page = new Page<>(pageInfo.getNowpage(),pageInfo.getSize());
		List<ApplyType> list = applytypemapper.selectPage(page, pageInfo.getCondition());
		pageInfo.setRows(list);
		pageInfo.setTotal(page.getTotal());
	}

	@Override
	public boolean insertByid(ApplyType applyType) {
		return applytypemapper.insertByid(applyType);
	}

	@Override
	public boolean deleteById(int id) {
		return applytypemapper.deleteById(id);
	}

	@Override
	public ApplyType selectById(int id) {
		ApplyType applyType = applytypemapper.selectById(id);
		return applyType;
	}

	@Override
	public boolean updateById(ApplyType applyType) {
		return applytypemapper.updateById(applyType);
	}
	
}
