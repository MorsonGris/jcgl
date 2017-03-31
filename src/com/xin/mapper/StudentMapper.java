package com.xin.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.xin.bean.Student;

/**
 * @author com.xin
 * @since 2017-02-28
 */
public interface StudentMapper{
	List<Student> selectByName(Student sutdent);
	Student stuLogin(Student stu);
	Student selectByNo();
	List<Student> selectAll();
	boolean deleteById(int id);
	Student selectById(int id);
	boolean updateById(Student student);
	boolean insertByid(Student student);
	Student selectByStuNo(Student student);
	List<Student> selectPage(Pagination page, Map<String, Object> params);
	List<Student> selectByStudent(Pagination page, Map<String, Object> params);
}