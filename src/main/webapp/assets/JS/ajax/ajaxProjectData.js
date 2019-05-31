/**
 * 用ajax对数据进行增删改
 */

//新建按钮的事件
$(document).on("click","#btn_add",function () {
    $("#myModalLabel").text("新建项目信息");
    $('#myModal').modal();
})


//重新编辑信息按钮的事件
$(document).on("click","#btn_update",function () {
    $("#myModalLabel").text("重新编辑专利信息");
    $('#myModal').modal();
})

//重新编辑信息
//获取重新编辑行当前每个表格单元的信息
$(document).on("click",".save",function(){
	if(check()){
		alert('输入不合法！');
		return;
	}
	var Psn = $('#Psn').val();
	var Pleader = $('#Pleader').val();
	var Pname = $('#Pname').val();
	var Pmember = $('#Pmember').val();
	var Pgrad = $('#Pgrad option:selected').val();
	var Pkind = $('#Pkind option:selected').val();
	var Pmoney = $('#Pmoney').val();
	var Pstatime = $('#Pstatime').val();
	var Pcondition = $('#Pcondition option:selected').val();
	var Pendtime = $('#Pendtime').val();
	var Premarks = $('#Premarks').val();
	$.ajax({
        url:"/TeacherWeb/project/updateOne.do",
        type:"post",
        datatype:"json",
        data:{
        	"Psn" : Psn,
            "Pleader" : Pleader,
            "Pname" :Pname,
            "Pmember" : Pmember,
            "Pgrad" : Pgrad,
            "Pkind" : Pkind,
            "Pmoney" :Pmoney,
            "Pstatime" : Pstatime,
            "Pcondition" : Pcondition,
            "Pendtime" : Pendtime,
            "Premarks" :Premarks,
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

//管理员修改信息
$(document).on("click",".alter",function(e,url){
    $("#myModalLabel").text("修改专利信息");
    $('#myModal').modal();
    $("#Psn").attr("value",$(this).closest("tr").find(".Psn").text());
    $("#Pname").attr("value",$(this).closest("tr").find(".Pname").text());
    $("#tname").attr("value",$(this).closest("tr").find(".tname").text());
    $("#Pmember").attr("value",$(this).closest("tr").find(".Pmember").text());
    $("#Pkind").attr("value",$(this).closest("tr").find(".Pkind").text());
    $("#Pmoney").attr("value",$(this).closest("tr").find(".Pmoney").text());
    $("#Pstatime").attr("value",$(this).closest("tr").find(".Pstatime").text());
    $("#Pcondition").attr("value",$(this).closest("tr").find(".Pcondition").text());
    $("#Pendtime").attr("value",$(this).closest("tr").find(".Pendtime").text());
    $("#Premarks").attr("value",$(this).closest("tr").find(".Premarks").text());
});

$(document).on("click",".alterSave",function(){
    if(check()){
        alert('输入不合法！');
        return;
    }
    var Psn = $('#Psn').val();
    var Pname = $('#Pname').val();
    var Pmember = $('#Pmember').val();
    var Pgrad = $('#Pgrad option:selected').val();
    var Pkind = $('#Pkind option:selected').val();
    var Pmoney = $('#Pmoney').val();
    var Pstatime = $('#Pstatime').val();
    var Pcondition = $('#Pcondition option:selected').val();
    var Pendtime = $('#Pendtime').val();
    var Premarks = $('#Premarks').val();
    $.ajax({
        url:"/TeacherWeb/project/alter.do",
        type:"post",
        datatype:"json",
        data:{
            "Psn" : Psn,
            "Pname" :Pname,
            "Pmember" : Pmember,
            "Pgrad" : Pgrad,
            "Pkind" : Pkind,
            "Pmoney" :Pmoney,
            "Pstatime" : Pstatime,
            "Pcondition" : Pcondition,
            "Pendtime" : Pendtime,
            "Premarks" :Premarks,
        },
        success : function(result){
            alert("修改成功！");
            location.reload();
        },
        error:function(result){
            alert('请求出现错误...');
        }
    });
});
//新建信息
$(document).on("click",".saveNewMsg",function(){
    if(check()){
        alert('输入不合法！');
        return;
    }
    var Psn = $('#Psn').val();
    var Pleader = $('#Pleader').val();
    var Pname = $('#Pname').val();
    var Pmember = $('#Pmember').val();
    var Pgrad = $('#Pgrad option:selected').val();
    var Pkind = $('#Pkind option:selected').val();
    var contractType = $('#contractType option:selected').val();
    var Pmoney = $('#Pmoney').val();
    var Pstatime = $('#Pstatime').val();
    var Pcondition = $('#Pcondition option:selected').val();
    var Pendtime = $('#Pendtime').val();
    var Premarks = $('#Premarks').val();
    $.ajax({
        url:"/TeacherWeb/project/insertOne.do",
        type:"post",
        datatype:"json",
        data:{
            "Psn" : Psn,
            "Pleader" : Pleader,
            "Pname" :Pname,
            "Pmember" : Pmember,
            "Pgrad" : Pgrad,
            "Pkind" : Pkind,
            "contractType" : contractType,
            "Pmoney" :Pmoney,
            "Pstatime" : Pstatime,
            "Pcondition" : Pcondition,
            "Pendtime" : Pendtime,
            "Premarks" :Premarks,
        },
        success : function(result){
            alert("提交成功");
            location.reload();
            //window.location.href = "";
        },
        error:function(result){
            alert('请求出现错误...');
        }
    });
});


//当类型是纵向时，隐藏合同类型
$(document).on("change","#Pkind",function(){
    var Pkind = $('#Pkind option:selected').val();
	if(Pkind =='横向' ){
        $(".contractTypediv").show();
	}else {
        $(".contractTypediv").hide();
	}
})



	function showTips(id,info){
		document.getElementById(id+"span").innerHTML="<font color='gray' size='2'>"+info+"</font>";
	}
	function checkPsn(id,info){
		var uValue = undefined ? '':document.getElementById(id).value.trim()
		if(!/^.{1,50}$/.test(uValue)){
			document.getElementById(id+"span").innerHTML="<font color='red' size='2'>"+info+"</font>";
			document.getElementById(id+"div").style.display="block";
			return true;

		}else{
			document.getElementById(id+"span").innerHTML="<font color='green' size='3'>输入格式正确</font>";
			return false;
		}
	}
	function checkPname(id,info){
		var uValue = undefined ? '' :document.getElementById(id).value.trim();
		if(!/^.{1,50}$/.test(uValue)){
			document.getElementById(id+"span").innerHTML="<font color='red' size='2'>"+info+"</font>";
			document.getElementById(id+"div").style.display="block";
			return true;
		}else{
			document.getElementById(id+"span").innerHTML="<font color='green' size='3'>输入格式正确</font>";
            return false;
		}
	}
	function checkPmoney(id,info){
		var uValue = undefined ? '' :document.getElementById(id).value.trim();
		if(!/^-?(\d|([1-9]\d+))(\.\d+)?$/.test(uValue)){
			document.getElementById(id+"span").innerHTML="<font color='red' size='2'>"+info+"</font>";
			document.getElementById(id+"div").style.display="block";
			return true;
		}else{
			document.getElementById(id+"span").innerHTML="<font color='green' size='3'>输入格式正确</font>";
            return false;
		}
	}

	function check() {
		var check = checkPsn('Psn','请按要求输入项目编号') || checkPname('Pname','请按要求输入项目名称') || checkPmoney('Pmoney','请按要求输入项目经费');
		return check;
    }


//审核通过
$(document).on("click","#pass",function(){
    var Psn = $('.Psn').text();
    var message  = $('#message').val();
    $.ajax({
        url:"/TeacherWeb/project/pass.do",
        type:"post",
        datatype:"json",
        data:{
            "majorkey" : Psn,
            "message" : message
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
    var Psn = $('.Psn').text();
    var message  = $('#message').val();
    $.ajax({
        url:"/TeacherWeb/project/nopass.do",
        type:"post",
        datatype:"json",
        data:{
            "majorkey" : Psn,
            "message" : message
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
    var Pname = undefined ? '' :$('#Pname').val().trim();
    var Psn = $('#Psn').val().trim();
    control.fileinput({
        language: 'zh', //设置语言
        uploadUrl: "/TeacherWeb/file/upload.do?model=project&name=" + Pname + "&majorkey=" + Psn, //上传的地址
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

$(document).on("click",".delete",function(e,url){
    var majorkey = $(this).closest("tr").find(".Psn").text();
    var boolean = todel();
    if (!boolean)
        return
    $.ajax({
        url:"/TeacherWeb/project/delete.do",
        type:"post",
        datatype:"json",
        data:{
            "majorkey" : majorkey
        },
        success : function(msg){
            alert("删除成功");
            $(e.target).closest("tr").fadeOut();
            window.location.reload();
        },
        error:function(msg){
            alert('请求出现错误...');
        }
    });
});