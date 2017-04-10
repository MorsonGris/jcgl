package com.xin.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.xin.bean.Schedule;
import com.xin.commons.utils.PageInfo;
import com.xin.commons.utils.PageJson;
import com.xin.mapper.ScheduleMapper;
import com.xin.service.IScheduleService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
@Service
public class ScheduleServiceImpl implements IScheduleService {

	@Autowired
	private ScheduleMapper schedulemapper;
	
	@Override
	public List<Schedule> selectAll() {
		return schedulemapper.selectAll();
	}

	@Override
	public boolean deleteById(int id) {
		return schedulemapper.deleteById(id);
	}

	@Override
	public Schedule selectById(int id) {
		return schedulemapper.selectById(id);
	}

	@Override
	public boolean updateById(Schedule schedule) {
		return schedulemapper.updateById(schedule);
	}

	@Override
	public boolean insertByid(Schedule schedule) {
		schedule.setSDate(new Date());
		return schedulemapper.insertByid(schedule);
	}

	@Override
	public void selectPage(PageInfo pageInfo) {
		Page<Schedule> page = new Page<>(pageInfo.getNowpage(),pageInfo.getSize());
		String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
		List<Schedule> list = schedulemapper.selectPage(page, pageInfo.getCondition());
		pageInfo.setRows(list);
		pageInfo.setTotal(page.getTotal());
	}

	@Override
	public List<Schedule> selectByDate(Schedule schedule) {
		return schedulemapper.selectByDate(schedule);
	}

	@Override
	public List<Schedule> selectByuserId(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Schedule> queryByPages(long uid) {
		return schedulemapper.queryByPages(uid);
	}

	@Override
	public long queryTotal(long uid) {
		PageJson<Schedule> pages=schedulemapper.queryTotal(uid);
		return pages.getTotal();
	}
	
}
