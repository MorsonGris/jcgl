package com.xin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.xin.service.IRelationService;

/**
 * @description: 联系方式管理
 * @author: Mr. Lin
 * @date: 2017-03-01
 */
@Controller
@RequestMapping("/relation")
public class RelationController {
    
    @Autowired private IRelationService relationService;
    
    /**
     * 联系管理页
     * @return
     * */
    @GetMapping("/manager")
    public String manager() {
        return "admin/relation/relationManager";
    }

}
