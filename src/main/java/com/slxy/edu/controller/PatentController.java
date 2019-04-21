package com.slxy.edu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.slxy.edu.model.Patent;
import com.slxy.edu.service.IPatentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @program: TeacherWeb
 * @description:
 * @author: Mr.Jiang
 * @create: 2019-04-19 22:14
 **/

@Controller
@RequestMapping("patent")
public class PatentController {

    @Autowired
    IPatentService patentService;

    @RequestMapping(value="findPatent.do")

    public ModelAndView list(@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn,

                             Map<String,Object> map){


        //引入分页查询，使用PageHelper分页功能

        //在查询之前传入当前页，然后多少记录

        PageHelper.startPage(pn,5);

        //startPage后紧跟的这个查询就是分页查询

        List<Patent> patents = patentService.selectAll();



        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以

        PageInfo pageInfo = new PageInfo<>(patents,5);

        //pageINfo封装了分页的详细信息，也可以指定连续显示的页数

        map.put("pageInfo",pageInfo);

        ModelAndView mv = new ModelAndView();
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("patents",patents);
        mv.setViewName("admin/patent/patentList");

        return mv;

    }


}
