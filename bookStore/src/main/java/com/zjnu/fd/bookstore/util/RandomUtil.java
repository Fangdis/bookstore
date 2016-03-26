package com.zjnu.fd.bookstore.util;

import java.util.Random;

/**
 * Created by xqYang on 2016/3/26.
 */
public class RandomUtil {
    public static String randCode(){
        Random random=new Random();
        StringBuilder stb=new StringBuilder();
        for (int i=0;i<4;i++){
            stb.append(random.nextInt(10));
        }
        return stb.toString();
    }
}
