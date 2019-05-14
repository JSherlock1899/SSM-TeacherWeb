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


	//验证是否存在附件
	$(document).on("click",".Download",function(ev){
		var accessoryPath = $(this).closest("tr").find(".accessoryPath").val();
		var accessoryPath1 = $("#accessoryPath").val();
		console.log("accessoryPath = " + accessoryPath)
		console.log("accessoryPath1 = " + accessoryPath1)
		if((accessoryPath == "" || accessoryPath == null || accessoryPath == "null") && accessoryPath!=undefined){
            alert('尚未上传附件！');
			ev.preventDefault();
			return;
		}
		if((accessoryPath1 == "" || accessoryPath1 == null || accessoryPath1 == "null") && accessoryPath1!=undefined){
            alert('尚未上传附件！');
			ev.preventDefault();
			return;
		}
	})


//点击上传文件时打开文件上传选择窗口
$(function(){
    $(document).on("click","#importFileButton",function(){
        $('#file').click();
    })
})



function checkNubmer(input) {
    var nubmer = $("#suerId").val();
    var re = /^[0-9]+.?[0-9]*/;//判断字符串是否为数字//判断正整数/[1−9]+[0−9]∗]∗/
    if (!re.test(nubmer)) {
        alert("请输入数字");
    }
}

//确认用户身份
$(document).ready(function (){
    var grade = $("#grade").val();
    if (grade !="null"){
        $('#teacher').hide();
    };

});


		//删除确认
		function todel() {
			var msg = "您真的确定要删除吗？请确认！";
			if (confirm(msg)==true){
				return true;
			}else{
				return false;
			}
		}