package com.xin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xin.bean.Student;
import com.xin.commons.base.BaseController;
import com.xin.service.IStudentService;

/**
 * <p>
 *   前端控制器
 * </p>
 * @author com.xin
 * @since 2017-02-28
 */
@Controller
@RequestMapping("/student")
public class StudentController extends BaseController{
    
    @Autowired private IStudentService studentService;
    
    @GetMapping("/student")
    public String student(){
    	return "";
    }
    
    /**
     * @param student
     * @return
     */
    public Object add(Student student){
    	boolean result = studentService.insertByid(student);
    	if(result == true){
    		return renderSuccess("添加成功");
    	}
    	return renderError("添加失败");
    }
}
