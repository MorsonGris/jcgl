package com.xin.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.xin.bean.Academy;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
public interface AcademyMapper{
	List<Academy> selectByName(String school);
	List<Academy> selectAll();
	boolean deleteById(int id);
	Academy selectById(int id);
	boolean updateById(Academy academy);
	boolean insertByid(Academy academy);
	List<Academy> selectPage(Pagination page, Map<String, Object> params);
}