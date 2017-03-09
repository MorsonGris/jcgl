package com.xin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class IndexController {
	
	/**
	 * 前台登录
	 */
	@GetMapping("/login")
	public String login(){
		return "proscenium/login";
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
	public String apply(){
		return "proscenium/apply";
	}
	
    /**
	 * 网上学习
	 */
    @GetMapping("/learn")
    public String learn(){
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
	public String helper(){
		return "proscenium/helper";
	}
	
	/**
	 * 公告栏
	 */ 
	@GetMapping("/notice")
	public String notice(){
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
	public String accountant(){
		return "proscenium/accountant";
	}
	
	/**
	 * 成人教育
	 */
	@GetMapping("/adult")
	public String adult(){
		return "proscenium/adult";
	}
	
	
	/**
	 * 艺考培训
	 */
	@GetMapping("art")
	public String art(){
		return "proscenium/art";
	}
		
	/**
	 * 国家开放大学
	 */
	@GetMapping("/nation")
	public String nation(){
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
	public String teacher(){
		return "proscenium/teacher";
	}
}
