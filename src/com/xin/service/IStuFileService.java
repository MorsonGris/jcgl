package com.xin.service;

import com.xin.bean.StuFile;
import com.xin.commons.utils.PageInfo;

import java.util.List;

/**
 * <p>
 *  文件上传接口
 * </p>
 *
 * @author com.xin
 * @since 2017-03-26
 */
public interface IStuFileService{
	
	List<StuFile> selectDataGrid(PageInfo pageInfo);
	
	int stuFileInsert(StuFile stuFile);
	
	StuFile selectStuFileById(int id);
	
	int updateStuFile(StuFile stuFile);
	
	void deleteStuFile(int id);
}
