package com.xin.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.plugins.Page;
import com.xin.bean.Student;
import com.xin.commons.utils.PageInfo;
import com.xin.mapper.DisparkMapper;
import com.xin.service.DisparkService;

/**
 * @author com.xin
 * @since 2017-02-28
 */
@Service
public class DisparkServiceImpl implements DisparkService {
	
	@Autowired
	private DisparkMapper disparkMapper;

	@Override
	public boolean deleteById(int id) {
		return disparkMapper.deleteById(id);
	}

	@Override
	public Student selectById(int id) {
		return disparkMapper.selectById(id);
	}

	@Override
	public boolean updateById(Student student) {
		return disparkMapper.updateById(student);
	}

	@Override
	public boolean insertByid(Student student) {
		return disparkMapper.insertByid(student);
	}

	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		Page<Student> page = new Page<>(pageInfo.getNowpage(),pageInfo.getSize());
		List<Student> list = disparkMapper.selectPage(page, pageInfo.getCondition());
		pageInfo.setRows(list);
		pageInfo.setTotal(page.getTotal());
	}

	@Override
	public List<Student> selectAll() {
		return disparkMapper.selectAll();
	}

	@Override
	public List<Student> selectByName(Student sutdent) {
		return disparkMapper.selectByName(sutdent);
	}
	
}
