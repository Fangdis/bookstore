/**
 * Created by Anaaaaaa on 2016/3/27.
 */
/**
 * 判断是否为空
 */
function isEmpty(data) {
    data = jQuery.trim(data);
    if (data == null || data.length == 0) {
        return true;
    } else
        return false;
}
