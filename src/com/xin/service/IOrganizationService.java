package com.xin.service;

import java.util.List;
import com.baomidou.mybatisplus.service.IService;
import com.xin.bean.Organization;

/**
 *
 * Organization 表数据服务层接口
 *
 */
public interface IOrganizationService extends IService<Organization> {

    List<Organization> selectTree();

    List<Organization> selectTreeGrid();

}