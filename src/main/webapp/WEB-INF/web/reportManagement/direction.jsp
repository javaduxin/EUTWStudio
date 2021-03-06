<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../public/tag.jsp" %>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
    <script src="${baseurl}/public/common/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/bootstrap/css/bootstrap.min.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/personal.css" media="all">

</head>
<body>
<section class=" layui-form">
    <div class="larry-personal">
        <div class="layui-tab">
            <button class="layui-btn " style="float: right" onclick="direction.exportExcel()"><i class="layui-icon">&#xe61e;</i>导出
                EXCEl
            </button>
            <div id="container" class="layui-tab-content larry-personal-body clearfix mylog-info-box"
                 style="background: #fff;width: 100%;height: 100%;margin: 5px 0px">
                <div style="text-align: center;font-size: 20px;font-weight: bold;color: #21a1a1">
                    西安欧亚学院高职学院就业方向人数统计表
                    <%--(<span style="font-size: 13px;" id="time">2017-6-3 12:12:21</span>)--%>
                </div>
                <table class="layui-table">
                    <thead>
                    <tr id="head">

                    </tr>
                    </thead>
                    <tbody id="report">

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
</body>
<script type="text/javascript" src="${baseurl}/public/common/layui/layui.js"></script>
<script type="text/javascript" src="${baseurl}/js/searchJs.js"></script>
<script type="text/javascript">
    let direction;
    layui.use(['jquery', 'layer'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;


        direction = {
            list: function () {
                layer.msg("查询中......");
                $.post(baseUrl + "/directionReport/list", function (data) {
                    if (data.result) {
                        let date = new Date();
                        $("#time").text(date.getFullYear() + " 年 " + (date.getMonth() + 1) + " 月 " + date.getDate() + " 日");
                        direction.loadTableHead();
                        direction.showPage(data.data);
                    } else {
                        layer.msg(data.msg);
                    }
                })
            },
            exportExcel: function () {
                location.href = baseUrl + "/directionReport/exportExcel";
            },
            showPage: function (data) {
                let index = 0;
                let _html = "";
                let totalCount = [0, 0, 0,  0];
                data.forEach(department => {
                    let littleCount = [0, 0, 0, 0];
                    let rowSumCount = 0;
                    let directions = department.directions;
                    let levels = directions[0].levels;

                    _html += `
                     <tr>
                        <th rowspan="` + directions.length + `">` + department.departmentName + `</th>
                        <th>` + directions[0].directionName + `</th>
                        `;
                    for (let j = 0; j < levels.length; ++j) {
                        _html += `<th>` + levels[j].count + `</th>`;

                        littleCount[j] += levels[j].count;
                        rowSumCount += levels[j].count;
                    }
                    _html += ` <th>` + rowSumCount + `</th>`;
                    _html += ` </tr>`;

                    littleCount[3] += rowSumCount;
                    rowSumCount = 0;

                    for (let i = 1; i < directions.length; ++i) {
                        let direction = directions[i];
                        levels = direction.levels;
                        _html += `
                             <tr>
                                <th>` + direction.directionName + `</th>
                          `;
                        for (let j = 0; j < levels.length; ++j) {
                            _html += `<th>` + levels[j].count + `</th>`;
                            littleCount[j] += levels[j].count;
                            rowSumCount += levels[j].count
                        }
                        _html += ` <th>` + rowSumCount + `</th>`;
                        _html += ` </tr>`;
                        littleCount[3] += rowSumCount;
                        rowSumCount = 0;
                    }
                    _html += `<tr style="background: #e8e8e8">
                          <th style='font-weight: bold'>小计</th>
                          <th></th>
                          <th>`+littleCount[0]+`</th>
                          <th>`+littleCount[1]+`</th>
                          <th>`+littleCount[2]+`</th>
                          <th>`+littleCount[3]+`</th>
                    </tr>`;
                    for(let i in totalCount)
                        totalCount[i] += littleCount[i];
                });
                _html += `<tr>
                          <th style='font-weight: bold'>总计</th>
                          <th></th>
                          <th>` + totalCount[0] + `</th>
                          <th>` + totalCount[1] + `</th>
                          <th>` + totalCount[2] + `</th>
                          <th>` + totalCount[3] + `</th>
                    </tr>`;
                $("#report").html(_html);
            },
            loadTableHead: function () {
                $("#head").html("");
                $("#head").append(`
                        <td>系名称</td>
                        <td>就业方向</td>
                `);
                getSearchLevels().forEach(level => $("#head").append(`<td>` + level + `</td>`));
                $("#head").append(`<td>小计</td>`);
            }
        }
        $(function () {
            direction.list();
        })
    })

</script>
</html>
