
/*
Copyright © 2015 HTML5andBeyond.com
Licensed Under MIT
*/

(function ( $ ) {
 
    $.fn.lbyl = function( options ) {
 
        var s = $.extend({
            content: '',
            speed: 10,
            type: 'fade',
            fadeSpeed: 500,
            finished: function(){}
        }, options );

        var elem = $(this),
            letterArray = [],
            lbylContent = s.content,
            count = $(this).length;
        
        elem.empty();
        elem.attr('data-time', lbylContent.length * s.speed)
                                
        for (var i = 0; i < lbylContent.length; i++) {
            letterArray.push(lbylContent[i]);
        }
            
        $.each(letterArray, function(index, value) {
        elem.append('<span style="display: none;">' + value + '</span>');

            setTimeout(function(){
                if (s.type == 'show') {
                    elem.find('span:eq(' + index + ')').show();
                } else if (s.type == 'fade') {
                   elem.find('span:eq(' + index + ')').fadeIn(s.fadeSpeed); 
                }
            }, index * s.speed);

        });

        setTimeout(function(){
            s.finished();
        }, lbylContent.length * s.speed);
        
    };
 
}( jQuery ));
(function(){
    var init = function(){
        var updateOrientation = function(){//方向改变执行的函数
            var orientation = window.orientation;
            switch(orientation){
                case 90:
                case -90:
                    orientation = 'landscape'; //这里是横屏
                    break;
                default:
                    orientation = 'portrait'; //这里是竖屏
                    break;
            }
            //html根据不同的旋转状态，加上不同的class，横屏加上landscape，竖屏
            //加上portrait
            document.body.parentNode.setAttribute('class',orientation);
        };
        // 每次旋转，调用这个事件。
        window.addEventListener('orientationchange',updateOrientation,false);
        // 事件的初始化
        updateOrientation();
    };
    window.addEventListener('DOMContentLoaded',init,false);
})();
window.addEventListener('orientationchange',function(){
    if(window.orientation == '90'){
        $("#heng").css("display","block");
    }else{
        $("#heng").css("display","none");
    }
},false);