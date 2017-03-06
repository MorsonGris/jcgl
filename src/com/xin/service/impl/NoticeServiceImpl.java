package com.xin.service.impl;

import com.xin.bean.Notice;
import com.xin.commons.utils.PageInfo;
import com.xin.mapper.NoticeMapper;
import com.xin.service.INoticeService;
import com.baomidou.mybatisplus.plugins.Page;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
@Service
public class NoticeServiceImpl implements INoticeService {
	
	@Autowired 
	private NoticeMapper noticeMapper;
	
	@Override
	public void selectDataGrid(PageInfo pageInfo) {
		Page<Notice> page = new Page<Notice>(pageInfo.getNowpage(), pageInfo.getPagesize());
		String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
		List<Notice> list = noticeMapper.selectNoticePage(page, pageInfo.getCondition());
		pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}

	@Override
	public int noticeInsert(Notice notice) {
		notice.setNDate(new Date());
		return noticeMapper.noticeInsert(notice);
	}

	@Override
	public Notice selectNoticeById(int id) {
		return noticeMapper.selectNoticeById(id);
	}

	@Override
	public int updateNotice(Notice notice) {
		return noticeMapper.updateNotice(notice);
	}

	@Override
	public void deleteNotice(int id) {
		noticeMapper.deleteNotice(id);
	}

}
