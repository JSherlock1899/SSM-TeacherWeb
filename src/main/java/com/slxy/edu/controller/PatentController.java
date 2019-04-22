package com.slxy.edu.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.slxy.edu.controller.base.BaseController;
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
 * @description:专利模块
 * @author: Mr.Jiang
 * @create: 2019-04-19 22:14
 **/

@Controller
@RequestMapping("patent")
public class PatentController extends BaseController<Patent>{

    @Autowired
    IPatentService patentService;

    @RequestMapping(PATENT)
    public ModelAndView findPatent(@RequestParam(required = false,defaultValue = "1",value = "pn")Integer pn,
                                   Map<String,Object> map,String cname, String dname, String starttime, String endtime, String tname){
        System.out.println(".....................");
        //引入分页查询，使用PageHelper分页功能
        //在查询之前传入当前页，然后多少记录
        PageHelper.startPage(pn,5);
        //startPage后紧跟的这个查询就是分页查询
        List<Patent> patents = patentService.selectAll(cname,dname,starttime,endtime,tname);
        System.out.println("cname的值是：" + cname + ".当前方法:PatentController.findPatent()");
        System.out.println("dname的值是：" + dname + ".当前方法:PatentController.findPatent()");
        System.out.println("starttime的值是：" + starttime + ".当前方法:PatentController.findPatent()");
        System.out.println("endtime的值是：" + endtime + ".当前方法:PatentController.findPatent()");
        System.out.println("tname的值是：" + tname + ".当前方法:PatentController.findPatent()");
        System.out.println(patents.get(1).getPatsn());
        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
        PageInfo pageInfo = new PageInfo<>(patents,5);
        for (Patent patent : patents){
            System.out.println("patents的值是：" + patent.getPatname() + ".当前方法:PatentController.findPatent()");
        }
        //pageINfo封装了分页的详细信息，也可以指定连续显示的页数
        map.put("pageInfo",pageInfo);
        ModelAndView mv = new ModelAndView();
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("patents",patents);
        mv.setViewName(PATENT_PAGE);
        return mv;
    }


}
