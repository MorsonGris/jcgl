package com.xin.service;

import com.baomidou.mybatisplus.service.IService;
import com.xin.commons.utils.PageInfo;
import com.xin.bean.SysLog;

/**
 *
 * SysLog 表数据服务层接口
 *
 */
public interface ISysLogService extends IService<SysLog> {

    void selectDataGrid(PageInfo pageInfo);

}