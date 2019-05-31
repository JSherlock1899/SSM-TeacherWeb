package com.slxy.edu.util;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @program: TeacherWeb
 * @description: 通用工具类
 * @author: Mr.Jiang
 * @create: 2019-04-27 13:42
 **/

public class CommonUtils {

    public void download(String path, HttpServletResponse response) {
        try {
            // path是指欲下载的文件的路径。
            File file = new File(path);
            // 取得文件名。
            String filename = file.getName();
            // 以流的形式下载文件。
            InputStream fis = new BufferedInputStream(new FileInputStream(path));
            byte[] buffer = new byte[fis.available()];
            fis.read(buffer);
            fis.close();
            // 清空response
            response.reset();
            // 设置response的Header
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.addHeader("Content-Disposition", "attachment;filename=" + filename + ".xls");
            OutputStream toClient = new BufferedOutputStream(
                    response.getOutputStream());
            response.setContentType("application/vnd.ms-excel;charset=gb2312");
            toClient.write(buffer);
            toClient.flush();
            toClient.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }


    //将结果集转化成map
    public Map<String,Integer> countRsToMap(ResultSet rs) throws SQLException {
        Map<String,Integer> map = new HashMap<String,Integer>();
        while(rs.next()) {
            map.put(rs.getString("Cname"), rs.getInt("count"));
        }
        return map;
    }

    public Map<String,Integer> collegeCountRsToMap(ResultSet rs) throws SQLException{
        Map<String,Integer> map = new HashMap<String,Integer>();
        while(rs.next()) {
            map.put(rs.getString("Dname"), rs.getInt("count"));
        }
        return map;
    }

    //各院的经费统计
    public Map<String,Integer> moneyRsToMap(ResultSet rs) throws SQLException{
        Map<String,Integer> map = new HashMap<String,Integer>();
        while(rs.next()) {
            map.put(rs.getString("Cname"), rs.getInt("Pmoney"));
        }
        return map;
    }

    //各专业的经费统计
    public Map<String,Integer> countMoneyRsToMap(ResultSet rs) throws SQLException{
        Map<String,Integer> map = new HashMap<String,Integer>();
        while(rs.next()) {
            map.put(rs.getString("Dname"), rs.getInt("Pmoney"));
        }
        return map;
    }

    public static String disposeAuditValue(String audit) {
        System.out.println("audit的值是：" + audit + ".当前方法:CommonUtils.disposeAuditValue()");
        if(audit!=null) {
            if(audit.equals("0")) {
                return "未审核";
            }else if(audit.equals("1")) {
                return "审核通过";
            }else if(audit.equals("2")) {
                return "审核未通过";
            }
        }
        return "系统出错！";
    }

    public static String disposeMessageValue(String message) {
        if(message == null) {
            return "无";
        }
        return message;
    }

    //获取一个文件夹下的所有文件
    public File[] getFiles(ArrayList<File> fileList, String path) {
        File[] allFiles = new File(path).listFiles();
        for (int i = 0; i < allFiles.length; i++) {
            File file = allFiles[i];
            if (file.isFile()) {
                fileList.add(file);
            } else  {
                getFiles(fileList, file.getAbsolutePath());
            }
        }
        return allFiles;

    }

    //判断时间格式是否正确
    public static boolean judgeDate(String str){
        if(str.equals(""))
            return true;
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try{
            str = formatDate(str);
            if ("false".equals(str)){
                return false;
            }
            Date date = formatter.parse(str);
            return true;
        }catch(Exception e){
            return false;
        }
    }

    //转化时间格式
    public static String formatDate(String s) {
        java.util.Date date;
        // 首先设置"Mon Dec 28 00:00:00 CST 2008"的格式,用来将其转化为Date对象
        DateFormat df = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.US);
        //将已有的时间字符串转化为Date对象
        try {
            date = df.parse(s);
        }catch (Exception e){
            return "false";
        }
        // 创建所需的格式
        df = new SimpleDateFormat("yyyy-MM-dd");
        return df.format(date);// 获得格式化后的日期字符串
    }

    /**
     * 判断是否是数字
     */
    public static boolean isNumeric(String str) {
        try{
            if("".equals(str))
                return true;
            Float.parseFloat(str);
            return true;
        }catch(NumberFormatException e) {
            return false;
        }
    }

    /**
     * 处理浮点数
     */
    private static String formattedOutputDecimal(Float decimal) {
        DecimalFormat df=new DecimalFormat("######0.00");
        String result=df.format(decimal);
        return result;
    }
}
