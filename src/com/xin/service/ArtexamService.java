package com.xin.service;

import java.util.List;
import com.xin.bean.Student;
import com.xin.commons.utils.PageInfo;

/**
 * @author com.xin
 * @since 2017-02-28
 */
public interface ArtexamService{
	List<Student> selectByName(Student sutdent);
	List<Student> selectAll();
	boolean deleteById(String id);
	Student selectById(int id);
	boolean updateById(Student student);
	boolean insertByid(Student student);
	boolean add(List<Student> list);
	void selectDataGrid(PageInfo pageInfo);
}
