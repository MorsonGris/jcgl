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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.xin.bean.Academy;
import com.xin.bean.Finance;
import com.xin.bean.Student;
import com.xin.bean.User;
import com.xin.bean.vo.UserVo;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.CaptchaUtils;
import com.xin.commons.utils.FileUpload;
import com.xin.commons.utils.ObjectExcelRead;
import com.xin.commons.utils.PageInfo;
import com.xin.commons.utils.PathUtil;
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
    
    @GetMapping("/addallpage")
    public String addallpage(){
    	return "admin/student/artexamAdd1";
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
     * EXCEL文件上传
     * @param file
     * @param student
     * @return
     * */
    @SuppressWarnings({ "unchecked", "rawtypes"})
    @RequestMapping("/addall")
    @ResponseBody
    public Object addall(@RequestParam(value="artexamexcel",required=false) MultipartFile file){
    	Student student = new Student();
    	boolean restult = false;
    	if(null != file && !file.isEmpty()){
    		Student student = new Student();
    		String filePath = PathUtil.getClasspath() + "uploadFile/file/";//文件上传路径
			String fileName = FileUpload.fileUp(file, filePath, "artexamExcel");//文件名称
			List<Map<String,Object>> listm = (List)ObjectExcelRead.readExcel(filePath, fileName, 2, 0, 0);  //执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
			int n = 0;
			for(int i=0;i<listm.size();i++){
				System.out.println("************");
				if(listm.get(i).get("var0") != null && !listm.get(i).get("var0").equals("")) {
					Student stu = studentservice.selectByNo();
					String No = StudentNo.getNo(stu);
					if(listm.size()>0){
						student.setStudentNo(No+n);//学号
						n++;
					}
			    	student.setSName(listm.get(i).get("var0").toString());//学生姓名
			    	UserVo uservo = userService.selectByphone(listm.get(i).get("var4").toString());
			    	student.setUserId(uservo.getId());//老师
			    	student.setSPhone(listm.get(i).get("var1").toString());//手机号码
			    	if(listm.get(i).get("var2").toString().equals("艺考")){//报考类型
			    		student.setStype(3);
			    	}else if(listm.get(i).get("var2").toString().equals("会计")){
			    		student.setStype(4);
			    	}else if(listm.get(i).get("var2").toString().equals("职业资格")){
			    		student.setStype(5);
			    	}
			    	student.setSContent(listm.get(i).get("var3").toString());//学习内容
			    	student.setSDate(new Date());//报考时间
			    	restult = artexamService.insertByid(student);
			    	
				}
			}
    	}
    	if(restult == true){
    		return renderSuccess("添加成功");
    	}else {
    		return renderError("修改失败");
    	}
    }
    
   
    
    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(String id){
    	Finance finace = financeService.selectBystuno(id);
    	if(finace != null){
    		return renderError("该学生应经缴纳学费，删除失败");
    	}
    	artexamService.deleteById(id);
    	return renderSuccess("删除成功");
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
