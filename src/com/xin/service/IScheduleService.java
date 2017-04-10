package com.xin.service;

import java.util.List;

import com.xin.bean.Schedule;
import com.xin.commons.utils.PageInfo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
public interface IScheduleService{
	List<Schedule> selectByDate(Schedule schedule);
	List<Schedule> selectAll();
	List<Schedule> selectByuserId(long id);
	boolean deleteById(int id);
	Schedule selectById(int id);
	boolean updateById(Schedule schedule);
	boolean insertByid(Schedule schedule);
	void selectPage(PageInfo pageInfo);
	List<Schedule> queryByPages(long uid);
	long queryTotal(long uid);
}
