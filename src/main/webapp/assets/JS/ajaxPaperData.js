/**
 * 用ajax对数据进行增删改
 */


// 删
$(document).on("click",".delete",function(e,url){
        var Pasearchnum = $(this).closest("tr").find(".Pasearchnum").text();
        $.ajax({
        	url:"../servlet/PaperServlet?value=1",
            type:"post",
            datatype:"json",
            data:{
                "Pasearchnum" : Pasearchnum
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


// 改
// 获取该行当前每个表格单元的信息并提交到servlet进行修改
$(document).on("click",".save",function(){
//	if(function check(){
//		var check = checkPawriter() && checkPaname() && checkPasearchnum();
//		return check;
//        }){
//	alert('输入不合法！')
//	return;
//}
	var Pasearchnum = $("#Pasearchnum").val();
	var Paname = $("#Paname").val();
	var Pawriter = $("#Pawriter").val();
	var Papublish = $("#Papublish").val();
	var Pdisvol = $("#Pdisvol").val();
	var Padate = $("Padate").val();
	var Pagrad = $('#Pagrad option:selected').val();
	var Paremarks = $("#Paremarks").val();
	$.ajax({
        url:"../servlet/PaperServlet?value=2",
        type:"post",
        datatype:"json",
        data:{
            "Pasearchnum" : Pasearchnum,
            "Paname" : Paname,
            "Pawriter" :Pawriter,
            "Papublish" : Papublish,
            "Pdisvol" : Pdisvol,
            "Padate" : Padate,
            "Pagrad" : Pagrad,
            "Paremarks" :Paremarks,
        },
        
        success : function(result){
            
                alert("修改成功");
        },
        error:function(result){  
            alert('请求出现错误...');  
        }
    });
});

// 新建信息
// 获取新建行当前每个表格单元的信息
$(document).on("click",".saveNewMsg",function(){
//	if(function check(){
//		var check = checkPawriter() && checkPaname() && checkPasearchnum();
//		return check;
//        }){
//	alert('输入不合法！')
//	return;
//}
	var Pasearchnum = $('#Pasearchnum').val();
	var Paname = $('#Paname').val();
	var Pawriter = $('#Pawriter').val();
	var Papublish = $('#Papublish').val();
	var Pdisvol = $('#Pdisvol').val();
	var Padate = $('#Padate').val();
	var Pagrad = $('#Pagrad option:selected').val();
	var Paremarks = $('#Paremarks').val();
	$.ajax({
        url:"../servlet/PaperServlet?value=3",
        type:"post",
        datatype:"json",
        data:{
            "Pasearchnum" : Pasearchnum,
            "Paname" : Paname,
            "Pawriter" :Pawriter,
            "Papublish" : Papublish,
            "Pdisvol" : Pdisvol,
            "Padate" : Padate,
            "Pagrad" : Pagrad,
            "Paremarks" :Paremarks,
        },
        success : function(result){
                alert("修改成功");
                location.reload();
                // window.location.href = "";
        },
        error:function(result){  
            alert('请求出现错误...');  
        }
    });
});


// 判断当前状态是编辑还是保存
$(document).on("click",".updata",function(e){
	var content = $(this).text();
	if(content == "编辑"){
		$(this).removeClass('save');
	}else{
		$(this).addClass('save');
	}
})


	// 审核通过
	$(document).on("click","#pass",function(){
		var Pasearchnum = $('.Pasearchnum').text();
		var message  = $('#message').val();
		$.ajax({
			url:"../servlet/PaperServlet?value=4",
	        type:"post",
	        datatype:"json",
	        data:{
	        	"Pasearchnum" : Pasearchnum,
	        },
	        success : function(result){
	                alert("操作成功");
	                location.reload();
	        },
	        error:function(result){  
	            alert('请求出现错误...');  
	        }
		})
	})
	
	// 审核不通过
	$(document).on("click","#nopass",function(){
		var Pasearchnum = $('.Pasearchnum').text();
		var message  = $('#message').val();
		$.ajax({
			url:"../servlet/PaperServlet?value=5",
	        type:"post",
	        datatype:"json",
	        data:{
	        	"Pasearchnum" : Pasearchnum,
	        },
	        success : function(result){
	                alert("操作成功");
	                location.reload();
	        },
	        error:function(result){  
	            alert('请求出现错误...');  
	        }
		})
	})

	
		// 新建按钮的事件
		$("#btn_add").click(function () {
		$("#myModalLabel").text("新建论文信息");
		$('#myModal').modal();
		});

		function skipPage(){								// 输入页码跳转页面
			// 页码输入框输入的数
			var pageVal = $('.pageVal').val();
			// 总页数
			var totalPage = $('#totalPage').val();
			// 一页显示的条数
			var pageSize = $('#pageSize').val();
			var college = $('#college').val();
			if(pageVal > totalPage){
				alert('请输入正确的页码！');
				return
			}
			var path = "";
			var a = "../servlet/PageServlet?option=Paper&currentPage=";
			var b = "&pageSizeSelect=" + pageSize + "&teacher=teacher&count=0&college=" + college
			path = path + a + pageVal + b;
			window.location.href = path;
		}
		
		$(function(){
			var totalPage = $('#totalPage').val();
			var currentPage = $('#currentPage').val();
			if(currentPage == 1){					// 首页和尾页时分别隐藏对应按钮
				$('#pre').css("display","none");
			}
			
			if(currentPage == totalPage ){
				$('#next').css("display","none");
			}
		})