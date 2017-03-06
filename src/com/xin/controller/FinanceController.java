package com.xin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.xin.commons.utils.StringUtils;
import com.xin.bean.Finance;
import com.xin.commons.utils.PageInfo;
import com.xin.service.IFinanceService;

/**
 * 缴费控制器
 * @author Mr.Lin
 * @since 2017-03-06
 */
@Controller
@RequestMapping("/finance")
public class FinanceController {
    
    @Autowired private IFinanceService financeService;
    
    /**
     * 公告管理页
     * @return
     * */
    @GetMapping("/manager")
    public String manager() {
    	return "admin/finance/financeManager";
    }
    
    /**
     * 公告管理列表
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
}
