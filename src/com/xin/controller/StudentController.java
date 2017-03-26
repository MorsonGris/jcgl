package com.xin.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xin.bean.Academy;
import com.xin.bean.Finance;
import com.xin.bean.Student;
import com.xin.bean.User;
import com.xin.bean.vo.UserVo;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.CaptchaUtils;
import com.xin.commons.utils.PageInfo;
import com.xin.commons.utils.StudentNo;
import com.xin.service.IAcademyService;
import com.xin.service.IFinanceService;
import com.xin.service.IStudentService;
import com.xin.service.IUserService;

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
    
    @Autowired private IUserService userService;
    
    @Autowired private IFinanceService financeService;
    
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
    		//只能看到自己推荐的学生
    		map.put("uid", getUserId());
    	}
    	pageInfo.setCondition(map);
    	studentService.selectDataGrid(pageInfo);
    	return pageInfo;
    }
    
    /**
     * 分页查询
     * @param student
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/selectDataGrid")
    @ResponseBody
    public Object selectDataGrid(Student student,Integer page, Integer rows){
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
    	if(student.getStype() != null) {
    		if(student.getStype()==1) {
    			map.put("stypeone", 1);
    			map.put("stypetwo", 2);
    			map.put("stypethree", 6);
    			
    		}else{
    			map.put("stypeone", 3);
    			map.put("stypetwo", 4);
    			map.put("stypethree", 5);
    		}
    	}
    	pageInfo.setCondition(map);
    	studentService.selectByStudent(pageInfo);
    	return pageInfo;
    }
    
    @GetMapping("/addpage")
    public String addpage(Model model){
    	List<Academy> list = academyService.selectadult();
    	model.addAttribute("academy", list);
    	return "admin/student/studentAdd";
    }
    
    @GetMapping("/school")
    @ResponseBody
    public Object selectschool(String schoolname){
    	List<Academy> list = academyService.selectByName(schoolname);
    	return list;
    }
    
	@RequestMapping("/validatori")
    @ResponseBody
    public Object validatori(String idNumber){
    	Student student = new Student();
    	if(idNumber != null){
    		student.setIdNumber(idNumber);
    	}
    	Map<String,Object> map = new HashMap<>();
    	List<Student> list = studentService.selectByName(student);
    	Student stu = null;
    	for(int i=0;i<list.size();i++){
    		stu = list.get(i);
    	}
    	if(stu != null){
    		if(stu.getIdNumber()!= null){
        		map.put("valid", false);
        	}
    	}else{
    		map.put("valid", true);
    	}
    	return map;
    }
	
	@RequestMapping("/validatorp")
    @ResponseBody
    public Object validatorp(String sPhone){
    	Student student = new Student();
    	if(sPhone != null){
    		student.setSPhone(sPhone);
    	}
    	Map<String,Object> map = new HashMap<>();
    	List<Student> list = studentService.selectByName(student);
    	Student stu = null;
    	for(int i=0;i<list.size();i++){
    		stu = list.get(i);
    	}
    	if(stu != null){
    		if(stu.getSPhone() != null){
    			map.put("valid", false);
        	}
    	}else{
    		map.put("valid", true);
    	}
    	return map;
    }
    
    /**
     * 添加
     * @param student
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public Object add(Student student,HttpServletRequest request){
    	if(CaptchaUtils.validate(request,student.getCaptcha())){
    		if(student.getCode().equals(student.getScode())){
        		Student stu = studentService.selectByNo();
            	String No = StudentNo.getNo(stu);
            	student.setStudentNo(No);
            	if(student.getSDate() == null){
            		student.setSDate(new Date());
            	}
            	if(student.getUserId()==null){
            		UserVo uservo = new UserVo();
            		uservo.setLoginName("admin");
            		List<User> list = userService.selectByLoginName(uservo);
            		User users = null;
            		for(int i=0;i<list.size();i++){
            			users = list.get(i);
            		}
            		student.setUserId(users.getId());
            	}
            	boolean result = studentService.insertByid(student);
            	if(result == true){
            		return renderSuccess("添加成功");
            	}
            	return renderError("添加失败");
        	}
    		return renderError("短信验证码错误");
    	}
    	return renderError("短信验证码错误");
    }
    
    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(int id){
    	Finance finace = financeService.selectfinanceById(id);
    	if(finace ==null){
    		boolean result = studentService.deleteById(id);
    		if(result == true){
        		return renderSuccess("删除成功");
        	}
    	}
    	return renderError("删除失败");
    }
    
    @GetMapping("/editpage")
    public String editpage(Model model,String type,int id){
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
    	Academy academ = new Academy();
    	if(Integer.valueOf(type) == 2 || Integer.valueOf(type) == 6){
    		academ.setAFlag(2);
    	}else{
    		academ.setAFlag(1);
    	}
    	List<Academy> list = academyService.selectBytype(academ);
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
