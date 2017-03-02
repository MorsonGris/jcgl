package com.xin.mapper;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.xin.bean.ApplyType;
import com.xin.bean.Student;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
public interface StudentMapper{
	boolean deleteById(int id);
	ApplyType selectById(int id);
	boolean updateById(Student student);
	boolean insertByid(Student student);
	List<Student> selectPage(Pagination page, Map<String, Object> params);
}