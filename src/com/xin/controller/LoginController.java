package com.xin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xin.bean.HomeContent;
import com.xin.bean.HotMajor;
import com.xin.bean.Notice;
import com.xin.bean.Relation;
import com.xin.bean.Schedule;
import com.xin.commons.base.BaseController;
import com.xin.commons.csrf.CsrfToken;
import com.xin.commons.utils.CaptchaUtils;
import com.xin.commons.utils.PageInfo;
import com.xin.commons.utils.StringUtils;
import com.xin.service.IHomeContentService;
import com.xin.service.IHotMajorService;
import com.xin.service.INoticeService;
import com.xin.service.IRelationService;
import com.xin.service.IScheduleService;

/**
 * @description：登录退出
 * @author：zhixuan.wang
 * @date：2015/10/1 14:51
 */
@Controller
public class LoginController extends BaseController {
	
	@Autowired private INoticeService noticeService;
	
	@Autowired private IScheduleService scheduleService;
	
	@Autowired private IHotMajorService hotMajorService;
	
	@Autowired private IHomeContentService homeContentService;
	
	@Autowired private IRelationService relationService;
	
	@Autowired private IScheduleService scheduleService;
	
    /**
     * 首页
     *
     * @return
     */
    @GetMapping("/admin")
    public String index() {
    	return "redirect:/admin/index";
    }
    
    
    /**
     * 前端首页
     */
    @RequestMapping("/index")
    public String home(Model model){
    	PageInfo pageInfo = new PageInfo(0, 5, "n_date", "desc");
    	Map<String, Object> condition = new HashMap<String, Object>();
        condition.put("nFlag", "1");
        pageInfo.setCondition(condition);
    	List<Notice> list = noticeService.selectDataGrid(pageInfo);
    	model.addAttribute("noticelist", list);
    	
    	List<HotMajor> major = hotMajorService.selectAll();
    	model.addAttribute("major", major);
    	
    	model.addAttribute("homeContent", homeContent());
    	
    	PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
    	return "proscenium/home";
    }

    @GetMapping("/")
    public String home(Model model, String str){
    	PageInfo pageInfo = new PageInfo(0, 5, "n_date", "desc");
    	Map<String, Object> condition = new HashMap<String, Object>();
        condition.put("nFlag", "1");
        pageInfo.setCondition(condition);
    	List<Notice> list = noticeService.selectDataGrid(pageInfo);
    	model.addAttribute("noticelist", list);
    	
    	List<HotMajor> major = hotMajorService.selectAll();
    	model.addAttribute("major", major);
    	
    	HomeContent homeContent = homeContentService.selectHomeOne();
    	model.addAttribute("homeContent", homeContent);
    	
    	PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addAttribute("relation", relation);
    	return "proscenium/home";
    }
    
    @RequestMapping("/")
    public String home(String str){
    	ModelAndView model = new ModelAndView();
    	PageInfo pageInfo = new PageInfo(0, 5, "n_date", "desc");
    	Map<String, Object> condition = new HashMap<String, Object>();
        condition.put("nFlag", "1");
        pageInfo.setCondition(condition);
    	List<Notice> list = noticeService.selectDataGrid(pageInfo);
    	model.addObject("noticelist", list);
    	
    	List<HotMajor> major = hotMajorService.selectAll();
    	model.addObject("major", major);
    	
    	HomeContent homeContent = homeContentService.selectHomeOne();
    	model.addObject("homeContent", homeContent);
    	
    	PageInfo pi = new PageInfo(0, 4, "r_id", "desc");
    	List<Relation> relation = relationService.selectDataGrid(pi);
    	model.addObject("relation", relation);
    	return "proscenium/home";
    }

    /**
     * 首页
     *
     * @param model
     * @return
     */
    @RequestMapping("/admin/index")
    public String index(Model model) {
    	Schedule schedule = new Schedule();
    	SimpleDateFormat sdf = new SimpleDateFormat("dd");
    	schedule.setDay(sdf.format(new Date()));
    	schedule.setUserId(getUserId());
    	List<Schedule> list = scheduleService.selectByDate(schedule);
    	model.addAttribute("schedule", list);
        return "index";
    }
    
    @RequestMapping("/admin/work")
    @ResponseBody
    public List<Schedule> work(){
    	List<Schedule> list = scheduleService.selectByuserId(getUserId());
    	return list;
    }

    /**
     * GET 登录
     * @return {String}
     */
    @GetMapping("/login")
    @CsrfToken(create = true)
    public String login(Model model) {
        logger.info("GET请求登录");
        if (SecurityUtils.getSubject().isAuthenticated()) {
        	Schedule schedule = new Schedule();
        	SimpleDateFormat sdf = new SimpleDateFormat("dd");
        	schedule.setDay(sdf.format(new Date()));
        	schedule.setUserId(getUserId());
        	List<Schedule> list = scheduleService.selectByDate(schedule);
        	model.addAttribute("schedule", list);
            return "redirect:/admin/index";
        }
        return "login";
    }

    /**
     * POST 登录 shiro 写法
     *
     * @param username 用户名
     * @param password 密码
     * @return {Object}
     */
    @PostMapping("/login")
    @CsrfToken(remove = true)
    @ResponseBody
    public Object loginPost(HttpServletRequest request, String username, String password, String captcha, 
            @RequestParam(value = "rememberMe", defaultValue = "1") Integer rememberMe) {
        logger.info("POST请求登录");
        // 改为全部抛出异常，避免ajax csrf token被刷新
        if (StringUtils.isBlank(username)) {
            throw new RuntimeException("用户名不能为空");
        }
        if (StringUtils.isBlank(password)) {
            throw new RuntimeException("密码不能为空");
        }
        if (StringUtils.isBlank(captcha)) {
            throw new RuntimeException("验证码不能为空");
        }
        if (!CaptchaUtils.validate(request, captcha)) {
            throw new RuntimeException("验证码错误");
        }
        Subject user = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
        // 设置记住密码
        token.setRememberMe(1 == rememberMe);
        try {
            user.login(token);
            return renderSuccess();
        } catch (UnknownAccountException e) {
            throw new RuntimeException("账号不存在！", e);
        } catch (DisabledAccountException e) {
            throw new RuntimeException("账号未启用！", e);
        } catch (IncorrectCredentialsException e) {
            throw new RuntimeException("密码错误！", e);
        } catch (Throwable e) {
            throw new RuntimeException(e.getMessage(), e);
        }
    }

    /**
     * 未授权
     * @return {String}
     */
    @GetMapping("/unauth")
    public String unauth() {
        if (SecurityUtils.getSubject().isAuthenticated() == false) {
            return "redirect:/login";
        }
        return "unauth";
    }

    /**
     * 退出
     * @return {Result}
     */
    @PostMapping("/logout")
    @ResponseBody
    public Object logout() {
        logger.info("登出");
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return renderSuccess();
    }

}
