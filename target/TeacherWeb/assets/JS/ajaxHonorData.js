/**
 * 用ajax对数据进行增删改
 */


//删
$(document).on("click",".delete",function(e,url){
        var Hsn = $(this).closest("tr").find(".Hsn").text();
        $.ajax({
        	url:"../servlet/HonorServlet?value=1",
            type:"post",
            datatype:"json",
            data:{
                "Hsn" : Hsn
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


//改
//获取该行当前每个表格单元的信息并提交到servlet进行修改
$(document).on("click",".save",function(){
//	if(function check(){
//		var check = checkHreward() && checkHcompany() && checkHwinner() && checkHname() && checkHsn();
//		return check;
//        }){
//	alert('输入不合法！')
//	return;
//}
	var Hsn = $("#Hsn").val();
	var Hname = $("#Hname").val();
	var Hwinner = $("#Hwinner").val();
	var Hdate = $("#Hdate").val();
	var Hcompany = $("#Hcompany").val();
	var Hgrad = $('#Hgrad option:selected').val();
	var Hreward = $("#Hreward").val();
	var Hremarks = $("#Hremarks").val();
	$.ajax({
        url:"../servlet/HonorServlet?value=2",
        type:"post",
        datatype:"json",
        data:{
            "Hsn" : Hsn,
            "Hname" : Hname,
            "Hwinner" :Hwinner,
            "Hdate" : Hdate,
            "Hcompany" : Hcompany,
            "Hgrad" : Hgrad,
            "Hreward" :Hreward,
            "Hremarks" :Hremarks,
        },
        
        success : function(result){
            
                alert("修改成功");
        },
        error:function(result){  
            alert('请求出现错误...');  
        }
    });
});

//新建信息
//获取新建行当前每个表格单元的信息
$(document).on("click",".saveNewMsg",function(){
//	if(function check(){
//		var check = checkHreward() && checkHcompany() && checkHwinner() && checkHname() && checkHsn();
//		return check;
//        }){
//	alert('输入不合法！')
//	return;
//}
	var Hsn = $('#Hsn').val();
	var Hname = $('#Hname').val();
	var Hwinner = $('#Hwinner').val();
	var Hdate = $('#Hdate').val();
	var Hcompany = $('#Hcompany').val();
	var Hgrad = $('#Hgrad option:selected').val();
	var Hreward = $('#Hreward').val();
	var Hremarks = $('#Hremarks').val();
	$.ajax({
        url:"../servlet/HonorServlet?value=3",
        type:"post",
        datatype:"json",
        data:{
            "Hsn" : Hsn,
            "Hname" : Hname,
            "Hwinner" :Hwinner,
            "Hdate" : Hdate,
            "Hcompany" : Hcompany,
            "Hgrad" : Hgrad,
            "Hreward" :Hreward,
            "Hremarks" :Hremarks,
        },
        success : function(result){
                alert("修改成功");
                location.reload();
                //window.location.href = "";
        },
        error:function(result){  
            alert('请求出现错误...');  
        }
    });
});


//判断当前状态是编辑还是保存
$(document).on("click",".updata",function(e){
	var content = $(this).text();
	if(content == "编辑"){
		$(this).removeClass('save');
	}else{
		$(this).addClass('save');
	}
})

	//审核通过
	$(document).on("click","#pass",function(){
		var Hsn = $('.Hsn').text();
		var message  = $('#message').val();
		$.ajax({
			url:"../servlet/HonorServlet?value=4",
	        type:"post",
	        datatype:"json",
	        data:{
	        	"Hsn" : Hsn,
	        	"message" : message,
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
	
	//审核不通过
	$(document).on("click","#nopass",function(){
		var Hsn = $('.Hsn').text();
		var message  = $('#message').val();
		$.ajax({
			url:"../servlet/HonorServlet?value=5",
	        type:"post",
	        datatype:"json",
	        data:{
	        	"Hsn" : Hsn,
	        	"message" : message,
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
	
	
	

$(function(){
	var totalPage = $('#totalPage').val();
	var currentPage = $('#currentPage').val();
	if(currentPage == 1){					//首页和尾页时分别隐藏对应按钮
		$('#pre').css("display","none");
	}
	
	if(currentPage == totalPage ){
		$('#next').css("display","none");
	}
})
