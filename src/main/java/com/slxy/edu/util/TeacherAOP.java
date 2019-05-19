package com.slxy.edu.util;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

/**
 * @program: Annotation
 * @description:AOP 切面编程，结合日志框架
 * @author: Mr.Jiang
 * @create: 2019-05-18 18:21
 **/

@Component
@Aspect
public class TeacherAOP {

    private Logger logger = LoggerFactory.getLogger(TeacherAOP.class);

    @Pointcut("execution(* com.slxy.edu.controller.*.*(..))")
    public void method(){
    }

    @After("method()")
    public void after(JoinPoint joinPoint){

    }

    @AfterReturning("method()")
    public void afterReturning(JoinPoint joinPoint){
        // 1:在切面方法里面获取一个request，
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        // 2:通过springAOP切面JoinPoint类对象，获取该类，或者该方法，或者该方法的参数
        Class<? extends Object> clazz =  joinPoint.getTarget().getClass();
        String controllerOperation = clazz.getName();
        if(clazz.isAnnotationPresent(Operation.class)){
            // 当前controller操作的名称
            controllerOperation = clazz.getAnnotation(Operation.class).name();
        }
        // 获取当前方法
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        // clazz类下的所有方法
        Method[] methods = clazz.getDeclaredMethods();
        String methodOperation = "";
        for (Method m : methods) {
            if(m.equals(method)){
                methodOperation = m.getName();
                if(m.isAnnotationPresent(Operation.class)){
                    methodOperation = m.getAnnotation(Operation.class).name();
                }
            }
        }
        String username = (String) request.getSession().getAttribute("username");
        if(username != null){
            logger.info(username + " 执行了 " + controllerOperation + " 下的  " + methodOperation + " 操作！ ip地址为"
                    + request.getRemoteHost());
        }else{
            logger.info("未知用户 执行了 " + controllerOperation + " 下的  " + methodOperation + " 操作！ ip地址为"
                    + request.getRemoteHost());
        }

    }

}

