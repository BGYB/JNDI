/**
 * Created by Zhouyuqing on 17-4-26.
 */
//client

$('.ok').on('click', function(){
    layer.msg('数据已保存！');
});

$('.tij').on('click', function(){
    layer.msg('数据已提交！');
});

$('.del').on('click', function(){
    layer.confirm('请确认删除！', {
        btn: ['删除','取消'] //按钮
    }, function(){
        layer.msg('已删除！', {icon: 1});
    });
});

$('.print').on('click',function(){
    window.print();
});

$('.item-success').on('click', function(){
    layer.confirm('确定是否生成！', {
        btn: ['确定','取消'] //按钮
    }, function(){
        layer.msg('恭喜你立项成功！', {icon: 1});
        $('.item-success-box').css('display','block');
    });
});

$('.xg-bc').on('click', function(){
    layer.confirm('确定是否保存！', {
        btn: ['确定','取消'] //按钮
    }, function(){
        layer.msg('恭喜你修改完成！', {icon: 1});
        $('.item-xg-box').css('display','block');
    });
});

//判断屏幕宽度添加row让input换行
var windowWidth = document.documentElement.clientWidth;
//alert(windowWidth);
if(windowWidth <= 768){
	$('.addRow-add').append("</div><div class='row'>");
}
$('.more').on('click',function(){
    layer.open({
        type: 2,
        title: '详细信息',
        shadeClose: true,
        scrollbar: false,
        shade: 0.8,
        area: ['380px', '60%'],
        content: '../../form/page/form.jsp'
    });
});

$('.bill').on('click',function(){
    layer.open({
        type: 2,
        title: '客户开票信息（专用发票）',
        shadeClose: true,
        scrollbar: false,
        shade: 0.8,
        area: ['380px', '68%'],
        content: '../../form/page/bill.jsp'
    });
});

/*//more
$("#more").click(function(){
    if($("#new-more").css("display")=="none"){

        $("#new-more").show();
        $("#more").attr("value","隐藏");

    }else{

        $("#new-more").hide();
        $("#more").attr("value","更多");
    }

});*/



