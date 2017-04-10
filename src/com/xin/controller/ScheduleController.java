package com.xin.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.xin.bean.Schedule;
import com.xin.bean.User;
import com.xin.bean.vo.UserVo;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.PageInfo;
import com.xin.commons.utils.PageJson;
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
   public Object dataGrid(Schedule cSchedule,Integer page, Integer rows, String sort, String order) throws ParseException{
	   PageInfo pageInfo = new PageInfo(page,rows,sort,order);
	   Map<String, Object> map = new HashMap<>();
	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   if(cSchedule.getBegintime() != null){
		   map.put("begin", sdf.format(cSchedule.getBegintime()));
	   }
	   if(cSchedule.getEndtime() != null){
		   map.put("end", sdf.format(cSchedule.getEndtime()));
	   }
	   if(getUserId() != null){
	   	   //只能看到自己添加的工作提醒
	   	   map.put("uid", getUserId());
   		}
	   pageInfo.setCondition(map);
	   scheduleService.selectPage(pageInfo);
	   return pageInfo;
   }
   
   @RequestMapping("/queryBypages")
   @ResponseBody
   public PageJson<Schedule> queryByPages(PageJson<Schedule> pages,HttpServletRequest request){
	   HttpSession ses = request.getSession();
	   UserVo user = (UserVo)ses.getAttribute("user");
	   pages.setRows(scheduleService.queryByPages(user.getId()));
	   pages.setTotal(scheduleService.queryTotal(user.getId()));
	   return pages;
   }
   
   /**
    * 添加页面
    * @return
    */
   @GetMapping("/addpage")
   public String addpage(Model model){
	  model.addAttribute("userid", getUserId());
	  model.addAttribute("username", getStaffName());
	  return "admin/student/scheduleAdd"; 
   }
   
   /**
    * 添加
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
	   boolean result = scheduleService.updateById(cSchedule);
	   if(result == true){
		   return renderSuccess("修改成功");
	   }
	   return renderError("修改失败");
   }
   
   /**
    * 批量修改完成计划
 * @throws ParseException 
    * */
   @PostMapping("/batch_complete")
   @ResponseBody
   public Object batchPay(String ids){
	   	String DATA_IDS = ids;
	   	boolean result = false;
	   	Schedule schedule = new Schedule();
	   	if(null != DATA_IDS && !"".equals(DATA_IDS)){
				String ArrayDATA_IDS[] = DATA_IDS.split(",");
				for(int i=0; i<ArrayDATA_IDS.length; i++) {
					schedule.setSId(Integer.parseInt(ArrayDATA_IDS[i]));
					schedule.setsFlag(1);
					schedule.setsFinishdate(new Date());
					result = scheduleService.updateById(schedule);
				}
	   	}
	   	if(result) {
	   		return renderSuccess("修改成功");
	   	}else {
	   		return renderError("修改失败");
	   	}
   }
}
