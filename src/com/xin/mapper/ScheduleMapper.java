package com.xin.mapper;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.xin.bean.Schedule;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
public interface ScheduleMapper{
	List<Schedule> selectAll();
	boolean deleteById(int id);
	Schedule selectById(int id);
	boolean updateById(Schedule schedule);
	boolean insertByid(Schedule schedule);
	List<Schedule> selectPage(Pagination page, Map<String, Object> params);
}