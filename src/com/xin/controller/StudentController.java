package com.xin.controller;

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
import com.xin.commons.utils.StudentNo;
import com.xin.service.IAcademyService;
import com.xin.service.IStudentService;

/**
 * <p>
 *  成人教育报名
 * </p>
 * @author com.xin
 * @since 2017-02-28
 */
@Controller
@RequestMapping("/student")
public class StudentController extends BaseController{
    
    @Autowired private IStudentService studentService;
    
    @Autowired private IAcademyService academyService;
    
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
    	if(getUserId() != null){
    		map.put("uid", getUserId());
    	}
    	pageInfo.setCondition(map);
    	studentService.selectDataGrid(pageInfo);
    	return pageInfo;
    }
    
    @GetMapping("/addpage")
    public String addpage(Model model){
    	List<Academy> list = academyService.selectAll();
    	model.addAttribute("academy", list);
    	return "admin/student/studentAdd";
    }
    
    @GetMapping("/school")
    @ResponseBody
    public List<Academy> selectschool(int id){
    	Academy schoolName = academyService.selectById(id);
    	List<Academy> shcoollist = academyService.selectByName(schoolName.getASchool());
    	return shcoollist;
    }
    
    /**
     * 添加
     * @param student
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public Object add(Student student){
    	Student stu = studentService.selectByNo();
    	String No = StudentNo.getNo(stu);
    	student.setStudentNo(No);
    	student.setStype(1);
    	boolean result = studentService.insertByid(student);
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
    	boolean result = studentService.deleteById(id);
    	if(result == true){
    		return renderSuccess("删除成功");
    	}
    	return renderError("删除删除失败");
    }
    
    @GetMapping("/editpage")
    public String editpage(Model model,int id){
    	Student student = studentService.selectById(id);
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
