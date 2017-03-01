package com.xin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class IndexController {

	
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
	 * 学生报名
	 */
	@GetMapping("/apply")
	public String apply(){
		return "proscenium/apply";
	}
	
	/**
	 * 艺考培训
	 */
	@GetMapping("art")
	public String art(){
		return "proscenium/art";
	}
	
	/**
	 * 
	 */
	@GetMapping("/eguide")
	public String eguide(){
		return "proscenium/eguide";
	}
	
	/**
	 * 
	 */
	@GetMapping("/help")
	public String help(){
		return "proscenium/help";
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
