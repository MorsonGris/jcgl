package com.xin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.xin.service.IHotMajorService;

/**
 * <p>
 *   热门专业控制器
 * </p>
 * @author com.xin
 * @since 2017-02-28
 */
@Controller
@RequestMapping("/stuFile")
public class HotMajorController {
    
    @Autowired private IHotMajorService hotMajorService;
    
}
