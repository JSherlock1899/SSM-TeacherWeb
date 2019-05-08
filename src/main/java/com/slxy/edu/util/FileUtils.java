package com.slxy.edu.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * @program: TeacherWeb
 * @description: 文件操作工具类
 * @author: Mr.Jiang
 * @create: 2019-05-04 13:05
 **/

public class FileUtils {

    /**
     * 文件打包zip
     * @param zipname
     * @param files
     * @return
     * @throws Exception
     */
    public static String doZIP(String zipname, File[] files) throws Exception{
        //doZIP(命名的打包文件名，传递过来的File数组)
        byte[] buffer = new byte[1024];
        String strZipName = zipname;
        ZipOutputStream out = new ZipOutputStream(new FileOutputStream(strZipName));
        for(int i=0;i<files.length;i++) {
            FileInputStream fis = new FileInputStream(files[i]);
            out.putNextEntry(new ZipEntry(files[i].getName()));
            int len;
            //读入需要下载的文件的内容，打包到zip文件
            while((len = fis.read(buffer))>0) {
                out.write(buffer,0,len);
            }
            out.closeEntry();
            fis.close();
        }
        out.close();
        return strZipName;
    }
}
