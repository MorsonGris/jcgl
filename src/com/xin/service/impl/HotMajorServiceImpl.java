package com.xin.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.plugins.Page;
import com.xin.bean.HotMajor;
import com.xin.commons.utils.PageInfo;
import com.xin.mapper.HotMajorMapper;
import com.xin.service.IHotMajorService;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
@Service
public class HotMajorServiceImpl implements IHotMajorService {
	
	@Autowired private HotMajorMapper hotmajormapper;

	@Override
	public boolean updateByid(HotMajor hotMajor) {
		return hotmajormapper.updateByid(hotMajor);
	}

	@Override
	public boolean deleteByid(int id) {
		return hotmajormapper.deleteByid(id);
	}

	@Override
	public boolean insertByid(HotMajor hotMajor) {
		return hotmajormapper.insertByid(hotMajor);
	}

	@Override
	public void selectPage(PageInfo pageInfo) {
		Page<HotMajor> page = new Page<>(pageInfo.getNowpage(),pageInfo.getPagesize());
		List<HotMajor> list = hotmajormapper.selectPage(page, pageInfo.getCondition());
		pageInfo.setRows(list);
		pageInfo.setTotal(page.getTotal());
	}

	@Override
	public HotMajor selectByid(int id) {
		return hotmajormapper.selectByid(id);
	}

	@Override
	public List<HotMajor> selectAll() {
		return hotmajormapper.selectAll();
	}
	
}
