package com.zjnu.fd.bookstore.admin.util;

import java.util.HashMap;

public class OutPut {

    /**
     * @param code  错误码
     * @param info  错误描述
     * @param obj   返回数据(pojos)
     * @param count 返回数据(pojos总数)
     * @return String json
     */
    public static String json(int code, String info, Object obj, int count) {
        HashMap<String, Object> data = new HashMap();
        data.put("pojos", obj);
        data.put("count", count);

        HashMap<String, Object> result = new HashMap();
        result.put("status", code == 200 ? "success" : "error");
        result.put("desc", info);
        result.put("data", data);
        result.put("code", code);
        return JsonUtil.object2string(result);
    }

    /**
     * 返回值格式化
     *
     * @param status 状态码  0成功，其他失败
     * @param data   返回数据
     * @param total  数据总数
     * @param errors 所有错误
     * @return
     */
    public static String json(int status, Object data, int total, Object errors) {
        HashMap<String, Object> result = new HashMap();
        result.put("status", status);
        result.put("message", status == 0 ? "success" : "failure");
        result.put("total", total);
        result.put("data", data == null ? "" : data);
        result.put("errors", errors);
        return JsonUtil.object2string(result);
    }

    /**
     * @param code
     * @param info
     * @param data
     * @return String xml
     */
    public static String xml(int code, String info, Object data) {
        HashMap<String, Object> result = new HashMap();
        result.put("status", code > 0 ? "error" : "success");
        result.put("desc", info);
        result.put("data", data);
        result.put("code", code);
        return "<>";
    }
}