package com.xin.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.plugins.Page;
import com.xin.bean.Student;
import com.xin.commons.utils.PageInfo;
import com.xin.mapper.StudentMapper;
import com.xin.service.IStudentService;

/**
 * @author com.xin
 * @since 2017-02-28
 */
@Service
public class StudentServiceImpl implements IStudentService {
	
	@Autowired
	private StudentMapper Studentmapper;

	@Override
	public boolean deleteById(int id) {
		return Studentmapper.deleteById(id);
	}

	@Override
	public Student selectById(int id) {
		return Studentmapper.selectById(id);
	}

	@Override
	public boolean updateById(Student student) {
		return Studentmapper.updateById(student);
	}

	@Override
	public boolean insertByid(Student student) {
		return Studentmapper.insertByid(student);
	}

	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		Page<Student> page = new Page<>(pageInfo.getNowpage(),pageInfo.getSize());
		List<Student> list = Studentmapper.selectPage(page, pageInfo.getCondition());
		pageInfo.setRows(list);
		pageInfo.setTotal(page.getTotal());
	}

	@Override
	public List<Student> selectAll() {
		return Studentmapper.selectAll();
	}

	@Override
	public Student selectByNo() {
		return Studentmapper.selectByNo();
	}

	@Override
	public List<Student> selectByStudent(PageInfo pageInfo) {
		Page<Student> page = new Page<>(pageInfo.getNowpage(),pageInfo.getSize());
		List<Student> list = Studentmapper.selectByStudent(page, pageInfo.getCondition());
		pageInfo.setRows(list);
		pageInfo.setTotal(page.getTotal());
		return list;
	}

	@Override
	public List<Student> selectByName(Student student) {
		return Studentmapper.selectByName(student);
	}
	
}
