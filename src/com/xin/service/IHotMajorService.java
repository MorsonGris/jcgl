package com.xin.service;

import java.util.List;

import com.xin.bean.HotMajor;
import com.xin.commons.utils.PageInfo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
public interface IHotMajorService {
	List<HotMajor> selectAll();
	HotMajor selectByid(int id);
	boolean updateByid(HotMajor hotMajor);
	boolean deleteByid(int id);
	boolean insertByid(HotMajor hotMajor); 
	void selectPage(PageInfo pageInfo);
}
