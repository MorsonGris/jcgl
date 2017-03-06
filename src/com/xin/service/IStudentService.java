package com.xin.service;

import java.util.List;
import com.xin.bean.ApplyType;
import com.xin.bean.Student;
import com.xin.commons.utils.PageInfo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
public interface IStudentService{
	List<Student> selectAll();
	boolean deleteById(int id);
	ApplyType selectById(int id);
	boolean updateById(Student student);
	boolean insertByid(Student student);
	void selectDataGrid(PageInfo pageInfo);
}
