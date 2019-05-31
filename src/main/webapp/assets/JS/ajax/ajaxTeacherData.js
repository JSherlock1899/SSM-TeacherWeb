/**
 * 对教师信息进行操作
 */



$(document).on("click",".update",function(e,url){
    $("#myModalLabel").text("修改教师信息");
    $('#myModal').modal();
	$("#Tsn").attr("value",$(this).closest("tr").find(".Tsn").text());
	$("#Tname").attr("value",$(this).closest("tr").find(".Tname").text());
	$("#Tsex").attr("value",$(this).closest("tr").find(".Tsex").text());
	$("#Tdegree").attr("value",$(this).closest("tr").find(".Tdegree").val());
	$("#Tresdirection").attr("value",$(this).closest("tr").find(".Tresdirection").text());
	$("#Tedubackground").attr("value",$(this).closest("tr").find(".Tedubackground").text());
	$("#Tdateofbirth").attr("value",$(this).closest("tr").find(".Tdateofbirth").text());
	$("#JobTitle").attr("value",$(this).closest("tr").find(".JobTitle").text());
    // $("#Cname option[value='" + $(this).closest("tr").find(".Cname").text() + "']").attr("selected", true);
    // $("#sdept option[value='" + $(this).closest("tr").find(".Dname").text() + "']").attr("selected", true);
});




$(document).on("click",".save",function(e,url){
	var Tsn = $('#Tsn').val();
	var Tname = $('#Tname').val();
	var Tsex = $('#Tsex').val();
	var Tdegree = $('#Tdegree').val();
	var Tdateofbirth = $('#Tdateofbirth').val();
	var Tedubackground = $('#Tedubackground').val();
	var Tresdirection = $('#Tresdirection').val();
	var JobTitle = $('#JobTitle option:selected').val();
	var Cname = $('#Cname option:selected').val();
	var Dname = $('#sdept option:selected').val();
	$.ajax({
		url:"/TeacherWeb/teacher/updateOne.do",
		type:"post",
		datatype:"json",
		data:{
			"Tsn" : Tsn,
            "Tname" : Tname,
            "Tsex" :Tsex,
            "Tdegree" : Tdegree,
            "Tedubackground" : Tedubackground,
            "Tresdirection" : Tresdirection,
            "Tdateofbirth" : Tdateofbirth,
            "JobTitle" : JobTitle,
            "Cname" : Cname,
            "Dname" :Dname,
		},
		success : function(msg){
			
			alert("修改成功");
			window.location.reload();
		},
		error:function(msg){  
			alert('请检查所属学院和专业');
		}
	});
});


//审核
//审核按钮的事件
$(document).on("click",".audit",function () {
    var Tsn = $(this).closest("tr").find(".Tsn").text()
    $("#myModalLabel").text("审核教师信息");
    $('#myModal').modal();
    $(document).on("click","#pass",function(){
        var message  = $('#message').val();
        $.ajax({
            url:"/TeacherWeb/teacher/pass.do",
            type:"post",
            datatype:"json",
            data:{
                "majorkey" : Tsn,
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

// 审核不通过
    $(document).on("click","#nopass",function(){
        var message  = $('#message').val();
        $.ajax({
            url:"/TeacherWeb/teacher/nopass.do",
            type:"post",
            datatype:"json",
            data:{
                "majorkey" : Tsn,
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
})

// 审核通过

function showTips(id,info){
    document.getElementById(id+"span").innerHTML="<font color='gray' size='2'>"+info+"</font>";
}
function checkTsn(id,info){
    var uValue = document.getElementById(id).value;
    if(!/^\d{1,6}$/.test(uValue)){
        document.getElementById(id+"span").innerHTML="<font color='red' size='2'>"+info+"</font>";
        document.getElementById(id+"div").style.display="block";
        return true
    }else{
        document.getElementById(id+"span").innerHTML="<font color='green' size='3'>输入格式正确</font>";
        return false
    }
}
function checkTname(id,info){
    var uValue = document.getElementById(id).value;
    if(!/^.{1,10}$/.test(uValue)){
        document.getElementById(id+"span").innerHTML="<font color='red' size='2'>"+info+"</font>";
        document.getElementById(id+"div").style.display="block";
        return true
    }else{
        document.getElementById(id+"span").innerHTML="<font color='green' size='3'>输入格式正确</font>";
        return false
    }
}

function check() {
    var check = checkTsn('Tsn','请按要求输入教师工号') || checkTname('Tname','请按要求输入教师姓名');
    return check;
}

$(document).on("click",".delete",function(e,url){
    var majorkey = $(this).closest("tr").find(".Tsn").text();
    var boolean = todel();
    if (!boolean)
        return
    $.ajax({
        url:"/TeacherWeb/teacher/delete.do",
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