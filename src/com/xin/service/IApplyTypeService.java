package com.xin.service;

import com.xin.bean.ApplyType;
import com.xin.commons.utils.PageInfo;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
public interface IApplyTypeService{
	boolean deleteById(int id);
	ApplyType selectById(int id);
	boolean updateById(ApplyType applyType);
	boolean insertByid(ApplyType applyType);
	void selectDataGrid(PageInfo pageInfo);
}
