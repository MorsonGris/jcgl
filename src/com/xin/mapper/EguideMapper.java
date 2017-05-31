package com.xin.mapper;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.xin.bean.Eguide;

public interface EguideMapper {
	int add(Eguide eguide);
	int update(Eguide eguide);
	int delete(int id);
	Eguide selectById(int id);
	List<Eguide> selectpage(Pagination page, Map<String, Object> params);
	List<Eguide> selectlist();
}
