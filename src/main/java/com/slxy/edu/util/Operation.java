package com.slxy.edu.util;

import java.lang.annotation.*;

/**
 * @program: Annotation
 * @description:
 * @author: Mr.Jiang
 * @create: 2019-05-18 18:20
 **/


@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@Documented
public @interface Operation {

    String name();
}

