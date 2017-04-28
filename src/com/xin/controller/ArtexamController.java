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
import com.xin.service.ArtexamService;
import com.xin.service.IAcademyService;
import com.xin.service.IFinanceService;
import com.xin.service.IStudentService;
import com.xin.service.IUserService;

/**
+
 * <p>
 *  艺考培训报名
 * </p>
 * @author com.xin
 * @since 2017-02-28
 */
@Controller
@RequestMapping("/Artexam")
public class ArtexamController extends BaseController{
    
    @Autowired private ArtexamService artexamService;
    
    @Autowired private IAcademyService academyService;
    
    @Autowired private IStudentService studentservice;
    
    @Autowired private IFinanceService financeService;
    
    @Autowired private IUserService userService;
    
    @GetMapping("/studentpage")
    public String student(Model model){
    	List<User> list = userService.selectBylist();
    	model.addAttribute("list",list);
    	return "admin/student/artexam";
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
    	if(student.getSPhone() != null){
    		map.put("phone", student.getSPhone());
    	}
    	if(student.getUserId()!=null && student.getUserId() != 0){
    		map.put("userId", student.getUserId());
    	}
    	if(student.getStype()!=null && student.getStype() != 0){
    		map.put("type", student.getStype());
    	}
    	if(student.getCreatedateStart()!= null){
    		map.put("start", student.getCreatedateStart());
    	}
    	if(student.getCreatedateEnd()!=null){
    		map.put("end", student.getCreatedateEnd());
    	}
    	pageInfo.setCondition(map);
    	artexamService.selectDataGrid(pageInfo);
    	return pageInfo;
    }
    
    @RequestMapping("/validatori")
    @ResponseBody
    public Object validatori(String idNumber){
    	Student student = new Student();
    	if(idNumber != null){
    		student.setIdNumber(idNumber);
    	}
    	Map<String,Object> map = new HashMap<>();
    	List<Student> list = artexamService.selectByName(student);
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
    	List<Student> list = artexamService.selectByName(student);
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
    
    @GetMapping("/addpage")
    public String addpage(Model model){
    	List<Academy> list = academyService.selectnation();
    	model.addAttribute("academy", list);
    	return "admin/student/artexamAdd";
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
        		Student stu = studentservice.selectByNo();
            	String No = StudentNo.getNo(stu);
            	student.setStudentNo(No);
            	if(student.getSDate() == null){
            		student.setSDate(new Date());
            	}
            	if(student.getUserId() == null){
            		UserVo uservo = new UserVo();
            		uservo.setLoginName("admin");
            		List<User> list = userService.selectByLoginName(uservo);
            		User users = null;
            		for(int i=0;i<list.size();i++){
            			users = list.get(i);
            		}
            		student.setUserId(users.getId());
            	}
            	boolean result = artexamService.insertByid(student);
            	if(result == true){
            		return renderSuccess("添加成功");
            	}
            	return renderError("添加失败");	
    		}
    		return renderError("短信验证码错误");
    	}
    	return renderError("短信验证码错误");
    }
    
    @RequestMapping("/adda")
    @ResponseBody
    public Object adda(Student student,HttpServletRequest request){
		Student stu = studentservice.selectByNo();
    	String No = StudentNo.getNo(stu);
    	student.setStudentNo(No);
    	if(student.getUserId() == null){
    		UserVo uservo = new UserVo();
    		uservo.setLoginName("admin");
    		List<User> list = userService.selectByLoginName(uservo);
    		User users = null;
    		for(int i=0;i<list.size();i++){
    			users = list.get(i);
    		}
    		student.setUserId(users.getId());
    	}
    	if(student.getSDate() == null){
    		student.setSDate(new Date());
    	}
    	boolean result = artexamService.insertByid(student);
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
    	Finance finace = financeService.selectfinanceById(id);
    	if(finace ==null){
    	boolean result = artexamService.deleteById(id);
	    	if(result == true){
	    		return renderSuccess("删除成功");
	    	}
    	}
    	return renderError("该学生应经缴纳学费，删除失败");
    }
    
    @GetMapping("/editpage")
    public String editpage(Model model,int id){
    	Student student = artexamService.selectById(id);
    	List<User> studentlsit = student.getListUser();
    	User user = null;
    	for(int j=0;j<studentlsit.size();j++){
    		 user = studentlsit.get(j);
    	}
    	model.addAttribute("user", user);
    	model.addAttribute("student", student);
    	return "admin/student/artexamEdit";
    }
    
    /**
     * 修改
     * @param student
     * @return
     */
    @RequestMapping("edit")
    @ResponseBody
    public Object edit(Student student){
    	boolean result = artexamService.updateById(student);
    	if(result == true){
    		return renderSuccess("修改成功");
    	}
    	return renderError("修改失败");
    }
}
