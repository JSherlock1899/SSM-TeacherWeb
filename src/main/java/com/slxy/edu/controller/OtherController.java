package com.slxy.edu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.slxy.edu.controller.base.BaseController;
import com.slxy.edu.model.Condition;
import com.slxy.edu.model.Other;
import com.slxy.edu.service.IOtherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @program: TeacherWeb
 * @description: 其他模块
 * @author: Mr.Jiang
 * @create: 2019-04-21 16:26
 **/

@Controller
@RequestMapping("other")
public class OtherController extends BaseController<Other>{

    @Autowired
    IOtherService otherService;

    @RequestMapping(OTHER)
    public ModelAndView findOther(@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn,
                                   Map<String,Object> map, String cname, String dname, String starttime, String endtime, String tname){
        //引入分页查询，使用PageHelper分页功能
        //在查询之前传入当前页，然后多少记录
        PageHelper.startPage(pn,5);
        //startPage后紧跟的这个查询就是分页查询
        List<Other> others = otherService.selectAll(cname.trim(),dname,starttime,endtime,tname);
//        System.out.println("Others的值是：" + Others.size() + ".当前方法:OtherController.findOther()");
        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
        PageInfo pageInfo = new PageInfo<>(others,5);
        //pageINfo封装了分页的详细信息，也可以指定连续显示的页数
        map.put("pageInfo",pageInfo);
        ModelAndView mv = new ModelAndView();
        mv.addAllObjects(map);
        mv.addObject("others",others);
        Condition condition = new Condition(cname,dname,starttime,endtime,tname);
        mv.addObject("condition",condition);
        mv.setViewName(OTHER_PAGE);
        return mv;
    }
}
