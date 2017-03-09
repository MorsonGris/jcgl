package com.xin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.xin.bean.Academy;
import com.xin.bean.Student;
import com.xin.bean.User;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.PageInfo;
import com.xin.service.DisparkService;
import com.xin.service.IAcademyService;

/**
 * <p>
 *  国家开放报名
 * </p>
 * @author com.xin
 * @since 2017-02-28
 */
@Controller
@RequestMapping("/Dispark")
public class DisparkController extends BaseController{
    
    @Autowired private DisparkService disparkService;
    
    @Autowired private IAcademyService academyService;
    
    @GetMapping("/studentpage")
    public String student(){
    	return "admin/student/dispark";
    }
    
    /**
     * 分页查询
     * @param student
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(Student student,Integer page, Integer rows){
    	PageInfo pageInfo = new PageInfo(page,rows);
    	Map<String,Object> map = new HashMap<String,Object>();
    	if(student.getSName()!= null){
    		//根据姓名查询
    		map.put("name",student.getSName());
    	}
    	if(student.getStudentNo() != null){
    		//根据学号查询
    		map.put("studentNo", student.getStudentNo());
    	}
    	pageInfo.setCondition(map);
    	disparkService.selectDataGrid(pageInfo);
    	return pageInfo;
    }
    
    @GetMapping("/addpage")
    public String addpage(Model model){
    	List<Academy> list = academyService.selectAll();
    	model.addAttribute("academy", list);
    	return "admin/student/disparkAdd";
    }
    
    /**
     * 添加
     * @param student
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public Object add(Student student){
    	Date date = new Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
    	int i = 1;
    	String No = null;
    	if(i<10){
    		No = sdf.format(date)+0+i;
    	}
    	No = sdf.format(date)+i;
    	student.setStudentNo(No);
    	student.setStype(2);
    	boolean result = disparkService.insertByid(student);
    	if(result == true){
    		i++;
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
    	boolean result = disparkService.deleteById(id);
    	if(result == true){
    		return renderSuccess("删除成功");
    	}
    	return renderError("删除删除失败");
    }
    
    @GetMapping("/editpage")
    public String editpage(Model model,int id){
    	Student student = disparkService.selectById(id);
    	List<Academy> academieslist = student.getListAcademy();
    	List<User> studentlsit = student.getListUser();
    	Academy aca = null;
    	User user = null;
    	for(int i=0;i<academieslist.size();i++){
    		aca = academieslist.get(i);
    	}
    	for(int j=0;j<studentlsit.size();j++){
    		 user = studentlsit.get(j);
    	}
    	List<Academy> list = academyService.selectAll();
    	model.addAttribute("academy", list);
    	model.addAttribute("aca", aca);
    	model.addAttribute("user", user);
    	model.addAttribute("student", student);
    	return "admin/student/disparkEdit";
    }
    
    /**
     * 修改
     * @param student
     * @return
     */
    @RequestMapping("edit")
    @ResponseBody
    public Object edit(Student student){
    	boolean result = disparkService.updateById(student);
    	if(result == true){
    		return renderSuccess("修改成功");
    	}
    	return renderError("修改失败");
    }
}
