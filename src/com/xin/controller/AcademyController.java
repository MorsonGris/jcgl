package com.xin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.xin.service.IAcademyService;

/**
 * <p>
 *   前端控制器
 * </p>
 * @author com.xin
 * @since 2017-02-28
 */
@Controller
@RequestMapping("/academy")
public class AcademyController {
    
    @Autowired private IAcademyService academyService;
    
}
