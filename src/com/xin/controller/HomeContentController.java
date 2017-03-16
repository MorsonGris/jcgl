package com.xin.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.xin.bean.HomeContent;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.FileUpload;
import com.xin.commons.utils.PageInfo;
import com.xin.service.IHomeContentService;

/**
 * <p>
 *   首页内容控制器
 * </p>
 * @author com.xin
 * @since 2017-02-28
 */
@Controller
@RequestMapping("/homeContent")
public class HomeContentController extends BaseController{
    
    @Autowired private IHomeContentService homeContentService;
    
    /**
     * 首页内容管理页
     * @return
     * */
    @GetMapping("/manager")
    public String manager() {
    	return "admin/relation/homeContentManager";
    }
    
    /**
     * 首页内容列表
     *
     * @param homeContent
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(HomeContent homeContent, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        homeContentService.selectHomeContentPage(pageInfo);
        return pageInfo;
    }
    
    /**
     * 编辑首页内容页
     * @param model
     * @param id
     * @return
     * */
    @GetMapping("/editPage")
    public String editPage(Model model, int id) {
    	HomeContent hc = homeContentService.selectHomeContentById(id);
    	model.addAttribute("homeContent", hc);
    	return "admin/relation/homeContentEdit";
    }
    
    /**
     * 编辑首页内容
     * @param homeContent
     * @return
     * *//*
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@RequestParam(value="pictureOne",required=false) MultipartFile file) throws IOException{
    	System.out.println(file+"*******************");
    	int result = homeContentService.updateHomeContent(homeContent);
    	if(result>0) {
    		return renderSuccess("添加成功");
    	}else {
    		return renderSuccess("添加失败");
    	}
    	return renderSuccess("添加失败");
    }*/
    
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@RequestParam(value="pictureOne",required=false)MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException {
    	System.out.println("/*****"+file);
    	FileUpload.pictureUpload(request, response, "", "E:/");
        return renderSuccess("添加失败");
    }
    
}
