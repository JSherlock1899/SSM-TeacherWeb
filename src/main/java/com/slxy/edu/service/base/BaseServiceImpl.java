package com.slxy.edu.service.base;

import com.slxy.edu.mapper.PatentMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @program: TeacherWeb
 * @description:
 * @author: Mr.Jiang
 * @create: 2019-04-21 16:12
 **/

public abstract class BaseServiceImpl<T> implements IBaseService<T> {

    @Autowired
    protected PatentMapper patentMapper;
}
