package com.xin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.plugins.Page;
import com.xin.bean.Academy;
import com.xin.commons.utils.PageInfo;
import com.xin.mapper.AcademyMapper;
import com.xin.service.IAcademyService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
@Service
public class AcademyServiceImpl implements IAcademyService {
	
	@Autowired
	private AcademyMapper academymapper;

	@Override
	public boolean deleteById(int id) {
		return academymapper.deleteById(id);
	}

	@Override
	public Academy selectById(int id) {
		return academymapper.selectById(id);
	}

	@Override
	public boolean updateById(Academy academy) {
		return academymapper.updateById(academy);
	}

	@Override
	public boolean insertByid(Academy academy) {
		return academymapper.insertByid(academy);
	}

	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		Page<Academy> page = new Page<>(pageInfo.getNowpage(),pageInfo.getSize());
		List<Academy> list = academymapper.selectPage(page, pageInfo.getCondition());
		pageInfo.setRows(list);
		pageInfo.setTotal(page.getTotal());
	}

	@Override
	public List<Academy> selectAll() {
		return academymapper.selectAll();
	}

	@Override
	public List<Academy> selectByName(String school) {
		return academymapper.selectByName(school);
	}

}
