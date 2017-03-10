package com.xin.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.plugins.Page;
import com.xin.bean.Student;
import com.xin.commons.utils.PageInfo;
import com.xin.mapper.BookkeeperMapper;
import com.xin.service.BookkeeperService;

/**
 * @author com.xin
 * @since 2017-02-28
 */
@Service
public class BookkeeperServiceImpl implements BookkeeperService {
	
	@Autowired
	private BookkeeperMapper bookkeeperMapper;

	@Override
	public boolean deleteById(int id) {
		return bookkeeperMapper.deleteById(id);
	}

	@Override
	public Student selectById(int id) {
		return bookkeeperMapper.selectById(id);
	}

	@Override
	public boolean updateById(Student student) {
		return bookkeeperMapper.updateById(student);
	}

	@Override
	public boolean insertByid(Student student) {
		return bookkeeperMapper.insertByid(student);
	}

	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		Page<Student> page = new Page<>(pageInfo.getNowpage(),pageInfo.getSize());
		List<Student> list = bookkeeperMapper.selectPage(page, pageInfo.getCondition());
		pageInfo.setRows(list);
		pageInfo.setTotal(page.getTotal());
	}

	@Override
	public List<Student> selectAll() {
		return bookkeeperMapper.selectAll();
	}
	
}
