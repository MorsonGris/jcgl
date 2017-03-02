package com.xin.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xin.bean.Relation;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.PageInfo;
import com.xin.service.IRelationService;

/**
 * @description: 联系方式管理
 * @author: Mr. Lin
 * @date: 2017-03-01
 */
@Controller
@RequestMapping("/relation")
public class RelationController extends BaseController{
    
    @Autowired private IRelationService relationService;
    
    /**
     * 联系管理页
     * @return
     * */
    @GetMapping("/manager")
    public String manager() {
        return "admin/relation/relationManager";
    }
    
    /**
     * 联系管理列表
     *
     * @param userVo
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(Relation rel, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        relationService.selectDataGrid(pageInfo);
        return pageInfo;
    }

    /**
     * 添加联系人页
     *
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "admin/relation/relationAdd";
    }
    
    /**
     * 添加联系人
     *
     * @param Relation
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(Relation relation) {
    	int result = relationService.addRelation(relation);
    	if(result>0) {
    		return renderSuccess("添加成功");
    	}else {
    		return renderSuccess("添加失败");
    	}
    }
    
    /**
     * 编辑用户页
     * 
     * */
    @GetMapping("/editPage")
    public String editPage(Model model, int id){
    	Relation relation = relationService.selectRelationById(id);
    	model.addAttribute("relation", relation);
    	return "admin/relation/relationEdit";
    }
    
    /**
     * 修改联系人
     *
     * @param Relation
     * @return
     */
    /*@PostMapping("/edit")
    @ResponseBody
    public Object edit(Relation relation) {
    	boolean result = relationService.updateById(relation);
    	if(result) {
    		return renderSuccess("添加成功");
    	}else {
    		return renderSuccess("添加失败");
    	}
    }*/
}
