package com.xin.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.xin.commons.utils.PageInfo;
import com.xin.bean.User;
import com.xin.bean.vo.UserVo;

/**
 *
 * User 表数据服务层接口
 *
 */
public interface IUserService extends IService<User> {
	
    List<User> selectByLoginName(UserVo userVo);
    
    List<User> selectByorganizationid(Long id);

    void insertByVo(UserVo userVo);

    UserVo selectVoById(Long id);
    
    UserVo teaLogin(UserVo userVo);

    void updateByVo(UserVo userVo);
    
    UserVo selectByphone(String phone);

    void updatePwdByUserId(Long userId, String md5Hex);

    void selectDataGrid(PageInfo pageInfo);

    void deleteUserById(Long id);
    
    List<User> selectBylist();
    
    void editUserpass(UserVo uservo);
}