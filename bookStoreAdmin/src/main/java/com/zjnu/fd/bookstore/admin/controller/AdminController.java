package com.zjnu.fd.bookstore.admin.controller;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
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
    //设置好账号的ACCESS_KEY和SECRET_KEY
    String ACCESS_KEY = "5pmBeguvly5P3qNXys5hqxPGsiCvNN2du57qzwZd";
    String SECRET_KEY = "qvfFGEudpDbM3oyReNHK3au10toRZp1jJsuZv8DD";
    //要上传的空间
    String bucketname = "yangxuqiang";
    Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);

    //上传文件的路径
    String FilePath = "/book/";
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
        //上传到七牛后保存的文件名
        String key = new Date().getTime() + fileName.substring(fileName.lastIndexOf("."));
        //密钥配置
        //创建上传对象
        UploadManager uploadManager = new UploadManager();
        try {
            //调用put方法上传
            Response res = uploadManager.put(tempFile.getPath(), key, getUpToken());
            //打印返回的信息
            System.out.println(res.bodyString());
            StringMap stringMap = res.jsonToMap();
            return url+stringMap.get("key");
        } catch (QiniuException e) {
            Response r = e.response;
            // 请求失败时打印的异常的信息
            System.out.println(r.toString());
            try {
                //响应的文本信息
                System.out.println(r.bodyString());
            } catch (QiniuException e1) {
                //ignore
            }
        }
        return null;
    }

    public static File getFile(String fileName) {
        return new File(FILE_PATH, fileName);
    }
    public static final String FILE_PATH = "/imgs/";
    //简单上传，使用默认策略，只需要设置上传的空间名就可以了
    public String getUpToken(){
        return auth.uploadToken(bucketname);
    }
    String url="http://7xte4e.com2.z0.glb.clouddn.com/";
}
