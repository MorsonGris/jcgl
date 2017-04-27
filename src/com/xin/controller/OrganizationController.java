package com.xin.controller;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.xin.bean.Organization;
import com.xin.bean.Role;
import com.xin.bean.User;
import com.xin.commons.base.BaseController;
import com.xin.service.IOrganizationService;
import com.xin.service.IRoleService;
import com.xin.service.IUserService;

/**
 * @description：部门管理
 * @author：zhixuan.wang
 * @date：2015/10/1 14:51
 */
@Controller
@RequestMapping("/organization")
public class OrganizationController extends BaseController {

    @Autowired
    private IOrganizationService organizationService;
    
    @Autowired
    private IRoleService roleservice;
    
    @Autowired
    private IUserService userService;

    /**
     * 部门管理主页
     *
     * @return
     */
    @GetMapping(value = "/manager")
    public String manager() {
        return "admin/organization";
    }


    /**
     * 部门列表
     *
     * @return
     */
    @RequestMapping("/treeGrid")
    @ResponseBody
    public Object treeGrid() {
        return organizationService.selectTreeGrid();
    }

    /**
     * 添加部门页
     *
     * @return
     */
    @RequestMapping("/addPage")
    public String addPage(Model model) {
    	 List<Organization> list = organizationService.selectTree();
    	 List<Role> slist = roleservice.selectTree();
    	 model.addAttribute("list", list);
    	 model.addAttribute("slist", slist);
        return "admin/organizationAdd";
    }

    /**
     * 添加部门
     *
     * @param organization
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public Object add(Organization organization) {
        organization.setCreateTime(new Date());
        if(organization.getPid()==0){
        	organization.setPid(null);
        }
        organizationService.insert(organization);
        return renderSuccess("添加成功！");
    }

    /**
     * 编辑部门页
     *
     * @param request
     * @param id
     * @return
     */
    @GetMapping("/editPage")
    public String editPage(Model model, Long id) {
    	List<Organization> list = organizationService.selectTree();
        Organization organization = organizationService.selectById(id);
        model.addAttribute("organization", organization);
        model.addAttribute("list", list);
        return "admin/organizationEdit";
    }

    /**
     * 编辑部门
     *
     * @param organization
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(Organization organization) {
    	if(organization.getPid()==0){
    		organization.setPid(null);
    	}
        organizationService.updateById(organization);
        return renderSuccess("编辑成功！");
    }

    /**
     * 删除部门
     *
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(Long id) {
    	List<User> list = userService.selectByorganizationid(id);
    	if(list.size()>0){
    		return renderError("该部门下存在用户不能删除");
    	}else{
    		organizationService.deleteById(id);
    	    return renderSuccess("删除成功！");
    	}
    }
}