package com.xin.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.xin.bean.Eguide;
import com.xin.bean.Relation;
import com.xin.bean.Share;
import com.xin.bean.Student;
import com.xin.bean.vo.UserVo;
import com.xin.commons.base.BaseController;
import com.xin.commons.csrf.CsrfToken;
import com.xin.commons.utils.CaptchaUtils;
import com.xin.commons.utils.DigestUtils;
import com.xin.commons.utils.FileUpload;
import com.xin.commons.utils.PageInfo;
import com.xin.commons.utils.PathUtil;
import com.xin.commons.utils.StringUtils;
import com.xin.service.EguideService;
import com.xin.service.IRelationService;
import com.xin.service.IStudentService;
import com.xin.service.IUserService;
import com.xin.service.ShareService;

@Controller
@RequestMapping("/index")
public class IndexController extends BaseController{
	@Autowired private IUserService userService;
	@Autowired private IStudentService studentService;
	@Autowired private ShareService shareservice;
	@Autowired private EguideService eguideservice;
	@Autowired private IRelationService relationService;
	/**
	 * 前台登录
	 */
	@GetMapping("/teaLogin")
	public String teaLogin(){
		return "proscenium/teaLogin";
	}
	@GetMapping("/stuLogin")
	public String stuLogin(){
		return "proscenium/stuLogin";
	}
	
	@RequestMapping("/teaHome")
    @CsrfToken(remove = true)
    @ResponseBody
    public Map<String,Object> teaHome(HttpServletRequest request,String name,String password,String captcha,HttpSession sion) {
		Map<String,Object> resultMap = new HashMap<String, Object>();
        if (StringUtils.isBlank(name)) {
        	resultMap.put("result", "用户名不能为空");
            return resultMap;
        }
        if (StringUtils.isBlank(password)) {
        	resultMap.put("result", "密码不能为空");
            return resultMap;
        }
        if (StringUtils.isBlank(captcha)) {
        	resultMap.put("result", "验证码不能为空");
            return resultMap;
        }
        if (!CaptchaUtils.validate(request, captcha)) {
        	resultMap.put("result", "验证码错误");
            return resultMap;
        }
        UserVo login = new UserVo(name,  DigestUtils.md5Hex(password));
        UserVo user = userService.teaLogin(login);
        if(user==null){
        	resultMap.put("result", "账户密码错误");
            return resultMap;
        }
        sion.setAttribute("user", user);
        resultMap.put("result", true);
        return resultMap;
    }
	
	@RequestMapping("/stuHome")
    @CsrfToken(remove = true)
    @ResponseBody
    public Map<String,Object> stuHome(HttpServletRequest request,String name,String password,String captcha,HttpSession sion) {
		Map<String,Object> resultMap = new HashMap<String, Object>();
        if (StringUtils.isBlank(name)) {
        	resultMap.put("result", "姓名不能为空");
            return resultMap;
        }
        if (StringUtils.isBlank(password)) {
        	resultMap.put("result", "密码不能为空");
            return resultMap;
        }
        if (StringUtils.isBlank(captcha)) {
        	resultMap.put("result", "验证码不能为空");
            return resultMap;
        }
        if (!CaptchaUtils.validate(request, captcha)) {
        	resultMap.put("result", "验证码错误");
            return resultMap;
        }
        Student login = new Student(name,  password);
        Student stu = studentService.stuLogin(login);
        if(stu==null){
        	resultMap.put("result", "账户密码错误");
            return resultMap;
        }
        sion.setAttribute("stu", stu);
        resultMap.put("result", true);
        return resultMap;
    }
	@GetMapping("/loginout")
	public String loginout(HttpServletRequest request){
		  Enumeration<String> en=request.getSession().getAttributeNames();
		  while(en.hasMoreElements()){//判断是否还有下一个元素
			  //除移所有session   
			  request.getSession().removeAttribute(en.nextElement().toString());
		  }
		  return "redirect:"+"/index";
	}
	
	/**
	 * 我的账户
	 */
	@GetMapping("/account")
	public String account(){
		return "proscenium/account";
	}
	
	/**
	 * 帮助中心
	 */ 
	@GetMapping("/help")
	public String help(){
		return "proscenium/help";
	}
	
	/**
	 * 学生报名
	 */
	@GetMapping("/apply")
	public String apply(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/apply";
	}
	
    /**
	 * 网上学习
	 */
    @GetMapping("/learn")
    public String learn(Model model){
    	model.addAttribute("homeContent", homeContent());
    	PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
    	return "proscenium/learn";
    }
    
	/**
	 * 招生简章
	 */
	@GetMapping("/eguide")
	public String eguide(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
    	List<Eguide> eguidelist = eguideservice.selectlist();
    	model.addAttribute("eguidelist",eguidelist);
		return "proscenium/eguide";
	}
	
	@RequestMapping("/Eguidepage")
	public String Eguidepage(){
		return "admin/eguide";
	}
	/**
	 * 招生简章添加
	 * @param eguide
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("/Eguideadd")
	@ResponseBody
	public Object Eguideadd(
			@RequestParam(value="title",required=false)String title,
			@RequestParam(value="school",required=false)String school,
			@RequestParam(value="type",required=false)String type,
			@RequestParam(value="log",required=false)MultipartFile log,
			@RequestParam(value="picture1",required=false)MultipartFile picture1,
			@RequestParam(value="picture2",required=false)MultipartFile picture2,
			@RequestParam(value="picture3",required=false)MultipartFile picture3,
			HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException{
		FileUpload.pictureUpload(request, response,"",PathUtil.getClasspath()+"static/proscenium/images/");
		Eguide eguide = new Eguide();
		if(log.getOriginalFilename() != null){
			eguide.setLog(log.getOriginalFilename());
		}
		if(picture1.getOriginalFilename() !=null){
			eguide.setPicture1(picture1.getOriginalFilename());
		}
		if(picture2.getOriginalFilename() !=null){
			eguide.setPicture2(picture2.getOriginalFilename());
		}
		if(picture3.getOriginalFilename() !=null){
			eguide.setPicture3(picture3.getOriginalFilename());
		}
		eguide.setSchool(school);
		eguide.setTitle(title);
		eguide.setType(type);
		String result =  eguideservice.add(eguide);
		if(result.equals("添加成功")){
			return renderSuccess();
		}
		return renderError("添加失败");
	}
	
	@RequestMapping("/Eguideaddpage")
	public String Eguideaddpage(){
		return "admin/eguideadd";
	}
	
	/**
	 * 招生简章删除
	 * @param id
	 * @return
	 */
	@RequestMapping("/Eguidedelete")
	@ResponseBody
	public Object Eguidedelete(int id){
		String result = eguideservice.delete(id);
		if(result.equals("删除成功")){
			return renderSuccess("删除成功");
		}
		return renderError("删除失败");
	}
	
	/**
	 * 招生简章修改
	 * @param eguide
	 * @return
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@RequestMapping("/Eguideupdate")
	@ResponseBody
	public Object Eguideupdate(@RequestParam(value="title",required=false)String title,
			@RequestParam(value="id",required=false)int id,
			@RequestParam(value="school",required=false)String school,
			@RequestParam(value="type",required=false)String type,
			@RequestParam(value="log",required=false)MultipartFile log,
			@RequestParam(value="picture1",required=false)MultipartFile picture1,
			@RequestParam(value="picture2",required=false)MultipartFile picture2,
			@RequestParam(value="picture3",required=false)MultipartFile picture3,
			HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException{
		FileUpload.pictureUpload(request, response,"",PathUtil.getClasspath()+"static/proscenium/images/");
		Eguide eguide = new Eguide();
		if(log.getOriginalFilename() != null){
			eguide.setLog(log.getOriginalFilename());
		}
		if(picture1.getOriginalFilename() !=null){
			eguide.setPicture1(picture1.getOriginalFilename());
		}
		if(picture2.getOriginalFilename() !=null){
			eguide.setPicture2(picture2.getOriginalFilename());
		}
		if(picture3.getOriginalFilename() !=null){
			eguide.setPicture3(picture3.getOriginalFilename());
		}
		eguide.setSchool(school);
		eguide.setTitle(title);
		eguide.setType(type);
		eguide.setId(id);
		String result = eguideservice.update(eguide);
		if(result.equals("修改成功")){
			return renderSuccess("修改成功");
		}
		return renderError("修改失败");
	}
	
	@RequestMapping("/Eguideupdatepage")
	public String Eguideupdatepage(int id,Model model){
		Eguide eguide = eguideservice.selectById(id);
		model.addAttribute("eguide",eguide);
		return "admin/eguideupdate";
	}
	
	/**
	 * 招生简章分页查询
	 * @param eguide
	 * @param rows
	 * @param page
	 * @return
	 */
	@RequestMapping("/selectPage")
	@ResponseBody
	public Object selectPage(Eguide eguide,Integer rows,Integer page){
		PageInfo pageInfo = new PageInfo(rows,page);
		eguideservice.selectPage(pageInfo);
		return pageInfo;
	}
	
	/**
	 * 学院简介
	 */
	@RequestMapping("/s1")
	public String s1(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s1";
	}
	@RequestMapping("/s2")
	public String s2(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s2";
	}
	@RequestMapping("/s3")
	public String s3(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s3";
	}
	@RequestMapping("/s4")
	public String s4(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s4";
	}
	@RequestMapping("/s5")
	public String s5(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s5";
	}
	
	@RequestMapping("/s6")
	public String s6(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s6";
	}
	@RequestMapping("/s7")
	public String s7(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s7";
	}
	@RequestMapping("/s8")
	public String s8(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s8";
	}
	@RequestMapping("/s9")
	public String s9(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s9";
	}
	@RequestMapping("/s10")
	public String s10(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s10";
	}
	@RequestMapping("/s11")
	public String s11(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s11";
	}
	@RequestMapping("/s12")
	public String s12(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s12";
	}
	@RequestMapping("/s13")
	public String s13(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s13";
	}
	@RequestMapping("/s14")
	public String s14(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s14";
	}
	@RequestMapping("/s15")
	public String s15(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s15";
	}
	@RequestMapping("/s16")
	public String s16(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s16";
	}
	@RequestMapping("/s17")
	public String s17(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s17";
	}
	@RequestMapping("/s18")
	public String s18(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s18";
	}
	@RequestMapping("/s19")
	public String s19(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s19";
	}
	@RequestMapping("/s20")
	public String s20(Model model,int id){
		model.addAttribute("homeContent", homeContent());
		Eguide eguidie = eguideservice.selectById(id);
		model.addAttribute("eguidie",eguidie);
		return "proscenium/school/s20";
	}
	
	/**
	 * 考证简介
	 */
	@RequestMapping("/p1")
	public String p1(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/profession/p1";
	}
	@RequestMapping("/p2")
	public String p2(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/profession/p2";
	}
	@RequestMapping("/p3")
	public String p3(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/profession/p3";
	}
	@RequestMapping("/p4")
	public String p4(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/profession/p4";
	}
	@RequestMapping("/p5")
	public String p5(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/profession/p5";
	}
	
	@RequestMapping("/p6")
	public String p6(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/profession/p6";
	}
	@RequestMapping("/p7")
	public String p7(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/profession/p7";
	}
	@RequestMapping("/p8")
	public String p8(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/profession/p8";
	}
	@RequestMapping("/p9")
	public String p9(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/profession/p9";
	}
	@RequestMapping("/p10")
	public String p10(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/profession/p10";
	}
	
	/**
	 * 工作助手
	 */ 
	@GetMapping("/helper")
	public String helper(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/helper";
	}
	
	/**
	 * 工作助手
	 */ 
	@GetMapping("/upload")
	public String upload(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/upload";
	}
	
	/**
	 * 培训管理
	 */ 
	@GetMapping("/train")
	public String train(Model model){
		List<Share> listShare = shareservice.selectAll();
		model.addAttribute("listShare", listShare);
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/education";
	}
	
	/**
	 * 职业资格培训
	 */ 
	@GetMapping("/jobTrain")
	public String jobTrain(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/jobTrain";
	}
	
	/**
	 * 缴费查询
	 */ 
	@GetMapping("/payment")
	public String payment(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/payment";
	}
	
	/**
	 * 公告栏
	 */ 
	@GetMapping("/notice")
	public String notice(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/notice";
	}
	
	/**
	 * 所有专业
	 */ 
	@GetMapping("/major")
	public String major(){
		return "proscenium/major";
	}
	
	/**
	 * 会计培训
	 */
	@GetMapping("/accountant")
	public String accountant(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/accountant";
	}
	
	/**
	 * 国家开放大学
	 */
	@GetMapping("/country")
	public String country(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/country";
	}
	
	/**
	 * 成人教育
	 */
	@GetMapping("/adult")
	public String adult(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/adult";
	}
	
	
	/**
	 * 艺考培训
	 */
	@GetMapping("art")
	public String art(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/art";
	}
		
	/**
	 * 国家开放大学
	 */
	@GetMapping("/nation")
	public String nation(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/nation";
	}
	
	/**
	 * 职业培训
	 */
	@GetMapping("/profession")
	public String profession(){
		return "proscenium/profession";
	}
	
	/**
	 * 教师资格证
	 */
	@GetMapping("/teacher")
	public String teacher(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/teacher";
	}
	
	/**
	 * 会计缴费
	 */
	@GetMapping("/accountingcost")
	public String accountingcost(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/finance/accountingcost";
	}
	
	/**
	 * 艺考缴费
	 */
	@GetMapping("/artcost")
	public String artcost(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/finance/artcost";
	}
	
	/**
	 * 资格证缴费
	 */
	@GetMapping("/certificationcost")
	public String certificationcost(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/finance/certificationcost";
	}
	
   /**
    * 首页工作助手
    * */
   @GetMapping("/workAssistant")
   public String selectMore(Model model) {
   	model.addAttribute("homeContent", homeContent());
   	return "proscenium/work_assistant";
   }
   
   /**
	 *共享合作内容
	 */
	@GetMapping("/share_content")
	public String share_content(String id,Model model){
		Share list = shareservice.queryById(Integer.parseInt(id));
		model.addAttribute("share",list);
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
	   	List<Relation> relation = relationService.selectDataGrid(pi);
	   	model.addAttribute("relation", relation);
		return "proscenium/share";
	}
}
