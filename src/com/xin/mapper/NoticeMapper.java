package com.xin.mapper;

import com.xin.bean.Notice;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.plugins.pagination.Pagination;

/**
 *
 * @author Mr. Lin
 * @date 2017-3-2
 */
public interface NoticeMapper {
	List<Notice> selectNoticePage(Pagination page, Map<String, Object> params);
	
	int noticeInsert(Notice notice);
	
	Notice selectNoticeById(int id);
	
	int updateNotice(Notice notice);
	
	void deleteNotice(int id);
}