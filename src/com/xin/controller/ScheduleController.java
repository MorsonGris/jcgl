package com.xin.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.xin.bean.Schedule;
import com.xin.bean.User;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.PageInfo;
import com.xin.service.IScheduleService;

/**
 * <p>
 *  日程计划
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
	 * @throws ParseException 
	 */
   @RequestMapping("/dataGrid")
   @ResponseBody
   public Object dataGrid(Schedule cSchedule,Integer page, Integer rows) throws ParseException{
	   PageInfo pageInfo = new PageInfo(page,rows);
	   Map<String, Object> map = new HashMap<>();
	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   if(cSchedule.getBegintime() != null){
		   map.put("begin", sdf.format(cSchedule.getBegintime()));
	   }
	   if(cSchedule.getEndtime() != null){
		   map.put("end", sdf.format(cSchedule.getEndtime()));
	   }
	   pageInfo.setCondition(map);
	   scheduleService.selectPage(pageInfo);
	   return pageInfo;
   }
   
   @GetMapping("/addpage")
   public String addpage(){
	  return "admin/student/scheduleAdd"; 
   }
   
   /**
    * 添加页面
    * @param cSchedule
    * @return
    */
   @RequestMapping("/add")
   @ResponseBody
   public Object add(Schedule cSchedule){
	   cSchedule.setsFlag(0);
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
   public String editpage(int id,Model model){
	   Schedule cSchedule = scheduleService.selectById(id);
	   List<User> list = cSchedule.getListUser();
	   User user = null;
	   for(int i=0;i<list.size();i++){
		   user = list.get(i);
	   }
	   model.addAttribute("user", user);
	   model.addAttribute("cSchedule", cSchedule);
	   return "admin/student/scheduleEdit";
   }
   
   /**
    * 修改
    * @param cSchedule
    * @return
    */
   @RequestMapping("/edit")
   @ResponseBody
   public Object edit(Schedule cSchedule){
	   cSchedule.setsFlag(1);
	   boolean result = scheduleService.updateById(cSchedule);
	   if(result == true){
		   return renderSuccess("修改成功");
	   }
	   return renderError("修改失败");
   }
    
}
