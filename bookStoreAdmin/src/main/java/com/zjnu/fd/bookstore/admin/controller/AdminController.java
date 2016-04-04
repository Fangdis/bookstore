package com.zjnu.fd.bookstore.admin.controller;

import com.zjnu.fd.bookstore.admin.util.OutPut;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by xqYang on 2016/4/3.
 */
@RequestMapping("admin")
@Controller
public class AdminController {
    @RequestMapping("upLoadPhoto")
    @ResponseBody
    public String upLoadUserPhoto( HttpServletRequest request){
        Map map=new HashMap();
        try {
            CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
            //判断 request 是否有文件上传,即多部分请求
            if(multipartResolver.isMultipart(request)) {
                //转换成多部分request
                MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
                //取得request中的所有文件名
                Iterator<String> fileNames = multiRequest.getFileNames();
                String filePath = null;
                while(fileNames.hasNext()) {
                    MultipartFile file = multiRequest.getFile(fileNames.next());
                    filePath = uploadFile(file, request);
                }

                map.put("filePath", filePath);
                return OutPut.json(200, "success", map, 0);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
    private  String uploadFile(MultipartFile file, HttpServletRequest request) throws IOException {
        String fileName = file.getOriginalFilename();
        String path=request.getServletContext().getRealPath("/imgs/");
        File tempFile = new File(path, new Date().getTime() + fileName.substring(fileName.lastIndexOf(".")));
        if (!tempFile.getParentFile().exists()) {
            tempFile.getParentFile().mkdir();
        }
        if (!tempFile.exists()) {
            tempFile.createNewFile();
        }
        file.transferTo(tempFile);
        return FILE_PATH + tempFile.getName();
    }

    public static File getFile(String fileName) {
        return new File(FILE_PATH, fileName);
    }
    public static final String FILE_PATH = "/imgs/";
}
