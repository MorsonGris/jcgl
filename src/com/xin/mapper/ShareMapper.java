package com.xin.mapper;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.xin.bean.Share;

public interface ShareMapper {
	List<Share> selectPage(Pagination page, Map<String, Object> params);
	List<Share> queryall(int id);
	int insert(Share share);
	int update(Share share);
	int delete(int id);
}
