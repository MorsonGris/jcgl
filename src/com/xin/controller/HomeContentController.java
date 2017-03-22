package com.xin.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.xin.bean.HomeContent;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.FileUpload;
import com.xin.commons.utils.PageInfo;
import com.xin.commons.utils.PathUtil;
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
     * */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@RequestParam(value="pictureOne",required=false)MultipartFile picOne,
    		@RequestParam(value="pictureTwo",required=false)MultipartFile picTwo,
    		@RequestParam(value="pictureThree",required=false)MultipartFile picThree,
    		@RequestParam(value="qrcodeOne",required=false)MultipartFile qrcodeOne,
    		@RequestParam(value="qrcodeTwo",required=false)MultipartFile qrcodeTwo,
    		@RequestParam(value="hcId")String id,
    		@RequestParam(value="hcPhone")String hcPhone,
    		@RequestParam(value="interlinkageOne")String interlinkageOne,
    		@RequestParam(value="interlinkageTwo")String interlinkageTwo,
    		@RequestParam(value="interlinkageThree")String interlinkageThree,
    		@RequestParam(value="interlinkageFour")String interlinkageFour,
    		@RequestParam(value="hcAddress")String hcAddress,HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException {
    	FileUpload.pictureUpload(request, response,"",PathUtil.getClasspath()+"static/proscenium/images/");
    	//System.out.println(request.getSession().getServletContext().getRealPath("uploadFile"));
    	HomeContent homeContent = new HomeContent();
    	if(picOne.getOriginalFilename()!=null) {
    		homeContent.setPictureOne(picOne.getOriginalFilename());
    	}
		if(picTwo.getOriginalFilename()!=null) {
			homeContent.setPictureTwo(picTwo.getOriginalFilename());
		}
		if(picThree.getOriginalFilename()!=null) {
			homeContent.setPictureThree(picThree.getOriginalFilename());
		}
		if(qrcodeOne.getOriginalFilename()!=null) {
			homeContent.setQrcodeOne(qrcodeOne.getOriginalFilename());
		}
		if(qrcodeTwo.getOriginalFilename()!=null){
			homeContent.setQrcodeTwo(qrcodeTwo.getOriginalFilename());
		}
		homeContent.setHcId(Integer.parseInt(id));
		homeContent.setHcPhone(hcPhone);
		homeContent.setInterlinkageOne(interlinkageOne);
		homeContent.setInterlinkageTwo(interlinkageTwo);
		homeContent.setInterlinkageThree(interlinkageThree);
		homeContent.setInterlinkageFour(interlinkageFour);
		homeContent.setHcAddress(hcAddress);
		int result = homeContentService.updateHomeContent(homeContent);
    	if(result>0) {
    		return renderSuccess("添加成功");
    	}else {
    		return renderSuccess("添加失败");
    	}
    }
    
}
