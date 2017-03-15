package com.xin.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.xin.bean.HomeContent;
import com.xin.commons.utils.PageInfo;
import com.xin.mapper.HomeContentMapper;
import com.xin.service.IHomeContentService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  首页内容类
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
@Service
public class HomeContentServiceImpl implements IHomeContentService {
	
	@Autowired
	private HomeContentMapper homeContentMapper;

	@Override
	public List<HomeContent> selectHomeContentPage(PageInfo pageInfo) {
		Page<HomeContent> page = new Page<HomeContent>(pageInfo.getNowpage(), pageInfo.getPagesize());
		List<HomeContent> list = homeContentMapper.selectHomeContentPage(page, pageInfo.getCondition());
		pageInfo.setRows(list);
		pageInfo.setTotal(page.getTotal());
		return list;
	}

	@Override
	public int HomeContentInsert(HomeContent homeContent) {
		return homeContentMapper.HomeContentInsert(homeContent);
	}

	@Override
	public HomeContent selectHomeContentById(int id) {
		return homeContentMapper.selectHomeContentById(id);
	}

	@Override
	public int updateHomeContent(HomeContent homeContent) {
		return homeContentMapper.updateHomeContent(homeContent);
	}

	@Override
	public void deleteHomeContent(int id) {
		homeContentMapper.deleteHomeContent(id);
	}
	
}
