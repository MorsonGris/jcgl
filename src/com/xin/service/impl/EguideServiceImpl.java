package com.xin.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.plugins.Page;
import com.xin.bean.Eguide;
import com.xin.commons.utils.PageInfo;
import com.xin.mapper.EguideMapper;
import com.xin.service.EguideService;

@Service
public class EguideServiceImpl implements EguideService{
	
	@Autowired
	private EguideMapper eguidemapper;

	@Override
	public String add(Eguide eguide) {
		int result = eguidemapper.add(eguide);
		if(result != 0){
			return "添加成功";
		}
		return "添加失败";
	}

	@Override
	public String update(Eguide eguide) {
		int result = eguidemapper.update(eguide);
		if(result != 0){
			return "修改成功";
		}
		return "修改失败";
	}

	@Override
	public String delete(int id) {
		int result = eguidemapper.delete(id);
		if(result != 0){
			return "删除成功";
		}
		return "删除失败";
	}

	@Override
	public Eguide selectById(int id) {
		return eguidemapper.selectById(id);
	}

	@Override
	public void selectPage(PageInfo pageInfo) {
		Page<Eguide> page = new Page<>();
		List<Eguide> list =eguidemapper.selectpage(page, pageInfo.getCondition());
		pageInfo.setRows(list);
		pageInfo.setTotal(page.getTotal());
	}

}
