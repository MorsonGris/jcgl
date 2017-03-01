package com.xin.mapper;

import com.xin.bean.ApplyType;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

/**
 * <p>
  *  Mapper 接口
 * </p>
 * @author com.xin
 * @since 2017-02-28
 */
public interface ApplyTypeMapper extends BaseMapper<ApplyType> {
	 List<ApplyType> selectPage(Pagination page, Map<String, Object> params);
}