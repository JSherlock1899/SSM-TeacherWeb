/**
 * 对教师信息进行操作
 */

$(document).on("click",".delete",function(e,url){
        var Tsn = $(this).closest("tr").find(".Tsn").text();
        $.ajax({
        	url:"../servlet/TeacherServlet?value=1",
            type:"post",
            datatype:"json",
            data:{
                "Tsn" : Tsn
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

$(document).on("click",".newTeacher",function(e,url){
	$("#Tsn").attr("value",$(this).closest("tr").find(".Tsn").text());
	$("#Tname").attr("value",$(this).closest("tr").find(".Tname").text());
	$("#Tsex").attr("value",$(this).closest("tr").find(".Tsex").text());
	$("#Tdegree").attr("value",$(this).closest("tr").find(".Tdegree").text());
	$("#Tresdirection").attr("value",$(this).closest("tr").find(".Tresdirection").text());
	$("#Tedubackground").attr("value",$(this).closest("tr").find(".Tedubackground").text());
	$("#JobTitle").attr("value",$(this).closest("tr").find(".JobTitle").text());
	$("#Tdateofbirth").attr("value",$(this).closest("tr").find(".Tdateofbirth").text());
	$("#Cname").attr("value",$(this).closest("tr").find(".Cname").text());
	$("#sdept").attr("value",$(this).closest("tr").find(".Dname").text());

});

//$(document).on("click",".newTeacher",function(e,url){
//	$("#Tsn").attr("value",$(this).closest("tr").find(".Tsn").text());
//	$("#Tname").attr("value",$(this).closest("tr").find(".Tname").text());
//	$("#Tsex").attr("value",$(this).closest("tr").find(".Tsex").text());
//	$("#Tdegree").attr("value",$(this).closest("tr").find(".Tdegree").text());
//	$("#Tedubackground").attr("value",$(this).closest("tr").find(".Tedubackground").text());
//	$("#Cname").attr("value",$(this).closest("tr").find(".Cname").text());
//	$("#Sdept").attr("value",$(this).closest("tr").find(".Sdept").text());
//	var Tsn = $('#Tsn').val();
//	var Tname = $('#Tname').val();
//	var Tsex = $('#Tsex').val();
//	var Tdegree = $('#Tdegree').val();
//	var Tedubackground = $('#Tedubackground').val();
//	var Tresdirection = $('#Tresdirection').val();
//	var Cname = $('#Cname option:selected').val();
//	var Sdept = $('#sdept option:selected').val();
//	alert(Tresdirection)
//	alert(Tsn)
//	alert(Cname)
//	$.ajax({
//		url:"../servlet/TeacherServlet?value=2",
//		type:"post",
//		datatype:"json",
//		data:{
//			"Tsn" : Tsn,
//			"Tname" : Tname,
//			"Tsex" :Tsex,
//			"Tdegree" : Tdegree,
//			"Tedubackground" : Tedubackground,
//			"Tresdirection" : Tresdirection,
//			"Cname" : Cname,
//			"Sdept" :Sdept,
//		},
//		success : function(msg){
//			
//			alert("删除成功");
//			$(e.target).closest("tr").fadeOut();
//			window.location.reload();
//		},
//		error:function(msg){  
//			alert('请求出现错误...');  
//		}
//	});
//});


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
	var Sdept = $('#sdept option:selected').val();
	$.ajax({
		url:"../servlet/TeacherServlet?value=2",
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
            "Sdept" :Sdept,
		},
		success : function(msg){
			
			alert("修改成功");
			window.location.reload();
		},
		error:function(msg){  
			alert('请求出现错误...');  
		}
	});
});

