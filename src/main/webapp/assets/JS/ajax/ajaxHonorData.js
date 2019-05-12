/**
 * 用ajax对数据进行增删改
 */


$(document).on("click","#btn_update",function () {
    $("#myModalLabel").text("修改荣誉信息");
    $('#myModal').modal();
})


//新建信息
$(document).on("click",".saveNewMsg",function(){
	if(check()){
	alert('输入不合法！')
	return;
}
	var Hsn = $("#Hsn").val();
	var Hname = $("#Hname").val();
	var Hwinner = $("#Hwinner").val();
	var Hdate = $("#Hdate").val();
	var Hcompany = $("#Hcompany").val();
	var department = $("#department").val();
	var Hgrad = $('#Hgrad option:selected').val();
	var Hremarks = $("#Hremarks").val();
	$.ajax({
        url:"/honor/insertOne.do",
        type:"post",
        datatype:"json",
        data:{
            "Hsn" : Hsn,
            "Hname" : Hname,
            "Hwinner" :Hwinner,
            "Hdate" : Hdate,
            "Hcompany" : Hcompany,
            "department" : department,
            "Hgrad" : Hgrad,
            "Hremarks" :Hremarks,
        },
        
        success : function(result){
            alert("新建成功，请等待管理员审核！");
            location.reload();
        },
        error:function(result){  
            alert('请求出现错误...');  
        }
    });
});



//新建按钮的事件
$(document).on("click","#btn_add",function () {
    $("#myModalLabel").text("新建荣誉信息");
    $('#myModal').modal();
})

//修改信息按钮的事件
$(document).on("click","#btn_update",function () {
    $("#myModalLabel").text("修改荣誉信息");
    $('#myModal').modal();
})

$(document).on("click",".save",function(){
    if(check()){
        alert('输入不合法！')
        return;
    }
    var Hsn = $("#Hsn").val();
    var Hname = $("#Hname").val();
    var Hwinner = $("#Hwinner").val();
    var Hdate = $("#Hdate").val();
    var Hcompany = $("#Hcompany").val();
    var department = $("#department").val();
    var Hgrad = $('#Hgrad option:selected').val();
    var Hremarks = $("#Hremarks").val();
    $.ajax({
        url:"/honor/updateOne.do",
        type:"post",
        datatype:"json",
        data:{
            "Hsn" : Hsn,
            "Hname" : Hname,
            "Hwinner" :Hwinner,
            "Hdate" : Hdate,
            "Hcompany" : Hcompany,
            "department" : department,
            "Hgrad" : Hgrad,
            "Hremarks" :Hremarks,
        },

        success : function(result){
            alert("提交成功，请等待管理员审核！");
            location.reload();
        },
        error:function(result){
            alert('请求出现错误...');
        }
    });
});


//表单验证
function checkHsn(id,info){
    var uValue = document.getElementById(id).value.trim();
    if(!/^\d{1,20}$/.test(uValue)){
        document.getElementById(id+"span").innerHTML="<font color='red' size='2'>"+info+"</font>";
        document.getElementById(id+"div").style.display="block";
        return true
    }else{
        document.getElementById(id+"span").innerHTML="<font color='green' size='3'>输入格式正确</font>";
        return false
    }
}
function checkHname(id,info){
    var uValue = document.getElementById(id).value.trim();
    if(!/^.{1,15}$/.test(uValue)){
        document.getElementById(id+"span").innerHTML="<font color='red' size='2'>"+info+"</font>";
        document.getElementById(id+"div").style.display="block";
        return true
    }else{
        document.getElementById(id+"span").innerHTML="<font color='green' size='3'>输入格式正确</font>";
        return false
    }
}
function checkHwinner(id,info){
    var uValue = document.getElementById(id).value.trim();
    if(!/^.{1,50}$/.test(uValue)){
        document.getElementById(id+"span").innerHTML="<font color='red' size='2'>"+info+"</font>";
        document.getElementById(id+"div").style.display="block";
        return true
    }else{
        document.getElementById(id+"span").innerHTML="<font color='green' size='3'>输入格式正确</font>";
        return false
    }
}
function checkHcompany(id,info){
    var uValue = document.getElementById(id).value.trim();
    if(!/^.{1,16}$/.test(uValue)){
        document.getElementById(id+"span").innerHTML="<font color='red' size='2'>"+info+"</font>";
        document.getElementById(id+"div").style.display="block";
        return true
    }else{
        document.getElementById(id+"span").innerHTML="<font color='green' size='3'>输入格式正确</font>";
        return false
    }
}


function showTips(id,info){
    document.getElementById(id+"span").innerHTML="<font color='gray' size='2'>"+info+"</font>";
}
function check() {
    var check = checkHsn('Hsn','请按要求输入荣誉编号') || checkHname('Hname','请按要求输入荣誉名称') || checkHwinner('Hwinner','请按要求输入获奖者') || checkHcompany('Hcompany','请按要求输入颁发单位');
    return check;
}




//审核通过
$(document).on("click","#pass",function(){
    var Hsn = $('.Hsn').text();
    var message  = $('#message').val();
    $.ajax({
        url:"/honor/pass.do",
        type:"post",
        datatype:"json",
        data:{
            "majorkey" : Hsn,
            "message" : message,
        },
        success : function(result){
            alert("操作成功");
        },
        error:function(result){
            alert('请求出现错误...');
        }
    })
})

//审核不通过
$(document).on("click","#nopass",function(){
    var Hsn = $('.Hsn').text();
    var message  = $('#message').val();
    $.ajax({
        url:"/honor/nopass.do",
        type:"post",
        datatype:"json",
        data:{
            "majorkey" : Hsn,
            "message" : message,
        },
        success : function(result){
            alert("操作成功");
        },
        error:function(result){
            alert('请求出现错误...');
        }
    })
})

//上传文件

$(function () {
    initFileInput("uploadfile");
})

function initFileInput(ctrlName) {
    var control = $('#' + ctrlName);
    var Hname = $('#Hname').val().trim();
    var Hsn = $('#Hsn').val().trim();
    control.fileinput({
        language: 'zh', //设置语言
        uploadUrl: "/file/upload.do?model=honor&name=" + Hname + "&majorkey=" + Hsn, //上传的地址
        allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
        //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
        uploadAsync: true, //默认异步上传
        showUpload: true, //是否显示上传按钮
        showRemove : true, //显示移除按钮
        showPreview : true, //是否显示预览
        showCaption: false,//是否显示标题
        browseClass: "btn btn-primary", //按钮样式
        dropZoneEnabled: true,//是否显示拖拽区域
        //minImageWidth: 50, //图片的最小宽度
        //minImageHeight: 50,//图片的最小高度
        //maxImageWidth: 1000,//图片的最大宽度
        //maxImageHeight: 1000,//图片的最大高度
        //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
        //minFileCount: 0,
        //maxFileCount: 10, //表示允许同时上传的最大文件个数
        enctype: 'multipart/form-data',
        validateInitialCount:true,
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",

    }).on('filepreupload', function(event, data, previewId, index) {     //上传中
        var form = data.form, files = data.files, extra = data.extra,
            response = data.response, reader = data.reader;
        console.log('文件正在上传');
    }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功
        console.log('文件上传成功！'+data.id);

    }).on('fileerror', function(event, data, msg) {  //一个文件上传失败
        console.log('文件上传失败！'+data.id);


    })
}