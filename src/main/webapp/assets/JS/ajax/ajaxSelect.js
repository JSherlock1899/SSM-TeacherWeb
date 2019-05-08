/**
 * 实现下拉框的值改变，查询的结果也改变
 */

function goSelect(model) {
			var cname = $('#college option:selected').val();// 选中的学院值
			var dname = $('#sdept option:selected').val();// 选中的专业值
			var starttime = $('#starttime').val();
			var endtime = $('#endtime').val();
			var tname = $("#Tname").val();
			const path = "http://"+document.location.host;  //通用
			//将首字母大写
			var tmp = model.charAt(0).toUpperCase() + model.slice(1)
			var url = path + "/" + model + "/find" + tmp + ".do";
			console.log(url)
    		document.getElementById("select_frame").src=url+"?cname=" + cname
			+ "&dname=" + dname + "&starttime=" + starttime + "&endtime=" + endtime + "&tname=" + tname;

	}

		function getRightOption(model) {
            var grade = $("#grade").val();
            if(grade == undefined)
            	return "teacher";
            else
            	return model;
        }

		//当用户选择查询内容时，iframe跳转到对应页面
		//也是为了设定一个参数来区分四个页面
		function Projectchange(){
			var model = getRightOption("project");
			goSelect(model);
			resetSelect()
		}
		
		function Paperchange(){
            var model = getRightOption("paper");
            goSelect(model);
			resetSelect()

		}

		function Honorchange(){
            var model = getRightOption("honor");
            goSelect(model);
			resetSelect()
		}

		function Patentchange(){
            var model = getRightOption("patent");
            goSelect(model);
			resetSelect()
		}

		function Otherchange(){
            var model = getRightOption("other");
            goSelect(model);
			resetSelect()
		}

		function Teacherchange(){
            var model = getRightOption("teacher");
            goSelect(model);
            resetSelect()
		}


		//查询框的值改变时动态改变查询内容
		function selectChange(){
            //获取iframe中的src
			var newcss = document.getElementById('select_frame').src;
		    var reg = /.*aid\=([^\&]+).*/g;
		    var result = newcss.replace(reg,"$1");
		    //当已经进行过一次查询后将正确的url分割出来
			var arr = new Array();
            arr = result.split('/'); //通过字符串分割得到option
            var option = arr[3];
            //根据url中是否含find来判断是查询还是统计
            var judge = result.indexOf("find");
            var judge1 = result.indexOf("Statistics");
            var judge2 = result.indexOf("audit");
		    if(judge!=-1){
		    	goSelect(option);
		    }else if(judge1!=-1){
		    	goStatistics(option);
		    }else if(judge2!=-1){
		    	goAudit(option);
		    }  
		}

		//分发到统计页面
		function goStatistics(model) {
            var cname = $('#college option:selected').val();// 选中的学院值
            var dname = $('#sdept option:selected').val();// 选中的专业值
            var starttime = $('#starttime').val();
            var endtime = $('#endtime').val();
            const path = "http://"+document.location.host;  //通用
            //将首字母大写
            var tmp = model.charAt(0).toUpperCase() + model.slice(1)
            var url = path + "/" + model + "/Statistics.do";

            document.getElementById("select_frame").src=url+"?cname=" + cname
                + "&dname=" + dname + "&starttime=" + starttime + "&endtime=" + endtime

        }
		
		function ProjectStatistics(){
            var model = getRightOption("project");
            goStatistics(model);
            resetSelect()
		    }
			


		function PaperStatistics(){
            var model = getRightOption("paper");
            goStatistics(model);
            resetSelect()
		}

		function HonorStatistics(){
            var model = getRightOption("honor");
            goStatistics(model);
            resetSelect()
		}

		function PatentStatistics(){
            var model = getRightOption("patent");
            goStatistics(model);
            resetSelect()
		}

		function OtherStatistics(){
			var model = getRightOption("patent");
			goStatistics(model);
			resetSelect()
		}
		
		//分发到审核页面
		function goAudit(model)  {
            var cname = $('#college option:selected').val();// 选中的学院值
            var dname = $('#sdept option:selected').val();// 选中的专业值
            var starttime = $('#starttime').val();
            var endtime = $('#endtime').val();
            var tname = $("#Tname").val();
            var grade = $("#grade").val();
            const path = "http://"+document.location.host;  //通用
            var url = path + "/" + model + "/audit.do";
            document.getElementById("select_frame").src=url+"?cname=" + cname
                + "&dname=" + dname + "&starttime=" + starttime + "&endtime=" + endtime + "&tname=" + tname;

        }

		function ProjectAudit(){
            var model = getRightOption("project");
            goAudit(model);
            resetSelect()
		    }
			


		function PaperAudit(){
            var model = getRightOption("paper");
            goAudit(model);
            resetSelect()
		}

		function HonorAudit(){
            var model = getRightOption("honor");
            goAudit(model);
            resetSelect()
		}

		function PatentAudit(){
            var model = getRightOption("patent");
            goAudit(model);
            resetSelect()
		}

		function OtherAudit(){
            var model = getRightOption("other");
            goAudit(model);
            resetSelect()
		}

		//重置下拉框和文本框
		function resetSelect(){
			$("select").find("option:first").prop("selected",true);
			$('input').val("");
		}