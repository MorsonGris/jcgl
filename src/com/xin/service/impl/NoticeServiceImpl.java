package com.xin.service.impl;

import com.xin.bean.Notice;
import com.xin.commons.utils.PageInfo;
import com.xin.commons.utils.PageJson;
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
	public List<Notice> selectDataGrid(PageInfo pageInfo) {
		Page<Notice> page = new Page<Notice>(pageInfo.getNowpage(), pageInfo.getPagesize());
		String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
		List<Notice> list = noticeMapper.selectNoticePage(page, pageInfo.getCondition());
		pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
        return list;
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

	@Override
	public List<Notice> queryByPages(String search, int offset, int limit) {
		return noticeMapper.queryByPages(search, offset, limit);
	}

	@Override
	public long queryTotal(String search) {
		PageJson<Notice> pages=noticeMapper.queryTotal(search);
		return pages.getTotal();
	}

}
