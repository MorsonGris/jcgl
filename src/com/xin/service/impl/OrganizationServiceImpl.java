package com.xin.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.xin.mapper.OrganizationMapper;
import com.xin.bean.Organization;
import com.xin.service.IOrganizationService;

/**
 *
 * Organization 表数据服务层接口实现类
 *
 */
@Service
public class OrganizationServiceImpl extends ServiceImpl<OrganizationMapper, Organization> implements IOrganizationService {

    @Autowired
    private OrganizationMapper organizationMapper;
    
    @Override
    public List<Organization> selectTree() {
        List<Organization> organizationList = selectTreeGrid();
        return organizationList;
    }

    @Override
    public List<Organization> selectTreeGrid() {
        EntityWrapper<Organization> wrapper = new EntityWrapper<Organization>();
        wrapper.orderBy("seq");
        return organizationMapper.selectList(wrapper);
    }


}