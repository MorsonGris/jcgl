package com.xin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.xin.bean.HotMajor;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.FileUpload;
import com.xin.commons.utils.PageInfo;
import com.xin.commons.utils.PathUtil;
import com.xin.service.IHotMajorService;

/**
 * <p>
 *   热门专业控制器
 * </p>
 * @author com.xin
 * @since 2017-02-28
 */
@Controller
@RequestMapping("/hotmajor")
public class HotMajorController extends BaseController{
    
    @Autowired private IHotMajorService hotMajorService;
    
    @GetMapping("/hotmajorpage")
    public String hotmajor(){
    	return "admin/student/hotmajor";
    }
    
    /**
     * 分页查询
     * @param hotmajor
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(HotMajor hotmajor,Integer page, Integer rows){
    	PageInfo pageInfo = new PageInfo(page,rows);
    	Map<String,Object> map = new HashMap<>();
    	if(hotmajor.getHmTitle() != null){
    		map.put("title", hotmajor.getHmTitle());
    	}
    	pageInfo.setCondition(map);
    	hotMajorService.selectPage(pageInfo);
    	return pageInfo;
    }
    
    
    @GetMapping("/addpage")
    public String addpage(){
    	return "admin/student/hotmajorAdd";
    }
    
    /**
     * 添加
     * @param hotMajor
     * @param file
     * @param request
     * @param response
     * @return
     * @throws IllegalStateException
     */
    @RequestMapping("/add")
    @ResponseBody
    public Object add(HotMajor hotMajor,@RequestParam(value="price") MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException{
    	FileUpload.pictureUpload(request, response, "",PathUtil.getClasspath()+"static/proscenium/images/");
    	hotMajor.setHmPicture(file.getOriginalFilename());
    	boolean result = hotMajorService.insertByid(hotMajor);
    	if(result == true){
    		return renderSuccess("添加成功");
    	}
    	return renderError("添加失败");
    }
    
    @GetMapping("/editpage")
    public String editpage(int id,Model model){
    	HotMajor hotMajor=  hotMajorService.selectByid(id);
    	if(hotMajor != null){
    		model.addAttribute("hotMajor",hotMajor);
    	}
    	return "admin/student/hotmajorEdit";
    }
    
    /**
     * 修改
     * @param hotMajor
     * @return
     * @throws IOException 
     * @throws IllegalStateException 
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(HotMajor hotMajor,@RequestParam(value="price") MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException{
    	FileUpload.pictureUpload(request, response, "",PathUtil.getClasspath()+"static/proscenium/images/");
    	hotMajor.setHmPicture(file.getOriginalFilename());
    	boolean result = hotMajorService.updateByid(hotMajor);
    	if(result == true){
    		return renderSuccess("修改成功");
    	}
    	return renderError("添加失败");
    }
    
   /**
    * 删除
    * @param id
    * @return
    */
    @RequestMapping("/delete")
    @ResponseBody
    public Object delete(int id){
    	boolean result = hotMajorService.deleteByid(id);
    	if(result == true){
    		return renderSuccess("删除成功");
    	}
    	return renderError("删除失败");
    }
    
}
