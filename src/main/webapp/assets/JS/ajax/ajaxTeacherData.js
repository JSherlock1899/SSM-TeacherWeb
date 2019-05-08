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
	$("#JobTitle").attr("value",$(this).closest("tr").find(".JobTitle").val());
	$("#Tdateofbirth").attr("value",$(this).closest("tr").find(".Tdateofbirth").text());
	$("#Cname").attr("value",$(this).closest("tr").find(".Cname").val());
	$("#sdept").attr("value",$(this).closest("tr").find(".Dname").val());
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
		url:"/teacher/update.do",
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