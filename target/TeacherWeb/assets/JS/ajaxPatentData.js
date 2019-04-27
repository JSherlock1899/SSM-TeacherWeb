/**
 * 用ajax对数据进行增删改
 */


//删
$(document).on("click",".delete",function(e,url){
        var Patsn = $(this).closest("tr").find(".Patsn").text();
        $.ajax({
        	url:"../servlet/PatentServlet?value=1",		//url貌似存在问题，未解决
            type:"post",
            datatype:"json",
            data:{
                "Patsn" : Patsn
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
//判断当前状态是编辑还是保存
$(document).on("click",".updata",function(e){
	var content = $(this).text();
	if(content == "编辑"){
		$(this).removeClass('save');
	}else{
		$(this).addClass('save');
	}
})




//获取该行当前每个表格单元的信息并提交到servlet进行修改
$(document).on("click",".save",function(){
//	if(function check(){
//		var check = checkPatsn() && checkPatname();
//		return check;
//        }){
//	alert('输入不合法！')
//	return;
//}
	var Patname = $("#Patname").val();
	var Pleader = $("#Pleader").val();
	var Patsn = $("#Patsn").val();
	var Patapdate = $("#Patapdate").val();
	alert(Patapdate)
	var Patemdate = $("#Patemdate").val();
	var Patgrad = $('#Patgrad option:selected').val();
	var Patremarks = $("#Patremarks").val();
	$.ajax({
        url:"../servlet/PatentServlet?value=2",
        type:"post",
        datatype:"json",
        data:{
            "Patname" : Patname,
            "Pleader" : Pleader,
            "Patsn" :Patsn,
            "Patapdate" : Patapdate,
            "Patemdate" : Patemdate,
            "Patgrad" : Patgrad,
            "Patremarks" :Patremarks,
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
//	if(!checkPatsn() && !checkPatname()){
//	alert('输入不合法！')
//	return;
//}
	var Patname = $('#Patname').val();
	var Pleader = $('#Pleader').val();
	var Patsn = $('#Patsn').val();
	var Patapdate = $('#Patapdate').val();
	var Patemdate = $('#Patemdate').val();
	var Patgrad = $('#Patgrad option:selected').val();
	var Patremarks = $('#Patremarks').val();
	$.ajax({
        url:"../servlet/PatentServlet?value=3",
        type:"post",
        datatype:"json",
        data:{
            "Patname" : Patname,
            "Pleader" : Pleader,
            "Patsn" :Patsn,
            "Patapdate" : Patapdate,
            "Patemdate" : Patemdate,
            "Patgrad" : Patgrad,
            "Patremarks" :Patremarks,
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

//审核通过
$(document).on("click","#pass",function(){
	var Patsn = $('.Patsn').text();
	var message  = $('#message').val();
	$.ajax({
		url:"../servlet/PatentServlet?value=4",
        type:"post",
        datatype:"json",
        data:{
        	"Patsn" : Patsn,
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
	var Patsn = $('.Patsn').text();
	var message  = $('#message').val();
	$.ajax({
		url:"../servlet/PatentServlet?value=5",
        type:"post",
        datatype:"json",
        data:{
        	"Patsn" : Patsn,
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
		
		
		
		
		