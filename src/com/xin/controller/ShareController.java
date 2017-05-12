package com.xin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.xin.bean.Share;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.FileUpload;
import com.xin.commons.utils.PageInfo;
import com.xin.commons.utils.PathUtil;
import com.xin.service.ShareService;

/**
 * 合作共享
 * @author DengMin
 *
 */
@Controller
@RequestMapping("/Share")
public class ShareController extends BaseController{
	
	@Autowired private ShareService shareservice;
	
	@RequestMapping("shareapge")
	public String page(){
		return "admin/student/share";
	}
	
	@RequestMapping("/addpage")
	public String addpage(){
		return "admin/student/shareAdd";
	}
	
	@RequestMapping("/shareadd")
	@ResponseBody
	public Object shareadd(
		@RequestParam(value="sharephone",required=false)MultipartFile sharephone,
		@RequestParam(value="sharepicture",required=false)MultipartFile sharepicture,
		@RequestParam(value="sharetitle")String sharetitle,
		@RequestParam(value="sharecontent")String sharecontent,HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException {
		FileUpload.pictureUpload(request, response,"",PathUtil.getClasspath()+"static/proscenium/images/share/");
		Share s = new Share();
		if(sharephone!=null) {
			s.setSharephone(sharephone.getOriginalFilename());
		}
		if(sharepicture!=null) {
			s.setSharepicture(sharepicture.getOriginalFilename());
		}
		if(sharetitle!=null) {
			s.setSharetitle(sharetitle);
		}
		if(sharecontent!=null) {
			s.setSharecontent(sharecontent);
		}
		int result = shareservice.insert(s);
		if(result > 0){
			return renderSuccess("添加成功");
		}
		return renderError("添加失败");
	}
	
	@RequestMapping("/updatepage")
	public String updatepage(int id,Model model){
		Share list = shareservice.queryById(id);
		model.addAttribute("sharelist",list);
		return "admin/student/shareEdit";
	}
	
	@RequestMapping("/shareupdate")
	@ResponseBody
	public Object update(@RequestParam(value="sharephone",required=false)MultipartFile sharephone,
			@RequestParam(value="sharepicture",required=false)MultipartFile sharepicture,
			@RequestParam(value="shareid")String shareid,
			@RequestParam(value="sharetitle")String sharetitle,
			@RequestParam(value="sharecontent")String sharecontent,HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException {
		FileUpload.pictureUpload(request, response,"",PathUtil.getClasspath()+"static/proscenium/images/share/");
		Share s = new Share();
		if(sharephone!=null) {
			s.setSharephone(sharephone.getOriginalFilename());
		}
		if(sharepicture!=null) {
			s.setSharepicture(sharepicture.getOriginalFilename());
		}
		s.setShareid(Integer.parseInt(shareid));
		s.setSharetitle(sharetitle);
		s.setSharecontent(sharecontent);
		int result = shareservice.update(s);
		if(result >0){
			return renderSuccess("修改成功");
		}
		return renderError("修改失败");
	}
	
	@RequestMapping("/sharedelete")
	@ResponseBody
	public Object delete(int id){
		int result = shareservice.delete(id);
		if(result >0){
			return renderSuccess("删除成功");
		}
		return renderError("删除失败");
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Object dataGrid(Share share,Integer page, Integer rows){
    	PageInfo pageInfo = new PageInfo(page,rows);
    	Map<String,Object> map = new HashMap<String,Object>();
    	if(share.getSharetitle()!= null){
    		map.put("sharetitle",share.getSharetitle());
    	}
    	pageInfo.setCondition(map);
    	shareservice.selectPage(pageInfo);
    	return pageInfo;
	}
}
