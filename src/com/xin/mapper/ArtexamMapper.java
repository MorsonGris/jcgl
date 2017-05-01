package com.xin.mapper;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.xin.bean.Student;

/**
 * @author com.xin
 * @since 2017-02-28
 */
public interface ArtexamMapper{
	List<Student> selectByName(Student sutdent);
	List<Student> selectAll();
	boolean deleteById(String id);
	Student selectById(int id);
	boolean updateById(Student student);
	boolean add(List<Student> list);
	boolean insertByid(Student student);
	List<Student> selectPage(Pagination page, Map<String, Object> params);
}