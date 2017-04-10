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

import com.xin.bean.Finance;
import com.xin.bean.Student;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.ExcelUtil;
import com.xin.commons.utils.FileDownload;
import com.xin.commons.utils.FileUpload;
import com.xin.commons.utils.ObjectExcelRead;
import com.xin.commons.utils.PageInfo;
import com.xin.commons.utils.PageJson;
import com.xin.commons.utils.PathUtil;
import com.xin.commons.utils.StringUtils;
import com.xin.service.IFinanceService;
import com.xin.service.IStudentService;

/**
 * 缴费控制器
 * @author Mr.Lin
 * @since 2017-03-06
 */
@Controller
@RequestMapping("/finance")
public class FinanceController extends BaseController{
    
    @Autowired private IFinanceService financeService;
    
    @Autowired private IStudentService studentService;
    
    /**
     * 成考国家报名缴费管理页
     * @return
     * */
    @GetMapping("/manager")
    public String manager() {
    	return "admin/finance/financeManager";
    }
    
    /**
     * 成考缴费管理列表
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
        if (StringUtils.isNotBlank(finance.getTeaClass())) {
            condition.put("username", StringUtils.formatLike(finance.getTeaClass()));
        }
        if (finance.getStuNo()!=null) {
            condition.put("stuNo", StringUtils.formatLike(finance.getStuNo()));
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
        condition.put("stypeone", 1);
        condition.put("stypetwo", 2);
        condition.put("stypethree", 6);
        pageInfo.setCondition(condition);
        financeService.selectFinancePage(pageInfo);
        return pageInfo;
    }
    
    @RequestMapping("/financepage")
    @ResponseBody
    public Object financepage(PageJson<Finance> pages,@RequestParam int offset,@RequestParam int limit,HttpServletRequest request){
    	String teaid = request.getParameter("teaid");
    	String stuno = request.getParameter("stuno");
		if(!stuno.equals("") && stuno != null){
			pages.setRows(financeService.financepage(stuno, offset, limit));
			pages.setTotal(financeService.queryTotal(stuno));
			return pages;
    	}else if(teaid != null && !teaid.equals("")){
    		pages.setRows(financeService.financepagebyteaid(teaid, offset, limit));
			pages.setTotal(financeService.queryTotalbyteaid(teaid));
			return pages;
    	}
		return renderError("未登录，请先登录！");
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
     * @param finance
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(Finance finance) {
    	int result = financeService.financeInsert(finance);
    	if(result>0) {
    		return renderSuccess("添加成功");
    	}else {
    		return renderError("添加失败");
    	}
    }
    
    /**
     * 编辑缴费页
     * @param model
     * @param id
     * @return
     * */
    @GetMapping("/editPage")
    public String editPage(Model model, int id) {
    	Finance f = financeService.selectfinanceById(id);
    	model.addAttribute("finance", f);
    	return "admin/finance/financeEdit";
    }
    
    /**
     * 编辑缴费
     * @param finance
     * @return
     * */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(Finance finance) {
    	int result = financeService.updateFinance(finance);
    	if(result>0) {
    		return renderSuccess("添加成功");
    	}else {
    		return renderError("添加失败");
    	}
    }
    
    /**
     * 批量缴费页
     * @param model
     * @param ids
     * @return
     * */
    @GetMapping("/batchPay_Page")
    public String batchPay_Page(Model model, String ids) {
    	model.addAttribute("ids", ids);
    	return "admin/finance/beath_pay";
    }
    
    /**
     * 批量缴费
     * */
    @PostMapping("/batchPay")
    @ResponseBody
    public Object batchPay(Finance finance) {
    	String DATA_IDS = finance.getTeaClass();
    	int result = 0;
    	if(null != DATA_IDS && !"".equals(DATA_IDS)){
			String ArrayDATA_IDS[] = DATA_IDS.split(",");
			for(int i=0; i<ArrayDATA_IDS.length; i++) {
				finance.setFId(Integer.parseInt(ArrayDATA_IDS[i]));
				System.out.println(Integer.parseInt(ArrayDATA_IDS[i]));
				result = financeService.updateBatchFinance(finance);
			}
    	}
    	if(result>0) {
    		return renderSuccess("缴费成功");
    	}else {
    		return renderError("缴费失败");
    	}
    }
    
    /**
     * 删除缴费
     * @param id
     * @return
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
	 * @param Finance
	 * @param request
	 * @param response
	 * @throws IOException
	 * @return
	 */
    @RequestMapping(value="/download_finance")
    public String download(Finance f,Integer page, Integer rows,HttpServletRequest request,HttpServletResponse response) throws IOException{
        String fileName="成考缴费清单数据导出";
        //填充projects数据
        if (StringUtils.isNotBlank(f.getTeaClass())) {
            f.setTeaClass(StringUtils.formatLike(f.getTeaClass()));
        }
        if (f.getStuNo()!=null) {
            f.setStuNo(StringUtils.formatLike(f.getStuNo()));
        }
        if (f.getFState() != null && f.getFState()!=0) {
            f.setFState(f.getFState());
        }
        if (f.getCreatedateStart() != null) {
            f.setCreatedateStart(f.getCreatedateStart());
        }
        if (f.getCreatedateEnd() != null) {
            f.setCreatedateEnd(f.getCreatedateEnd());
        }
        f.setStypeone(1);
        f.setStypetwo(2);
        f.setStypethree(6);
        List<Finance> finances = financeService.selectFinanceAll(f);
        List<Map<String,Object>> list=createExcelRecord(finances);
        String columnNames[]={"序号","姓名","学号","学校","专业","层次","班主任","合作人","需缴金额","实缴金额","缴费时间","缴费方式","累计金额","缴费状态"};//列名
        String keys[]    =     {"var1","var2","var3","var4","var5","var6","var7","var8","var9","var10","var11","var12","var13","var14"};//map中的key
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
    
    /**
     * 填值
     * @param finances
     * @return
     * */
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
			vpd.put("var4", finance.getAcademy().getASchool());	//3
			vpd.put("var5", finance.getAcademy().getAMajor());	//4
			vpd.put("var6", finance.getStudent().getSGradations());	//5
			vpd.put("var7", finance.getTeaClass());				//6
			vpd.put("var8", finance.getUser().getName());	//7
			String nmoney = finance.getNeedMoney()+"";	//8
			vpd.put("var9", nmoney);		//9
			String pmoney = finance.getPracticalMoney()+"";
			vpd.put("var10", pmoney);		//10
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:MM:ss");
			vpd.put("var11", sdf.format(finance.getFDate()));	//11
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
			vpd.put("var12", state);		//12
			String fmoney = finance.getFAccumulative()+"";
			vpd.put("var13", fmoney);		//13
			state1 = finance.getFState()+"";
			if(state1.equals("1")) {
				state1 = "未缴费";
			}else if(state1.equals("2")) {
				state1 = "已缴费";
			}else{
				state1 = "已兑账";
			}
			vpd.put("var14", state1);		//14
            listmap.add(vpd);
        }
        return listmap;
    }
    
    /**打开上传EXCEL页面
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value="/goUploadExcel")
	public String goUploadExcel(Model model) {
		model.addAttribute("stype", "1");
		return "admin/finance/uploadexcel";
	}
	
	/**打开上传EXCEL页面
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value="/goUploadExcell")
	public String goUploadExcell(Model model) {
		model.addAttribute("stype", "2");
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
	 * @param file
	 * @param request
	 * @throws Exception
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes"})
	@RequestMapping("/upload_finance")
	@ResponseBody
	public Object upload_finance(
			@RequestParam(value="excel",required=false) MultipartFile file,
			@RequestParam(value="type") String stype, HttpServletRequest request) throws Exception{
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
				if(!listm.isEmpty()) {
					String studentNo = listm.get(i).get("var0").toString();
					Student s = new Student();
					s.setStudentNo(studentNo);
					if(stype.equals("1")) {
						s.setStypeone(1);
						s.setStypetwo(2);
						s.setStypethree(6);
						if(studentNo!=null && !studentNo.equals("")) {
							if(studentService.selectByStuNo(s)==null){
								return renderError("上传错误！学号"+studentNo+"不存在该表类型(成考,国考,远程)！,请核对后上传！！！");
							}
						}
					}else {
						s.setStypeone(3);
						s.setStypetwo(4);
						s.setStypethree(5);
						if(studentNo!=null && !studentNo.equals("")) {
							if(studentService.selectByStuNo(s)==null){
								return renderError("上传错误！学号"+studentNo+"不存在该表类型(会计,艺考,职培)！,请核对后上传！！！");
							}
						}
					}
					
				}
			}
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
