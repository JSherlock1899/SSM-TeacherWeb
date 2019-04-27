package com.slxy.edu.util;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @program: TeacherWeb
 * @description: 通用工具类
 * @author: Mr.Jiang
 * @create: 2019-04-27 13:42
 **/

public class CommonUtil {

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
            response.addHeader("Content-Disposition", "attachment;filename="
                    + new String(filename.getBytes()));
            response.addHeader("Content-Length", "" + file.length());
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

    public String disposeAuditValue(String audit) {
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

    public String disposeMessageValue(String message) {
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

//	//处理学院名
//	public String disposeCollegeName(String college) {
//		if(college!=null) {
//			if(college.equals("")) {
//				System.out.println("college1 = " + college);
//				return "null";
//			}
//			System.out.println("college111 = " + college);
//		}else {
//			System.out.println("college11 = " + college);
//			return college;
//		}
//		return college;
//	}

    public String disposeDate(java.util.Date date) {
        if(date == null) {
            return "null";
        }
        return null;
    }
}
