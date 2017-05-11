package com.xin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.xin.bean.Share;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.PageInfo;
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
	public Object shareadd(Share share){
		//这里需要文件上传
		int result = shareservice.insert(share);
		if(result >0){
			return renderSuccess("添加成功");
		}
		return renderError("添加失败");
	}
	
	@RequestMapping("/updatepage")
	public String updatepage(int id,Model model){
		List<Share> list = shareservice.queryall(id);
		model.addAttribute("sharelist",list);
		return "admin/student/shareEdit";
	}
	
	@RequestMapping("/shareupdate")
	@ResponseBody
	public Object update(Share share){
		//这里需要文件上传
		int result = shareservice.update(share);
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
