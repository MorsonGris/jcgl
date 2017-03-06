package com.xin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xin.bean.Schedule;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.PageInfo;
import com.xin.service.IScheduleService;

/**
 * <p>
 *   前端控制器
 * </p>
 * @author com.xin
 * @since 2017-02-28
 */
@Controller
@RequestMapping("/schedule")
public class ScheduleController extends BaseController{
    
    @Autowired private IScheduleService scheduleService;
    
    @GetMapping("/schedule")
    public String schedule(){
    	return "admin/student/schedule";
    }
    
	/**
	 * 分页查询
	 * @param cSchedule
	 * @param page
	 * @param rows
	 * @return
	 */
   @RequestMapping("/dataGrid")
   @ResponseBody
   public Object dataGrid(Schedule cSchedule,Integer page, Integer rows){
	   PageInfo pageInfo = new PageInfo(page,rows);
	   Map<String, Object> map = new HashMap<>();
	   if(cSchedule.getBegintime() != null){
		   map.put("begin", cSchedule.getBegintime());
	   }
	   if(cSchedule.getEndtime() != null){
		   map.put("end", cSchedule.getEndtime());
	   }
	   pageInfo.setCondition(map);
	   scheduleService.selectPage(pageInfo);
	   return pageInfo;
   }
   
   @GetMapping("/addpage")
   public String addpage(){
	  return "admin/student/"; 
   }
   
   /**
    * 添加页面
    * @param cSchedule
    * @return
    */
   @RequestMapping("/add")
   @ResponseBody
   public Object add(Schedule cSchedule){
	   boolean result = scheduleService.insertByid(cSchedule);
	   if(result == true){
		   return renderSuccess("添加成功");
	   }
	   return renderError("添加失败");
   }
   
   /**
    * 删除
    * @param id
    * @return
    */
   @RequestMapping("/delete")
   @ResponseBody
   public Object delete(int id){
	   boolean result = scheduleService.deleteById(id);
	   if(result == true){
		   return renderSuccess("删除成功");
	   }
	   return renderError("删除失败");
   }
   
   @GetMapping("/editpage")
   public String editpage(){
	   return "admin/student/";
   }
   
   /**
    * 修改
    * @param cSchedule
    * @return
    */
   @RequestMapping("/edit")
   @ResponseBody
   public Object edit(Schedule cSchedule){
	   boolean result = scheduleService.updateById(cSchedule);
	   if(result == true){
		   return renderSuccess("修改成功");
	   }
	   return renderError("修改失败");
   }
    
}
