package com.xin.mapper;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.xin.bean.HotMajor;

/**
 * @author com.xin
 * @since 2017-02-28
 */
public interface HotMajorMapper {
	List<HotMajor> selectAll();
	HotMajor selectByid(int id);
	boolean updateByid(HotMajor hotMajor);
	boolean deleteByid(int id);
	boolean insertByid(HotMajor hotMajor); 
	List<HotMajor> selectPage(Pagination page, Map<String, Object> params);
}