/**
 * 实现下拉框的值改变，查询的结果也改变
 */
function ajaxSelect(option) {
			var collegevalue = $('#college option:selected').val();// 选中的学院值
			var sdeptValue = $('#sdept option:selected').val();// 选中的专业值
			var starttime = $('#starttime').val();
			var endtime = $('#endtime').val();
			var selectByNameVal = $("#selectByNameVal").val();
			var pageSizeSelect = $("#pageSizeSelect").val();
			var currentPage = $("#currentPage").val();
			document.getElementById("select_frame").src="../servlet/PageServlet?sdeptValue=" +sdeptValue 
			+ "&collegevalue=" +collegevalue + "&starttime=" + starttime + "&endtime=" + endtime + "&selectByNameVal=" + selectByNameVal
			+ "&pageSizeSelect=" + pageSizeSelect + "&currentPage=" + currentPage + "&option=" + option + "&teacher=admin";
		}
		
		//当用户选择查询内容时，iframe跳转到对应页面
		//也是为了设定一个参数来区分四个页面
		function Projectchange(){
			ajaxSelect("Project")
			resetSelect()
		    }
			


		function Paperchange(){
			ajaxSelect("Paper")
			resetSelect()
			
		}

		function Honorchange(){
			ajaxSelect("Honor")
			resetSelect()
		}

		function Patentchange(){	
			ajaxSelect("Patent")
			resetSelect()		
		}
		function Teacherchange(){	
			ajaxSelect("Teacher")
			resetSelect()
		}

		//获取iframe中的src
		function getSrc(){
			var newcss = document.getElementById('select_frame').src;
		    // var srcx = "xxx.ccom/id=2&aid=3";
		    var reg = /.*aid\=([^\&]+).*/g;
		    var result = newcss.replace(reg,"$1");
		}
		


		//查询框的值改变时动态改变查询内容
		function CollegeSelectchange(){
			var newcss = document.getElementById('select_frame').src;
		    // var srcx = "xxx.ccom/id=2&aid=3";
		    var reg = /.*aid\=([^\&]+).*/g;
		    var result = newcss.replace(reg,"$1");
		    //当已经进行过一次查询后将正确的url分割出来
		    var firsturl = result.split('option='); //通过字符串分割得到option
		    //根据url中是否含Page来判断是查询还是统计
		    var judge = result.indexOf("PageServlet");			
		    var judge1 = result.indexOf("StatisticsServlet");
		    var judge2 = result.indexOf("AuditServlet");
		    var option = firsturl[1];
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
			var collegevalue = $('#college option:selected').val();// 选中的学院值
			var sdeptValue = $('#sdept option:selected').val();// 选中的专业值
			var starttime = $('#starttime').val();
			var endtime = $('#endtime').val();
			var selectByNameVal = $("#selectByNameVal").val();
			var pageSizeSelect = $("#pageSizeSelect").val();
			var currentPage = $("#currentPage").val();
			document.getElementById("select_frame").src="../servlet/StatisticsServlet?sdeptValue=" +sdeptValue 
			+ "&collegevalue=" +collegevalue + "&starttime=" + starttime + "&endtime=" + endtime + "&selectByNameVal=" + selectByNameVal
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
			var collegevalue = $('#college option:selected').val();// 选中的学院值
			var sdeptValue = $('#sdept option:selected').val();// 选中的专业值
			var starttime = $('#starttime').val();
			var endtime = $('#endtime').val();
			var selectByNameVal = $("#selectByNameVal").val();
			var pageSizeSelect = $("#pageSizeSelect").val();
			var currentPage = $("#currentPage").val();
			document.getElementById("select_frame").src="../servlet/AuditServlet?sdept=" +sdeptValue 
			+ "&college=" +collegevalue + "&starttime=" + starttime + "&endtime=" + endtime + "&selectByNameVal=" + selectByNameVal
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