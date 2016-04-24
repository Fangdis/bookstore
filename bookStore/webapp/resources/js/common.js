/**
 * Created by xqYang on 2016/4/23.
 */
$(document).ready(function(){
    $('#searchForm').submit(function(){
        if($('#searchText').val()==''||$('#searchText').val()==undefined){
            wx.alert('搜索内容为空');
            return false;
        }

    });
    $('.searchTab li').click(function(){
        $(this).addClass('active').siblings().removeClass('active');
        if($(this).index()==1){
            $("#searchFlag").val(2);
        }else
            $("#searchFlag").val(1);
    });
});

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