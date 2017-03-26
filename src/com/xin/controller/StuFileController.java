package com.xin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.ui.Model;
import com.xin.bean.StuFile;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.FileDownload;
import com.xin.commons.utils.FileUpload;
import com.xin.commons.utils.PageInfo;
import com.xin.commons.utils.PathUtil;
import com.xin.commons.utils.StringUtils;
import com.xin.service.IStuFileService;

/**
 * 
 * @author Mr.Lin
 * @date 2017-3-26
 */
@Controller
@RequestMapping("/stuFile")
public class StuFileController extends BaseController{
    
    @Autowired private IStuFileService stuFileService;
    
    /**
     * 文件上传管理页
     * @return
     * */
    @GetMapping("/manager")
    public String manager() {
    	return "admin/finance/stuFileManager";
    }
    
    /**
     * 文件上传管理列表
     *
     * @param stuFile
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(StuFile stuFile, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (StringUtils.isNotBlank(stuFile.getSfPaper())) {
            condition.put("stuname", StringUtils.formatLike(stuFile.getSfPaper()));
        }
        if (stuFile.getSfDate() != null) {
            condition.put("startTime", stuFile.getSfDate());
        }
        if (stuFile.getEndDate() != null) {
            condition.put("endTime", stuFile.getEndDate());
        }
        pageInfo.setCondition(condition);
        stuFileService.selectDataGrid(pageInfo);
        return pageInfo;
    }
    
    /**
     * 文件上传添加页
     *
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "admin/finance/stuFileAdd";
    }
    
    /**
     * 添加文件上传
     *
     * @param notice
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public Object add(
    		@RequestParam(value="sfPhoto",required=false)MultipartFile sfPhoto,
    		@RequestParam(value="sfVoucher",required=false)MultipartFile sfVoucher,
    		@RequestParam(value="sfPaper",required=false)MultipartFile sfPaper,
    		@RequestParam(value="sstuId")String id,HttpServletRequest request,HttpServletResponse response) throws IllegalStateException, IOException {
    	FileUpload.pictureUpload(request, response,id+"",PathUtil.getClasspath()+"uploadFile/");
    	StuFile stuFile = new StuFile();
    	if(id!=null) {
    		stuFile.setStuId(Integer.parseInt(id));
    	}
    	if(sfPhoto!=null) {
    		stuFile.setSfPhoto(id+sfPhoto.getOriginalFilename());
    	}
    	if(sfVoucher!=null) {
    		stuFile.setSfVoucher(id+sfVoucher.getOriginalFilename());
    	}
    	if(sfPaper!=null) {
    		stuFile.setSfPaper(id+sfPaper.getOriginalFilename());
    	}
    	System.out.println(stuFile.getSfPhoto()+" ///////"+stuFile.getSfVoucher());
    	int result = stuFileService.stuFileInsert(stuFile);
    	if(result>0) {
    		return renderSuccess("添加成功");
    	}else {
    		return renderSuccess("添加失败");
    	}
    }
    
    /**下载相片
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/downphoto")
	public void downphoto(@RequestParam(value="stuname")String stuname,
			@RequestParam(value="photo")String photo,HttpServletResponse response)throws Exception{
		FileDownload.fileDownload(response, PathUtil.getClasspath() + "uploadFile/" + photo, stuname+photo);
	}
    
    /**
     * 编辑文件上传页
     * @param model
     * @param id
     * @return
     * */
    @GetMapping("/editPage")
    public String editPage(Model model, int id) {
    	StuFile n = stuFileService.selectStuFileById(id);
    	model.addAttribute("stuFile", n);
    	return "admin/notice/noticeEdit";
    }
    
    /**
     * 编辑文件上传
     * @param notice
     * @return
     * */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(StuFile stuFile) {
    	int result = stuFileService.updateStuFile(stuFile);
    	if(result>0) {
    		return renderSuccess("添加成功");
    	}else {
    		return renderSuccess("添加失败");
    	}
    }
    
    /**
     * 删除文件上传
     * @param id
     * */
    @PostMapping("/delete")
    @ResponseBody
    public Object delete(int id) {
    	stuFileService.deleteStuFile(id);
    	return renderSuccess("删除成功");
    }
    
}
