package com.xin.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.xin.bean.ApplyType;

/**
 * <p>
  *  Mapper 接口
 * </p>
 * @author com.xin
 * @since 2017-02-28
 */
public interface ApplyTypeMapper{
	boolean deleteById(int id);
	ApplyType selectById(int id);
	boolean updateById(ApplyType applyType);
	boolean insertByid(ApplyType applyType);
	List<ApplyType> selectPage(Pagination page, Map<String, Object> params);
}