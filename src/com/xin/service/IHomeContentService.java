package com.xin.service;

import java.util.List;
import com.xin.bean.HomeContent;
import com.xin.commons.utils.PageInfo;


/**
 * <p>
 *  首页内容类
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
public interface IHomeContentService {
	
	List<HomeContent> selectHomeContentPage(PageInfo pageinfo);
	
	int HomeContentInsert(HomeContent homeContent);
	
	HomeContent selectHomeContentById(int id);
	
	int updateHomeContent(HomeContent homeContent);
	
	void deleteHomeContent(int id);
}
