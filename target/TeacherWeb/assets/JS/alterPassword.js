/**
 * 对于修改密码的验证
 */
$(function(){
    saveJs();
})

function saveJs() {
    //页面进来点击的时候
    $('.save-js').on('click', function(e) {
        var isOk = true;
        if ($('.password-add').val() == '') {
            $('.js-hide-add').css('color', 'red');
        }
        //原密码
        if ($('.old-password').val() == '') {
            $('.old-error').remove();
            $('.old-password').after('<label class="js-hide-add old-error"> 请输入原密码</label>');
            $('.old-error').css('color', 'red');
            isOk = false;
        };
        //新密码
        if ($('.new-password').val() == '') {
            $('.new-error').remove();
            $('.new-password').after('<label class="js-hide-add new-error"> 6~16个字符，区分大小写</label>');
            $('.new-error').css('color', 'red');
            isOk = false;
        };

        var val = $('.new-password').val();
        //不等于val ；；截取两边的空格
        if (!/^[0-9a-zA-Z_]{6,15}$/.test(val) && $.trim(val) != '') {
            $('.new-error').remove();
            $('.new-password').after('<label class="js-hide-add new-error"> 请输入6~16个字符</label>');
            $('.new-error').css('color', 'red');
            isOk = false;
        };
        //确认密码（未填写）
        if ($('.con-password').val() == '') {
            $('.con-error').remove();
            $('.con-password').after('<label class="js-hide-add con-error"> 请再次填写密码</label>');
            $('.con-error').css('color', 'red');
            isOk = false;
        };
        //确认密码(不等于新密码)
        if ($.trim($('.con-password').val()) != '' && $('.con-password').val() != $('.new-password').val()) {
            $('.con-error').remove();
            $('.con-password').after('<label class="js-hide-add con-error"> 两次密码不一致</label>');
            $('.con-error').css('color', 'red');
            isOk = false;
        }
        if(!isOk){
        	e.preventDefault();
        }
       /* if (isOk) {
            $('#updatePassword').ajaxSubmit({
                success: function(data) {
                    if (data.status == "SUCCESS") {
                        layer.msg(data.message, {
                            icon: 1
                        });
                        window.location.href = rootPath + "/login?flag=login";
                    } else {
                        layer.msg(data.message, {
                            icon: 2
                        });
                    }
                }
            })
        } else {
            return;
        }*/
    });

    //原密码聚焦
    $('.old-password').on('focus', function() {
        $('.old-error').remove();
    });
    //新密码聚焦
    $('.new-password').on('focus', function() {
        $('.new-error').remove();
    })
    //确认密码
    $('.con-password').on('focus', function() {
        $('.con-error').remove();
    })
   
}