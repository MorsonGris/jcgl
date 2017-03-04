package com.xin.service;

import com.xin.bean.Notice;
import com.xin.bean.Relation;
import com.xin.commons.utils.PageInfo;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
public interface INoticeService{
	
	void selectDataGrid(PageInfo pageInfo);
	
	int noticeInsert(Notice notice);
	
	Notice selectNoticeById(int id);
	
	int updateNotice(Notice notice);
	
	void deleteNotice(int id);
}
