package com.xin.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xin.bean.vo.UserVo;
import com.xin.commons.base.BaseController;
import com.xin.commons.csrf.CsrfToken;
import com.xin.commons.utils.CaptchaUtils;
import com.xin.commons.utils.DigestUtils;
import com.xin.commons.utils.StringUtils;
import com.xin.service.IUserService;

@Controller
@RequestMapping("/index")
public class IndexController extends BaseController{
	@Autowired private IUserService userService;
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
		return "proscenium/apply";
	}
	
    /**
	 * 网上学习
	 */
    @GetMapping("/learn")
    public String learn(Model model){
    	model.addAttribute("homeContent", homeContent());
    	return "proscenium/learn";
    }
    
	/**
	 * 招生简章
	 */
	@GetMapping("/eguide")
	public String eguide(){
		return "proscenium/eguide";
	}
	
	/**
	 * 工作助手
	 */ 
	@GetMapping("/helper")
	public String helper(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/helper";
	}
	
	/**
	 * 项目培训
	 */ 
	@GetMapping("/train")
	public String train(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/train";
	}
	
	/**
	 * 缴费查询
	 */ 
	@GetMapping("/payment")
	public String payment(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/payment";
	}
	
	/**
	 * 公告栏
	 */ 
	@GetMapping("/notice")
	public String notice(Model model){
		model.addAttribute("homeContent", homeContent());
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
		return "proscenium/accountant";
	}
	
	/**
	 * 国家开放大学
	 */
	@GetMapping("/country")
	public String country(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/country";
	}
	
	/**
	 * 成人教育
	 */
	@GetMapping("/adult")
	public String adult(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/adult";
	}
	
	
	/**
	 * 艺考培训
	 */
	@GetMapping("art")
	public String art(Model model){
		model.addAttribute("homeContent", homeContent());
		return "proscenium/art";
	}
		
	/**
	 * 国家开放大学
	 */
	@GetMapping("/nation")
	public String nation(Model model){
		model.addAttribute("homeContent", homeContent());
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
		return "proscenium/teacher";
	}
}
