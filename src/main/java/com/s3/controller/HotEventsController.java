package com.s3.controller;

import com.s3.pojo.HotEvents;
import com.s3.service.impl.HotEventsServiceImpl;
import com.s3.util.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
public class HotEventsController {

    @Resource
    HotEventsServiceImpl hotEventsService;

    @RequestMapping("/page")
    public String page(@RequestParam(value = "pageIndex",required = true,defaultValue = "1") Integer pageIndex,
                       @RequestParam(value = "keyWord",required = false) String keyWord,
                       Model model){
        PageUtil<HotEvents> page = hotEventsService.get4Page(keyWord, pageIndex, 2);
        model.addAttribute("page",page);
        return "index";
    }

    @RequestMapping("/list")
    @ResponseBody
    public PageUtil list(@RequestParam(value = "pageIndex",required = true,defaultValue = "1") Integer pageIndex,
                         @RequestParam(value = "keyWord",required = false) String keyWord){
        PageUtil<HotEvents> page = hotEventsService.get4Page(keyWord, pageIndex, 2);
        return page;
    }

}
