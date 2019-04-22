/**
 * 实现下拉框的值改变，查询的结果也改变
 */

function ajaxSelect(option) {
			var cname = $('#college option:selected').val();// 选中的学院值
			var dname = $('#sdept option:selected').val();// 选中的专业值
			var starttime = $('#starttime').val();
			var endtime = $('#endtime').val();
			var tname = $("#Tname").val();
			var tmp = option;
			const path = "http://"+document.location.host;  //通用
			//将首字母大写
			var tmp = option.charAt(0).toUpperCase() + option.slice(1)
    		var url = path + "/" + option + "/find" + tmp + ".do";
			console.log(url)
			$.ajax({
				url:url,
				type:"post",
				datatype:"json",
				data:{
					"cname" : cname,
					"dname" : dname,
					"starttime" : starttime,
					"endtime" : endtime,
					"tname" : tname,
				},
				success : function(msg){
				},
				error:function(msg){
					alert('请求出现错误...');
				}
			});
	}
		

		//获取iframe中的src
		function getSrc(){
			var newcss = document.getElementById('select_frame').src;
		    // var srcx = "xxx.ccom/id=2&aid=3";
		    var reg = /.*aid\=([^\&]+).*/g;
		    var result = newcss.replace(reg,"$1");
		}
		


		//查询框的值改变时动态改变查询内容
		function selectChange(){
			var newcss = document.getElementById('select_frame').src;
		    var reg = /.*aid\=([^\&]+).*/g;
		    var result = newcss.replace(reg,"$1");
		    //当已经进行过一次查询后将正确的url分割出来
			var arr = new Array();
            arr = result.split('/'); //通过字符串分割得到option
            var option = arr[3];
            //根据url中是否含find来判断是查询还是统计
            var judge = result.indexOf("find");
		    if(judge!=-1){
		    	ajaxSelect(option);
		    }else if(judge1!=-1){
		    	goStatistics(option);
		    }else if(judge2!=-1){
		    	goAudit(option);
		    }  
		}

		//分发到统计页面
		function goStatistics(option){
			var cnamevalue = $('#cname option:selected').val();// 选中的学院值
			var dnameValue = $('#dname option:selected').val();// 选中的专业值
			var starttime = $('#starttime').val();
			var endtime = $('#endtime').val();
			var selectByNameVal = $("#selectByNameVal").val();
			var pageSizeSelect = $("#pageSizeSelect").val();
			var currentPage = $("#currentPage").val();
			document.getElementById("select_frame").src="../servlet/StatisticsServlet?dnameValue=" +dnameValue 
			+ "&cnamevalue=" +cnamevalue + "&starttime=" + starttime + "&endtime=" + endtime + "&selectByNameVal=" + selectByNameVal
			+ "&pageSizeSelect=" + pageSizeSelect + "&currentPage=" + currentPage + "&option=" + option;
		}
		
		function ProjectStatistics(){
			resetSelect();
			goStatistics("Project")
		    }
			


		function PaperStatistics(){
			resetSelect();
			goStatistics("Paper")
			
		}

		function HonorStatistics(){
			resetSelect();
			goStatistics("Honor")

		}

		function PatentStatistics(){	
			resetSelect();
			goStatistics("Patent")
		}
		
		//分发到审核页面
		function goAudit(option){
			var cnamevalue = $('#cname option:selected').val();// 选中的学院值
			var dnameValue = $('#dname option:selected').val();// 选中的专业值
			var starttime = $('#starttime').val();
			var endtime = $('#endtime').val();
			var selectByNameVal = $("#selectByNameVal").val();
			var pageSizeSelect = $("#pageSizeSelect").val();
			var currentPage = $("#currentPage").val();
			document.getElementById("select_frame").src="../servlet/AuditServlet?dname=" +dnameValue 
			+ "&cname=" +cnamevalue + "&starttime=" + starttime + "&endtime=" + endtime + "&selectByNameVal=" + selectByNameVal
			+ "&pageSizeSelect=" + pageSizeSelect + "&currentPage=" + currentPage + "&option=" + option;
		}
		function ProjectAudit(){
			goAudit("Project")
			resetSelect()
		    }
			


		function PaperAudit(){
			goAudit("Paper")
			resetSelect()
			
		}

		function HonorAudit(){
			goAudit("Honor")
			resetSelect()
		}

		function PatentAudit(){	
			goAudit("Patent")
			resetSelect()		
		}
		
		//重置下拉框和文本框
		function resetSelect(){
			$("select").find("option:first").prop("selected",true);
			$('input').val("");
		}