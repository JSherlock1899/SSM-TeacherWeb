package com.slxy.edu.controller;

import com.slxy.edu.service.*;
import com.slxy.edu.util.CommonUtils;
import com.slxy.edu.util.Operation;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import static com.slxy.edu.util.FileUtils.doZIP;

/**
 * @program: TeacherWeb
 * @description: 文件操作
 * @author: Mr.Jiang
 * @create: 2019-05-03 23:49
 **/

@Operation(name = "文件操作")
@Controller
@RequestMapping("file")
public class FileOperationController {


    @Autowired
    ITeacherService teacherService;
    @Autowired
    IProjectService projectService;
    @Autowired
    IPaperService paperService;
    @Autowired
    IHonorService honorService;
    @Autowired
    IPatentService patentService;
    @Autowired
    IOtherService otherService;

    /**
     *
     * @param response
     * @param request
     * @param model 模块名
     * @param majorkey 主键
     * @param name 文件名
     * @throws Exception
     */
    @Operation(name = "上传附件")
    @RequestMapping(value = "upload.do",method = RequestMethod.POST)
    @ResponseBody
    public void upload(HttpServletResponse response, HttpServletRequest request, String model, String majorkey, String name) throws Exception {
        String Tsn = (String) request.getSession().getAttribute("username");
        String Tname = (String) request.getSession().getAttribute("Tname");
        //获取教师所属学院
        String Cname = teacherService.selectCollegeByTsn(Tsn);
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        // 设置上传文件时 用到的临时文件的大小DiskFileItemFactory
        factory.setSizeThreshold(10240);// 设置临时的缓冲文件大小为10
        // 控制上传单个文件的大小 20000KB ServletFileUpload
        upload.setSizeMax(2097152);// 字节B
        // 通过parseRequest解析form中的所有请求字段，并保存到 items集合中
        // 文件就保存在了items中
        PrintWriter out = response.getWriter();
        List<FileItem> items;
        try {
            items = upload.parseRequest(request);
            // 遍历items中的数据
            Iterator<FileItem> iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = iter.next();
                if (!item.isFormField()) {
                    String fileName = item.getName();
                    String ext = fileName.substring(fileName.indexOf(".") + 1);

                    String path = "D:\\uploadFile";
                    path = path + "\\" + Cname;
                    File fileupload = new File(path);
                    if (!fileupload.exists()) {
                        fileupload.mkdir();
                    }
                    path = path + "\\" + Tname;
                    fileupload = new File(path);
                    if (!fileupload.exists()) {
                        fileupload.mkdir();
                    }
                    path = path + "\\" + name;
                    fileupload = new File(path);
                    if (!fileupload.exists()) {
                        fileupload.mkdir();
                    }
                    File file = new File(path, fileName);
                    item.write(file);// 上传
                    //保存文件路径
                    if(model.equals("project")) {
                        projectService.savePath(majorkey, path);
                    }else if(model.equals("paper")) {
                        paperService.savePath(majorkey, path);
                    }else if(model.equals("honor")) {
                        honorService.savePath(majorkey, path);
                    }else if(model.equals("patent")) {
                        patentService.savePath(majorkey, path);
                    }else if(model.equals("other")) {
                        otherService.savePath(majorkey, path);
                    }
                    
                }

            }
        }catch (FileUploadBase.SizeLimitExceededException e) {// SizeLimitExceededException是FileUploadException的一个子类
        } catch (FileUploadException e) {
            e.printStackTrace();
            out.print("<script>alert('上传文件大小超过限制！最大20000KB！')</script>");
        } catch (Exception e) {// 解析请求
            e.printStackTrace();
        }
        // 返回给fileinput的json数据
        response.setContentType("application/json;charset=utf-8");// 指定返回的格式为JSON格式
        response.setCharacterEncoding("UTF-8");// setContentType与setCharacterEncoding的顺序不能调换，否则还是无法解决中文乱码的问题
        String StringjsonStr = "{\"key\":\"fileuploaded\"}";
        out = response.getWriter();
        out.write(StringjsonStr);
        out.close();
        return;
    }


    /**
     *
     * @param response
     * @param model 模块名
     * @param majorkey 主键
     * @param name 文件名
     * @throws Exception
     */
    @Operation(name = "下载附件")
    @RequestMapping(value = "download.do" ,method = RequestMethod.GET)
    @ResponseBody
    public void download(HttpServletResponse response, String model, String majorkey, String name) throws IOException {
        //下载文件，需要设置消息头
        String path = null;
        majorkey = majorkey.trim();
        System.out.println("majorkey的值是：" + majorkey + ".当前方法:FileOperationController.download()");
        System.out.println("model的值是：" + model + ".当前方法:FileOperationController.download()");
        System.out.println("name的值是：" + name + ".当前方法:FileOperationController.download()");
        //根据不同的类别分别获取对应的附件路径
        if(model.equals("project")) {
            path = projectService.getPath(majorkey);
        }else if(model.equals("paper")) {
            path = paperService.getPath(majorkey);
        }else if(model.equals("honor")) {
            path = honorService.getPath(majorkey);
        }else if(model.equals("patent")) {
            path = patentService.getPath(majorkey);
        }else if(model.equals("other")) {
            path = otherService.getPath(majorkey);
        }
        if(path == null || path.equals("null")) {
            PrintWriter out = response.getWriter();
            out.flush();
            out.print("<script>alert('附件路径错误！')</script>");
        }
        CommonUtils util = new CommonUtils();
        ArrayList<File> fileList = new ArrayList<>();
        File [] tarFile = util.getFiles(fileList, path); //将多个文件放入File数组

        String zipName;
        try {
            zipName = doZIP("zipname",tarFile);
            //这里，我写了一个将多个文件打包为zip的方法doZip()，doZip()返回生成的zip路径

            response.setCharacterEncoding("utf-8");//设置编码统一
            response.setContentType("multipart/form-data");//设置multipart
            //响应头部
            response.setHeader("Content-disposition", "attachment;filename=order_" + name + ".zip");
            InputStream inputStreamzip = new FileInputStream(new File(zipName));//通过zip路径实例化inputStream流

            OutputStream os = response.getOutputStream();
            byte[] b = new byte[2048];
            int length;
            while ((length = inputStreamzip.read(b)) > 0) {
                os.write(b, 0, length);
            }
            os.close();
            inputStreamzip.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

