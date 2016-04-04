package com.zjnu.fd.bookstore.admin.util;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.log4j.Logger;

public class JsonUtil {

    private static ObjectMapper mapper = null;
    private static ThreadLocal<ObjectMapper> objMapperLocal = new ThreadLocal<ObjectMapper>() {
        @Override
        public ObjectMapper initialValue() {
            ObjectMapper OBJECT_MAPPER = new ObjectMapper();
            OBJECT_MAPPER.setSerializationInclusion(Include.NON_NULL);// 如果属性为null，不序列化成string
            OBJECT_MAPPER.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);// 当json有多余属性时，过滤掉此属性
            return OBJECT_MAPPER;
        }
    };
    /**
     * 日志输出类
     */
    private static Logger Log = Logger.getLogger(JsonUtil.class.getName());

    public static String object2string(Object obj) {
        if (mapper == null) {
            mapper = new ObjectMapper();
        }
        try {
            String json = mapper.writeValueAsString(obj);
            return json;
        } catch (Exception e) {
            Log.error(e.getMessage());
        }
        return null;
    }

    /**
     * JSON转成对象
     *
     * @param jsonString
     * @param clazz
     * @return
     */
    public static <T> T json2Object(String jsonString, Class<T> clazz) {
        try {
            return objMapperLocal.get().readValue(jsonString, clazz);
        } catch (Exception e) {
            Log.error(e.getMessage());
        }
        return null;
    }

}
