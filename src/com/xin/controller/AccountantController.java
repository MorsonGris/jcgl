package com.xin.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xin.bean.Finance;
import com.xin.commons.base.BaseController;
import com.xin.commons.utils.ExcelUtil;
import com.xin.commons.utils.PageInfo;
import com.xin.commons.utils.StringUtils;
import com.xin.service.IFinanceService;

/**
 * 会计缴费控制器
 * @author Mr.Lin
 * @since 2017-03-06
 */
@Controller
@RequestMapping("/accountant")
public class AccountantController extends BaseController{
	
	@Autowired private IFinanceService financeService;
	
	/**
     * 会计成考报名缴费管理页
     * @return
     * */
    @GetMapping("/Manager")
    public String accountantManager() {
    	return "admin/finance/accountantManager";
    }
    
    /**
     * 会计缴费管理列表
     *
     * @param finance
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/DataGrid")
    @ResponseBody
    public Object accountantDataGrid(Finance finance, Integer page, Integer rows, String sort, String order) {
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
        condition.put("stypeone", 3);
        condition.put("stypetwo", 4);
        condition.put("stypethree", 5);
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
        return "admin/finance/accountantAdd";
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
        String fileName="会计缴费清单数据导出";
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
        f.setStypeone(3);
        f.setStypetwo(4);
        f.setStypethree(5);
        List<Finance> finances = financeService.selectFinanceAll(f);
        List<Map<String,Object>> list=createExcelRecord(finances);
        String columnNames[]={"序号","姓名","学号","班主任","合作人","需缴金额","实缴金额","缴费时间","缴费方式","累计金额","缴费状态","学习内容"};//列名
        String keys[]    =     {"var1","var2","var3","var4","var5","var6","var7","var8","var9","var10","var11","var12"};//map中的key
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
			vpd.put("var12", finance.getStudent().getSContent());	//11
            listmap.add(vpd);
        }
        return listmap;
    }
}
