package com.xin.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.xin.bean.Share;
import com.xin.commons.utils.PageInfo;
import com.xin.mapper.ShareMapper;
import com.xin.service.ShareService;

@Service
public class ShareServiceImpl implements ShareService{
	
	@Autowired private ShareMapper ShareMapper;
	
	@Override
	public void selectPage(PageInfo pageInfo) {
		Page<Share> page = new Page<>(pageInfo.getNowpage(),pageInfo.getSize());
		List<Share> list = ShareMapper.selectPage(page, pageInfo.getCondition());
		pageInfo.setRows(list);
		pageInfo.setTotal(page.getTotal());
	}

	@Override
	public Share queryById(int id) {
		return ShareMapper.queryById(id);
	}

	@Override
	public int insert(Share share) {
		return ShareMapper.insert(share);
	}

	@Override
	public int update(Share share) {
		return ShareMapper.update(share);
	}

	@Override
	public int delete(int id) {
		return ShareMapper.delete(id);
	}

	@Override
	public List<Share> selectAll() {
		return ShareMapper.selectAll();
	}

}
