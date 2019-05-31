/**
 * 绘制项目统计图
 */

//项目数量
$(function() {
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('project_bar'));
    // 分别获取从后台传过来的数据
    var json = $('#json').val();
    var cname = $('#cname').val();
    // 校管理员与院管理员text显示不同
    var text = "项目总数统计图";
    // 解析json
    json = $.parseJSON(json);
    var keyArr = new Array(); // 学院名
    var valueArr = new Array();// 项目数
    var jsonArr = [];

    //根据管理员权限添加不同的数据
    if(cname == null || cname == "null"){
        for (var i = 0;i<json.length;i++) {
            keyArr.push(json[i].Cname); // 添加学院名
            valueArr.push(json[i].count) // 添加项目数
            jsonArr.push({
                name: json[i].Cname,
                value: json[i].count
            })
        }
    }else{
        for (var i = 0;i<json.length;i++) {
            keyArr.push(json[i].Dname); // 添加学院名
            valueArr.push(json[i].count) // 添加项目数
            jsonArr.push({
                name: json[i].Dname,
                value: json[i].count
            })
        }
    }
    // 指定图表的配置项和数据
    var bar_option = {
        title : {
            text : text,
        },
        tooltip : {},
        legend : {
            data : [ '项目数' ]
        },
        xAxis : {
            data : keyArr,
            axisLabel : {
                interval : 0,
                rotate : 30
            },
            grid : {// 直角坐标系内绘图网格
                show : true,// 是否显示直角坐标系网格。[ default: false ]
                left : "20%",// grid 组件离容器左侧的距离。
                right : "30px",
                borderColor : "#c45455",// 网格的边框颜色
                bottom : "20%" //
            },
        },
        yAxis : {},
        series : [ {
            name : '项目数',
            type : 'bar',
            data : valueArr
        } ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(bar_option);



    // 绘制图表。
    // 饼图
    var myChart = echarts.init(document.getElementById('project_pie'));
    var pie_option = {
        title : {
            text : text,
            x : 'center'
        },
        tooltip : {
            trigger : 'item',
            formatter : "{a} <br/>{b} : {c} ({d}%)"
        },

        legend : {
            orient : 'vertical',
            left : 'left',
            data : keyArr,
        },
        series : [ {
            name : '项目数',
            type : 'pie',
            radius : '55%',
            center : [ '50%', '60%' ],
            data : jsonArr,
            itemStyle : {
                emphasis : {
                    shadowBlur : 10,
                    shadowOffsetX : 0,
                    shadowColor : 'rgba(0, 0, 0, 0.5)'
                }
            }
        } ]
    };
    myChart.setOption(pie_option);
});

//项目经费
$(function() {
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('pmoney_bar'));
    // 分别获取从后台传过来的数据
    var Pmoneyjson = $('#Pmoneyjson').val();
    var cname = $('#cname').val();
    // 校管理员与院管理员text显示不同
    var text = "项目经费统计图";
    // 解析json
    Pmoneyjson = $.parseJSON(Pmoneyjson);
    var keyArr = new Array(); // 学院名
    var valueArr = new Array();// 项目经费
    var jsonArr = [];

    //根据管理员权限添加不同的数据
    if(cname == null || cname == "null"){
        for (var i = 0;i<Pmoneyjson.length;i++) {
            keyArr.push(Pmoneyjson[i].Cname); // 添加学院名
            valueArr.push(Pmoneyjson[i].Pmoney) // 添加项目经费
            jsonArr.push({
                name: Pmoneyjson[i].Cname,
                value: Pmoneyjson[i].Pmoney
            })
        }
    }else{
        for (var i = 0;i<Pmoneyjson.length;i++) {
            keyArr.push(Pmoneyjson[i].Dname); // 添加学院名
            valueArr.push(Pmoneyjson[i].Pmoney) // 添加项目数
            jsonArr.push({
                name: Pmoneyjson[i].Dname,
                value: Pmoneyjson[i].Pmoney
            })
        }
    }
    // 指定图表的配置项和数据
    var bar_option = {
        title : {
            text : text,
        },
        tooltip : {},
        legend : {
            data : [ '项目经费' ]
        },
        xAxis : {
            data : keyArr,
            axisLabel : {
                interval : 0,
                rotate : 30
            },
            grid : {// 直角坐标系内绘图网格
                show : true,// 是否显示直角坐标系网格。[ default: false ]
                left : "20%",// grid 组件离容器左侧的距离。
                right : "30px",
                borderColor : "#c45455",// 网格的边框颜色
                bottom : "20%" //
            },
        },
        yAxis : {},
        series : [ {
            name : '项目经费',
            type : 'bar',
            data : valueArr.toFixed(4)
        } ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(bar_option);



    // 绘制图表。
    // 饼图
    var myChart = echarts.init(document.getElementById('pmoney_pie'));
    var pie_option = {
        title : {
            text : text,
            x : 'center'
        },
        tooltip : {
            trigger : 'item',
            formatter : "{a} <br/>{b} : {c} ({d}%)"
        },
        legend : {
            orient : 'vertical',
            left : 'left',
            data : keyArr,
        },
        series : [ {
            name : '项目经费',
            type : 'pie',
            radius : '55%',
            center : [ '50%', '60%' ],
            data : jsonArr,
            itemStyle : {
                emphasis : {
                    shadowBlur : 10,
                    shadowOffsetX : 0,
                    shadowColor : 'rgba(0, 0, 0, 0.5)'
                }
            }
        } ]
    };
    myChart.setOption(pie_option);
});

// 折线图
$(function () {
    var myChart = echarts.init(document.getElementById('project_broken_line'));
    var cname = $('#cname').val();
    var jsonList = $('#jsonList').val();
    jsonList = $.parseJSON(jsonList);
    var arrAll = [];
    var name = []

    for (var i=0;i<jsonList[0].length;i++){
        var arr = [];
        for (var j=0;j<5;j++){
            arr.push(jsonList[j][i].count);
        }
        if(cname == null || cname == "null"){
            name.push(jsonList[0][i].Cname)
        }else{
            name.push(jsonList[0][i].Dname)
        }
        arrAll.push(arr);
    }
    var option = {
        title: {
            text: '折线图堆叠'
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:name
        },
        grid : {
            left : '3%',
            right : '4%',
            bottom : '3%',
            containLabel : true
        },
        toolbox : {
            feature : {
                saveAsImage : {}
            }
        },

        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ['2015','2016', '2017', '2018', '2019']
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name:name[0],
                type:'line',
                stack: '总量',
                data:arrAll[0]
            },
            {
                name:name[1],
                type:'line',
                stack: '总量',
                data:arrAll[1]
            },
            {
                name:name[2],
                type:'line',
                stack: '总量',
                data:arrAll[2]
            },
            {
                name:name[3],
                type:'line',
                stack: '总量',
                data:arrAll[3]
            },
            {
                name:name[4],
                type:'line',
                stack: '总量',
                data:arrAll[4]
            },
            {
                name:name[5],
                type:'line',
                stack: '总量',
                data:arrAll[5]
            },
            {
                name:name[6],
                type:'line',
                stack: '总量',
                data:arrAll[6]
            },
            {
                name:name[7],
                type:'line',
                stack: '总量',
                data:arrAll[7]
            },
            {
                name:name[8],
                type:'line',
                stack: '总量',
                data:arrAll[8]
            },
            {
                name:name[9],
                type:'line',
                stack: '总量',
                data:arrAll[9]
            },


        ]
    };


    myChart.setOption(option);
})