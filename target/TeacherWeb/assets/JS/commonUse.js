/**
 * 通用模块
 */

//实现全选与反选
		$(function(){
		$("#checkAll").click(function() {
			if (this.checked){
		        $("input[name=select]:checkbox").each(function(){
		              $(this).attr("checked", true);
		        });
		    } else {
		        $("input[name=select]:checkbox").each(function() {
		              $(this).attr("checked", false);
		        });
		    }
		});
		});
		
//点击显示精确搜索框
		function searchShow(){
			            var divDisp = document.getElementById("search").style.display;
			            if (divDisp == "block") {
			                document.getElementById("search").style.display = "none";
			            } else {
			                document.getElementById("search").style.display = "block";
			            }
			        }
		
		
	
	    
	    
	    //处理分页页码问题
	    $(function(){
	    	var totalPage = $('#totalPage').val();
	    	var currentPage = $('#currentPage').val();
	    	if(totalPage < 3){
	    		$('#page3').hide();
	    	}
	    	if(totalPage<2){
	    		$('#page2').hide();
	    	}
	    	if(currentPage == 1){					//首页和尾页时分别隐藏对应按钮
				$('#pre').css("display","none");
			}
			
			if(currentPage == totalPage){
				$('#next').css("display","none");
			}
	    })
	    

	    //点击上传文件时打开文件上传选择窗口
	    $(function(){
	    	$('#imporFileButton').on("click",function(){
	    		$('#file').click();
	    	})
	    })
		
	    //验证是否存在附件
		$(document).on("click",".Download",function(ev){
			var accessoryPath = $(this).closest("tr").find(".accessoryPath").val();
	    	if(accessoryPath == "" || accessoryPath == null || accessoryPath == "null"){
	    		alert('尚未上传附件！');
	    		ev.preventDefault();
	    		return;
	    	}
		})
	   