package com.xin.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.plugins.Page;
import com.xin.bean.Student;
import com.xin.commons.utils.PageInfo;
import com.xin.mapper.ArtexamMapper;
import com.xin.service.ArtexamService;

/**
 * @author com.xin
 * @since 2017-02-28
 */
@Service
public class ArtexamServiceImpl implements ArtexamService {
	
	@Autowired
	private  ArtexamMapper artexamMapper;

	@Override
	public boolean deleteById(int id) {
		return artexamMapper.deleteById(id);
	}

	@Override
	public Student selectById(int id) {
		return artexamMapper.selectById(id);
	}

	@Override
	public boolean updateById(Student student) {
		return artexamMapper.updateById(student);
	}

	@Override
	public boolean insertByid(Student student) {
		return artexamMapper.insertByid(student);
	}

	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		Page<Student> page = new Page<>(pageInfo.getNowpage(),pageInfo.getSize());
		List<Student> list = artexamMapper.selectPage(page, pageInfo.getCondition());
		pageInfo.setRows(list);
		pageInfo.setTotal(page.getTotal());
	}

	@Override
	public List<Student> selectAll() {
		return artexamMapper.selectAll();
	}
	
}
