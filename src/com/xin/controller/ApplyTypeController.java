package com.xin.controller;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.xin.bean.ApplyType;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.PageInfo;
import com.xin.service.IApplyTypeService;

/**
 * <p>
 *  报名分类
 * </p> 
 * @author com.xin
 * @since 2017-02-28
 */
@Controller
@RequestMapping("/applyType")
public class ApplyTypeController extends BaseController{
    
    @Autowired private IApplyTypeService applyTypeService;
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addpage")
    public String addpage(){
    	return "student/applyTypeAdd";
    }
    
    /**
     * @param applyType
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public Object add(ApplyType applyType){
    	applyTypeService.insert(applyType);
    	return renderSuccess("添加成功");
    }
    
    /**
     * @param applyType
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(ApplyType applyType){
    	applyTypeService.deleteById(applyType);
    	return renderSuccess("删除成功");
    }
    
    /**
     * 分页查询
     * @param applyType
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(ApplyType applyType,Integer page, Integer rows){
    	PageInfo pageInfo = new PageInfo(page,rows);
    	Map<String,Object> map = new HashMap<String,Object>();
    	if(applyType.getAtName() != null){
    		map.put("name", applyType.getAtName());
    	}
    	pageInfo.setCondition(map);
    	applyTypeService.selectDataGrid(pageInfo);
    	return pageInfo;
    }
    
    /**
     * 修改页面
     * @param modelAndView
     * @param id
     * @return
     */
    @GetMapping("/editpage")
    public String edit(ModelAndView modelAndView, int id){
    	ApplyType applyType = applyTypeService.selectById(id);
    	modelAndView.addObject("applyType", applyType);
    	return "student/applyTypeEdit";
    }
    
    /**
     * @param applyType
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(ApplyType applyType){
    	applyTypeService.updateById(applyType);
    	return renderSuccess("修改成功");
    }
}
