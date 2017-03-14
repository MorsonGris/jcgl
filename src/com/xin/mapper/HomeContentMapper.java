package com.xin.mapper;

import com.xin.bean.HomeContent;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.plugins.pagination.Pagination;

/**
 *首页内容接口
 * @author com.xin
 * @since 2017-02-28
 */
public interface HomeContentMapper {
	List<HomeContent> selectHomeContentPage(Pagination page, Map<String, Object> params);
	
	int HomeContentInsert(HomeContent homeContent);
	
	HomeContent selectHomeContentById(int id);
	
	int updateHomeContent(HomeContent homeContent);
	
	void deleteHomeContent(int id);
}