package com.xin.mapper;

import com.xin.bean.StuFile;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.plugins.pagination.Pagination;

/**
 *
 * @author Mr. Lin
 * @date 2017-3-26
 */
public interface StuFileMapper {
	List<StuFile> selectStuFilePage(Pagination page, Map<String, Object> params);
	
	int stuFileInsert(StuFile stuFile);
	
	StuFile selectStuFileById(int id);
	
	int updateStuFile(StuFile stuFile);
	
	void deleteStuFile(int id);
}