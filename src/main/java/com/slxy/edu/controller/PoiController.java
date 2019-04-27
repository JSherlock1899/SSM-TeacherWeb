package com.slxy.edu.controller;

import com.slxy.edu.util.CreateTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: TeacherWeb
 * @description: excel控制类
 * @author: Mr.Jiang
 * @create: 2019-04-27 14:07
 **/

public class PoiController {

    @Autowired
    CreateTemplate createTemplate;

    @RequestMapping("getTemplate")
    public void getTemplate(){
//        createTemplate.createExcel();
    }
}
