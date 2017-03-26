package com.xin.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.xin.bean.StuFile;
import com.xin.commons.utils.PageInfo;
import com.xin.mapper.StuFileMapper;
import com.xin.service.IStuFileService;

/**
 * <p>
 *  文件上传实现类
 * </p>
 *
 * @author com.xin
 * @since 2017-03-26
 */
@Service
public class StuFileServiceImpl implements IStuFileService {

	@Autowired 
	private StuFileMapper stuFileMapper;
	
	@Override
	public List<StuFile> selectDataGrid(PageInfo pageInfo) {
		Page<StuFile> page = new Page<StuFile>(pageInfo.getNowpage(), pageInfo.getPagesize());
		String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
		List<StuFile> list = stuFileMapper.selectStuFilePage(page, pageInfo.getCondition());
		pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
        return list;
	}

	@Override
	public int stuFileInsert(StuFile stuFile) {
		stuFile.setSfDate(new Date());
		return stuFileMapper.stuFileInsert(stuFile);
	}

	@Override
	public StuFile selectStuFileById(int id) {
		return stuFileMapper.selectStuFileById(id);
	}

	@Override
	public int updateStuFile(StuFile stuFile) {
		return stuFileMapper.updateStuFile(stuFile);
	}

	@Override
	public void deleteStuFile(int id) {
		stuFileMapper.deleteStuFile(id);
	}

	
}
