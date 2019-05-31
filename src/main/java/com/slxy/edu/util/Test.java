package com.slxy.edu.util;

import java.text.DecimalFormat;
import java.text.NumberFormat;

/**
 * @program: TeacherWeb
 * @description:
 * @author: Mr.Jiang
 * @create: 2019-05-06 22:31
 **/

public class Test {

    private static String formattedOutputDecimal(double decimal)
    {
        DecimalFormat df=new DecimalFormat("######0.00");
        String result=df.format(decimal);
        return result;
    }

    private static String formattedDecimalToPercentage(double decimal)
    {
        //获取格式化对象
        NumberFormat nt = NumberFormat.getPercentInstance();
        //设置百分数精确度2即保留两位小数
        nt.setMinimumFractionDigits(2);
        return nt.format(decimal);
    }

    public static void main(String[] args){
        double d=0.21343254;

        String result=formattedOutputDecimal(d);
        System.out.println("result = "+result);

        String result2=formattedDecimalToPercentage(d);
        System.out.println("result = "+result2);
    }





}
