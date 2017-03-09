package com.xin.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletOutputStream;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.xin.commons.utils.StringUtils;
import com.xin.commons.utils.PathUtil;
import com.xin.bean.Finance;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.ExcelUtil;
import com.xin.commons.utils.FileDownload;
import com.xin.commons.utils.FileUpload;
import com.xin.commons.utils.ObjectExcelRead;
import com.xin.commons.utils.PageInfo;
import com.xin.service.IFinanceService;

/**
 * 缴费控制器
 * @author Mr.Lin
 * @since 2017-03-06
 */
@Controller
@RequestMapping("/finance")
public class FinanceController extends BaseController{
    
    @Autowired private IFinanceService financeService;
    
    /**
     * 缴费管理页
     * @return
     * */
    @GetMapping("/manager")
    public String manager() {
    	return "admin/finance/financeManager";
    }
    
    /**
     * 缴费管理列表
     *
     * @param finance
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/dataGrid")
    @ResponseBody
    public Object dataGrid(Finance finance, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        Map<String, Object> condition = new HashMap<String, Object>();
        System.out.println(finance.getTeaClass()+"**"+finance.getStuNo()+"**"+finance.getFState()+"**"+finance.getCreatedateStart()+"//"+finance.getCreatedateEnd());
        if (StringUtils.isNotBlank(finance.getTeaClass())) {
            condition.put("sName", finance.getTeaClass());
        }
        if (finance.getStuNo()!=null) {
            condition.put("stuNo", finance.getStuNo());
        }
        if (finance.getFState() != null && finance.getFState()!=0) {
            condition.put("fState", finance.getFState());
        }
        if (finance.getCreatedateStart() != null) {
            condition.put("startTime", finance.getCreatedateStart());
        }
        if (finance.getCreatedateEnd() != null) {
            condition.put("endTime", finance.getCreatedateEnd());
        }
        pageInfo.setCondition(condition);
        financeService.selectFinancePage(pageInfo);
        return pageInfo;
    }
    
    /**
     * 缴费添加页
     *
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "admin/finance/financeAdd";
    }
    
    /**
     * 添加缴费数据
     *
     * @param notice
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(Finance finance) {
    	int result = financeService.financeInsert(finance);
    	if(result>0) {
    		return renderSuccess("添加成功");
    	}else {
    		return renderSuccess("添加失败");
    	}
    }
    
    /**
     * 编辑缴费页
     * @param model
     * @param id
     * @retur
     * */
    @GetMapping("/editPage")
    public String editPage(Model model, int id) {
    	Finance f = financeService.selectfinanceById(id);
    	model.addAttribute("finance", f);
    	return "admin/finance/financeEdit";
    }
    
    /**
     * 编辑缴费
     * @param notice
     * @return
     * */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(Finance finance) {
    	int result = financeService.updateFinance(finance);
    	if(result>0) {
    		return renderSuccess("添加成功");
    	}else {
    		return renderSuccess("添加失败");
    	}
    }
    
    /**
     * 删除缴费
     * */
    @PostMapping("/delete")
    @ResponseBody
    public Object delete(int id) {
    	financeService.deleteFinance(id);
    	return renderSuccess("删除成功");
    }
    
    /**
	 * @author Mr.Lin
	 * 导出缴费数据到EXCEL
	 * @return
	 */
    @RequestMapping(value="/download_finance")
    public String download(Finance f,HttpServletRequest request,HttpServletResponse response) throws IOException{
        String fileName="缴费清单数据导出";
        //填充projects数据
        PageInfo pageInfo = new PageInfo(1, 20, "f_date", "desc");
        Map<String, Object> condition = new HashMap<String, Object>();
        if (StringUtils.isNotBlank(f.getTeaClass())) {
            condition.put("sName", f.getTeaClass());
        }
        if (f.getStuNo()!=null) {
            condition.put("stuNo", f.getStuNo());
        }
        if (f.getFState() != null && f.getFState()!=0) {
            condition.put("fState", f.getFState());
        }
        if (f.getCreatedateStart() != null) {
            condition.put("startTime", f.getCreatedateStart());
        }
        if (f.getCreatedateEnd() != null) {
            condition.put("endTime", f.getCreatedateEnd());
        }
        pageInfo.setCondition(condition);
        List<Finance> finances = financeService.selectFinancePage(pageInfo);
        List<Map<String,Object>> list=createExcelRecord(finances);
        String columnNames[]={"序号","姓名","学号","班主任","合作人","需缴金额","实缴金额","缴费时间","缴费方式","累计金额","缴费状态"};//列名
        String keys[]    =     {"var1","var2","var3","var4","var5","var6","var7","var8","var9","var10","var11"};//map中的key
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        try {
            ExcelUtil.createWorkBook(list,keys,columnNames).write(os);
        } catch (IOException e) {
            e.printStackTrace();
        }
        byte[] content = os.toByteArray();
        InputStream is = new ByteArrayInputStream(content);
        // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="+ new String((fileName + ".xls").getBytes(), "iso-8859-1"));
        ServletOutputStream out = response.getOutputStream();
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            // Simple read/write loop.
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (final IOException e) {
            throw e;
        } finally {
            if (bis != null)
                bis.close();
            if (bos != null)
                bos.close();
        }
        return null;
    }
    
    private List<Map<String, Object>> createExcelRecord(List<Finance> finances) {
        List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("sheetName", "sheet1");
        listmap.add(map);
        Finance finance=null;
        String state = "";
		String state1 = "";
        for (int i = 0; i < finances.size(); i++) {
            finance=finances.get(i);
            Map<String, Object> vpd = new HashMap<String,Object>();
			vpd.put("var1", i+1+"");
			vpd.put("var2", finance.getStudent().getSName());   //1
			vpd.put("var3", finance.getStuNo());				//2
			vpd.put("var4", finance.getTeaClass());				//3
			vpd.put("var5", finance.getUser().getName());	//4
			String nmoney = finance.getNeedMoney()+"";
			vpd.put("var6", nmoney);		//5
			String pmoney = finance.getPracticalMoney()+"";
			vpd.put("var7", pmoney);		//6
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:MM:ss");
			vpd.put("var8", sdf.format(finance.getFDate()));	//7
			state = finance.getFWay()+"";
			if(state.equals("1")) {
				state = "支付宝";
			}else if(state.equals("2")) {
				state = "微信";
			}else if(state.equals("3")){
				state = "银行转账";
			}else {
				state = "现金";
			}
			vpd.put("var9", state);		//8
			String fmoney = finance.getFAccumulative()+"";
			vpd.put("var10", fmoney);		//9
			state1 = finance.getFState()+"";
			if(state1.equals("1")) {
				state1 = "未缴费";
			}else if(state1.equals("2")) {
				state1 = "已缴费";
			}else{
				state1 = "已兑账";
			}
			vpd.put("var11", state1);		//10
            listmap.add(vpd);
        }
        return listmap;
    }
    
    /**打开上传EXCEL页面
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value="/goUploadExcel")
	public String goUploadExcel() {
		return "admin/finance/uploadexcel";
	}
	
	/**下载模版
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/downExcel")
	public void downExcel(HttpServletResponse response)throws Exception{
		FileDownload.fileDownload(response, PathUtil.getClasspath() + "uploadFile/file/" + "Pay_cost.xls", "Pay_cost.xls");
	}
	
	/**
	 * 上传EXCEL
	 * 
	 * */
	
	@SuppressWarnings({ "unchecked", "rawtypes"})
	@RequestMapping("/upload_finance")
	@ResponseBody
	public Object upload_finance(
			@RequestParam(value="excel",required=false) MultipartFile file, HttpServletRequest request) throws Exception{
		Finance finance = new Finance();
		int result = 0;
		int way = 0;
		int state = 0;
		SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy",Locale.US);
		if (null != file && !file.isEmpty()) {
			String filePath = PathUtil.getClasspath() + "uploadFile/file/";								//文件上传路径
			String fileName = FileUpload.fileUp(file, filePath, "financeExcel");							//执行上传
			List<Map<String,Object>> listm = (List)ObjectExcelRead.readExcel(filePath, fileName, 2, 0, 0);  //执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet
			for(int i=0; i<listm.size(); i++) {
				if(listm.get(i).get("var3") != null && !listm.get(i).get("var3").equals("")) {
					finance.setStuNo(listm.get(i).get("var0").toString());	//学号
					finance.setTeaClass(listm.get(i).get("var1").toString());	//班主任
					finance.setNeedMoney(new BigDecimal(listm.get(i).get("var2").toString()));	//需交金额
					finance.setPracticalMoney(new BigDecimal(listm.get(i).get("var3").toString()));	//实缴金额
					finance.setFDate(sdf.parse(listm.get(i).get("var4").toString()));	//缴费日期
					if(listm.get(i).get("var5").equals("支付宝")) {
						way = 1;
					}else if(listm.get(i).get("var5").equals("微信")) {
						way = 2;
					}else if(listm.get(i).get("var5").equals("银行转账")) {
						way = 3;
					}else if(listm.get(i).get("var5").equals("现金")) {
						way = 4;
					}else {
						way = 0;
					}
					finance.setFWay(way);	//缴费方式
					finance.setFAccumulative(new BigDecimal(listm.get(i).get("var6").toString()));	//缴费总额
					if(listm.get(i).get("var7").equals("未缴费")) {
						state = 1;
					}else if(listm.get(i).get("var7").equals("已缴费")) {
						state = 2;
					}else if(listm.get(i).get("var7").equals("已兑账")) {
						state = 3;
					}else {
						state = 0;
					}
					finance.setFState(state);	//缴费状态
					result += financeService.financeInsert(finance);
				}
			}
		}
		/*存入数据库操作======================================*/
		System.out.println(result+"/////////////////");
		return renderSuccess("上传成功");
	}
}
