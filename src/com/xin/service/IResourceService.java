package com.xin.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.xin.commons.result.Tree;
import com.xin.commons.shiro.ShiroUser;
import com.xin.bean.Resource;

/**
 *
 * Resource 表数据服务层接口
 *
 */
public interface IResourceService extends IService<Resource> {

    List<Resource> selectAll();

    List<Tree> selectAllMenu();

    List<Tree> selectAllTree();

    List<Tree> selectTree(ShiroUser shiroUser);

}