package com.xin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.xin.bean.Student;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.PageInfo;
import com.xin.service.IStudentService;

/**
 * <p>
 *  学生管理
 * </p>
 * @author com.xin
 * @since 2017-02-28
 */
@Controller
@RequestMapping("/student")
public class StudentController extends BaseController{
    
    @Autowired private IStudentService studentService;
    
    @GetMapping("/studentpage")
    public String student(){
    	return "admin/student/student";
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
    	studentService.selectDataGrid(pageInfo);
    	return pageInfo;
    }
    
    @GetMapping("/addpage")
    public String addpage(Model model){
    	return "admin/student/studentAdd";
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
    	boolean result = studentService.insertByid(student);
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
    	boolean result = studentService.deleteById(id);
    	if(result == true){
    		return renderSuccess("删除成功");
    	}
    	return renderError("删除删除失败");
    }
    
    @GetMapping("/editpage")
    public String editpage(){
    	return "admin/student/studentEdit";
    }
    
    /**
     * 修改
     * @param student
     * @return
     */
    @RequestMapping("edit")
    @ResponseBody
    public Object edit(Student student){
    	boolean result = studentService.updateById(student);
    	if(result == true){
    		return renderSuccess("修改成功");
    	}
    	return renderError("修改失败");
    }
}
