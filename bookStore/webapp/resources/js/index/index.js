var dataUrl={
	lastedUrl: '../data/index/index.json'
}
define(function(require, exports, module){
	var $=require('jquery');
	var a={
		lastedList: function(){
			$.ajax({
				url: dataUrl.lastedUrl,
				success: function(result){
					for(var i=0; i<lasted.length; i++){
						$("#lastedList").append('<div class="item"><img src="../../resources/images/temp/item/item1.jpg"><p class="money">￥+"lasted[i].money"+</p><p class="info">+"lasted[i].title"+</p></div>')
					}
				}
			})
		}
	}
	a.lastedList();
});