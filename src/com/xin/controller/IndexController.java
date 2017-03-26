package com.xin.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xin.bean.Relation;
import com.xin.bean.vo.UserVo;
import com.xin.commons.base.BaseController;
import com.xin.commons.csrf.CsrfToken;
import com.xin.commons.utils.CaptchaUtils;
import com.xin.commons.utils.DigestUtils;
import com.xin.commons.utils.PageInfo;
import com.xin.commons.utils.StringUtils;
import com.xin.service.IRelationService;
import com.xin.service.IUserService;

@Controller
@RequestMapping("/index")
public class IndexController extends BaseController{
	@Autowired private IUserService userService;
	@Autowired private IRelationService relationService;
	/**
	 * 前台登录
	 */
	@GetMapping("/login")
	public String login(){
		return "proscenium/login";
	}
	@RequestMapping("/homeLogin")
    @CsrfToken(remove = true)
    @ResponseBody
    public Map<String,Object> homeLogin(HttpServletRequest request,String phone,String password,String captcha,HttpSession sion) {
		Map<String,Object> resultMap = new HashMap<String, Object>();
        // 改为全部抛出异常，避免ajax csrf token被刷新
        if (StringUtils.isBlank(phone)) {
        	resultMap.put("result", "手机号码不能为空");
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
        UserVo login = new UserVo(phone,  DigestUtils.md5Hex(password));
        UserVo user = userService.homeLogin(login);
        if(user==null){
        	resultMap.put("result", "账户密码错误");
            return resultMap;
        }
        sion.setAttribute("user", user);
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
		return "proscenium/eguide";
	}
	
	/**
	 * 学院简介
	 */
	@RequestMapping("/s1")
	public String s1(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s1";
	}
	@RequestMapping("/s2")
	public String s2(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s2";
	}
	@RequestMapping("/s3")
	public String s3(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s3";
	}
	@RequestMapping("/s4")
	public String s4(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s4";
	}
	@RequestMapping("/s5")
	public String s5(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s5";
	}
	
	@RequestMapping("/s6")
	public String s6(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s6";
	}
	@RequestMapping("/s7")
	public String s7(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s7";
	}
	@RequestMapping("/s8")
	public String s8(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s8";
	}
	@RequestMapping("/s9")
	public String s9(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s9";
	}
	@RequestMapping("/s10")
	public String s10(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s10";
	}
	@RequestMapping("/s11")
	public String s11(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s11";
	}
	@RequestMapping("/s12")
	public String s12(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s12";
	}
	@RequestMapping("/s13")
	public String s13(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s13";
	}
	@RequestMapping("/s14")
	public String s14(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s14";
	}
	@RequestMapping("/s15")
	public String s15(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s15";
	}
	@RequestMapping("/s16")
	public String s16(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s16";
	}
	@RequestMapping("/s17")
	public String s17(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s17";
	}
	@RequestMapping("/s18")
	public String s18(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s18";
	}
	@RequestMapping("/s19")
	public String s19(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s19";
	}
	@RequestMapping("/s20")
	public String s20(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/school/s20";
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
	 * 项目培训
	 */ 
	@GetMapping("/train")
	public String train(Model model){
		model.addAttribute("homeContent", homeContent());
		PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
		return "proscenium/train";
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
}
