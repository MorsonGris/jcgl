package com.xin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xin.bean.Academy;
import com.xin.bean.Student;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.PageInfo;
import com.xin.service.IAcademyService;
import com.xin.service.IStudentService;

/**
 * <p>
 *   院校专业
 * </p>
 * @author com.xin
 * @since 2017-02-28
 */
@Controller
@RequestMapping("/academy")
public class AcademyController extends BaseController{
    
    @Autowired private IAcademyService academyService;
    
    @Autowired private IStudentService studentService;
    
    @GetMapping("/academypage")
    public String academypage(){
    	return "admin/student/academy";
    }
    
    @RequestMapping("/selectadult")
    @ResponseBody
    public Object selectadult(){
    	List<Academy> list = academyService.selectadult();
    	return list;
    }
    
    @RequestMapping("/selectnation")
    @ResponseBody
    public Object selectnation(){
    	List<Academy> list = academyService.selectnation();
    	return list;
    }
    
    /**
     * 分页查询
     * @param academy
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(Academy academy,Integer page, Integer rows){
    	PageInfo pageInfo = new PageInfo(page,rows);
    	Map<String,Object> map = new HashMap<String,Object>();
    	if(academy.getAFlag() != null){
    		map.put("aMajor", academy.getAFlag());
    	}
    	if(academy.getASchool() != null){
    		map.put("aSchool", academy.getASchool());
    	}
    	pageInfo.setCondition(map);
    	academyService.selectDataGrid(pageInfo);
    	return pageInfo;
    }
    
    @GetMapping("/addpage")
    public String addpage(){
    	return "admin/student/academyAdd";
    }
    
    /**
     * 添加
     * @param academy
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public Object add(Academy academy){
    	boolean result = academyService.insertByid(academy);
    	if(result == true){
    		return renderSuccess("添加成功");
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
    	List<Student> list = studentService.selectAll();
    	for(int i=0;i<list.size();i++){
    		/*Student student= list.get(i);
    		if(student.getAcademyId() == id){
    			return renderError("删除失败,该专业已有学生选择,不能删除!");
    		}*/
    		boolean result = academyService.deleteById(id);
        	if(result == true){
        		return renderSuccess("删除成功");
        	}
    	}
    	return renderError("删除失败");
    }
    
    @GetMapping("/editpage")
    public String editpage(Model model,int id){
    	Academy academy = academyService.selectById(id);
    	model.addAttribute("academy", academy);
    	return "admin/student/academyEdit";
    }
    
    /**
     * 修改
     * @param academy
     * @return
     */
    @RequestMapping("/edit")
    @ResponseBody
    public Object edit(Academy academy){
    	boolean result = academyService.updateById(academy);
    	if(result == true){
    		return renderSuccess("修改成功");
    	}
    	return renderError("修改失败");
    }
    
}
