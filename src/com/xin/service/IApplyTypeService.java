package com.xin.service;

import com.xin.bean.ApplyType;
import com.xin.commons.utils.PageInfo;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author com.xin
 * @since 2017-02-28
 */
public interface IApplyTypeService extends IService<ApplyType> {
	 void selectDataGrid(PageInfo pageInfo);
}
