<%--
  Created by IntelliJ IDEA.
  User: mlw
  Date: 18-1-10
  Time: 下午4:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../../../public/tag.jsp" %>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="${baseurl}/public/common/js/jquery-3.2.0.min.js"></script>
    <script src="${baseurl}/js/separator.js" charset="utf-8"></script>
    <script src="${baseurl}/public/common/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/bootstrap/css/bootstrap.min.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/common/css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/common.css" media="all">
    <link rel="stylesheet" type="text/css" href="${baseurl}/public/css/personal.css" media="all">
    <%--时间轴--%>
    <link rel="stylesheet" href="${baseurl}/public/css/timeAsix/css/screen.css" type="text/css" media="screen">
    <link rel="stylesheet" href="${baseurl}/public/css/timeAsix/css/responsive.css" type="text/css" media="screen">
    <link rel="stylesheet" href="${baseurl}/public/css/timeAsix/inc/colorbox.css" type="text/css" media="screen">
    <script type="text/javascript" src="${baseurl}/js/searchJs.js"></script>
    <%--PDF--%>
    <%--导出pdf--%>
    <script src='${baseurl}/public/pdfMake/pdfmake.min.js'></script>
    <script src='${baseurl}/public/pdfMake/vfs_fonts.js'></script>

    <%--上传附件--%>
    <!-- 引用控制层插件样式 -->
    <link rel="stylesheet" href="${baseurl}/public/css/zyUpload/zyUpload.css" type="text/css">
    <!-- 引用核心层插件 -->
    <script type="text/javascript" src="${baseurl}/public/js/zyUpload/zyFile.js"></script>
    <!-- 引用控制层插件 -->
    <script type="text/javascript" src="${baseurl}/public/js/zyUpload/zyUpload.js"></script>
    <!-- 引用初始化JS -->
    <%--<script type="text/javascript" src="${baseurl}/public/js/zyUpload/demo.js"></script>--%>

    <style>
        .layui-form-radio span {
            font-size: 10px;
        }

        .layui-form-radio i {
            font-size: 15px;
        }

        .layui-elem-quote {
            padding-bottom: 1px;
            font-size: small;
        }

        .layui-disabled {
            background: none;
        }

        .layui-table td, .layui-table th {
            font-size: 12px;
            padding: 4px 15px;

        }

        .upload_append_list {
            height: auto;
        }

        .upload_preview {
            width: 100%;
        }

    </style>
</head>
<body>

<section class="larry-grid layui-form">
    <div class="larry-personal">
        <div class="layui-tab">
            <blockquote class="layui-elem-quote mylog-info-tit">
                <from id="searchInfo">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <div class="layui-input-inline ">
                                <select lay-filter="department" id="module_search">
                                    <option value="">系</option>
                                </select>
                            </div>

                            <div class="layui-input-inline">
                                <select lay-filter="level" id="semester_search">
                                    <option value="">年级</option>
                                </select>
                            </div>

                            <div class="layui-input-inline">
                                <select lay-filter="direction" id="findDirection">
                                    <option value="">方向</option>
                                </select>
                            </div>

                            <div class="layui-input-inline">
                                <select lay-filter="profession" id="queryClass">
                                    <option value="">班级</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-inline">
                            <input type="text" name="no" id="no-search" lay-verify="title" autocomplete="off"
                                   placeholder="学号" value="" class="layui-input">
                        </div>
                        <div class="layui-input-inline">
                            <input type="text" name="name" id="name_search" lay-verify="title"
                                   autocomplete="off"
                                   placeholder="姓名" class="layui-input">
                        </div>
                        <div class="layui-input-inline">

                            <select lay-filter="queryAreaOfRoom" name="" id="queryAreaOfRoom">
                                <option value="">区号</option>
                            </select>
                        </div>
                        <div class="layui-input-inline">
                            <select lay-filter="queryFloor" id="queryFloor">
                                <option value="">层号</option>
                            </select>
                        </div>

                        <div class="layui-input-inline">
                            <select lay-filter="queryRoom" id="queryRoom">
                                <option value="">宿舍</option>
                            </select>
                        </div>

                        <%--
                                            <div class="layui-inline">
                                                <div class="layui-input-inline" style="width: auto ;">
                                                    <input type="text" name="roomId" lay-verify="title" autocomplete="off"
                                                           placeholder="房间号码" id="roomId" class="layui-input">
                                                </div>
                                            </div>--%>
                        <a class="layui-btn" style="width: auto ;"
                           onclick="currentIndex=1;communication.list()"><i
                                class="layui-icon">&#xe615;</i>搜索</a>
                    </div>

                </from>
            </blockquote>

        </div>
        <div class="larry-separate"></div>
        <div class="layui-tab-content larry-personal-body clearfix mylog-info-box">
            <div class="layui-form">
                <table class="layui-table">
                    <thead>
                    <tr>
                        <th style="height: 48px;">学号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>系</th>
                        <th>年级</th>
                        <th>专业</th>
                        <th>方向</th>
                        <th>学籍状态</th>
                        <th>班级</th>
                        <th>职业导师</th>
                        <th>社区辅导员</th>
                        <th>住宿类型</th>
                        <th>区</th>
                        <th>楼层</th>
                        <th>宿舍</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody id="list">

                    </tbody>
                </table>
            </div>
            <div id="demo1"></div>
        </div>
    </div>
    </div>
</section>
<div id="demo" class="demo" style="display: none">
</div>
<%@include file="layer.jsp" %>
<%@include file="pdf.jsp" %>
<script type="text/javascript" src="${baseurl}/public/css/timeAsix/inc/colorbox.js"></script>
<script type="text/javascript" src="${baseurl}/public/css/timeAsix/js/timeliner.min.js"></script>
<script>
    $(document).ready(function () {
        $.timeliner({
            startOpen: ['#19550828EX', '#19630828EX']
        });
        $.timeliner({
            timelineContainer: '#timelineContainer_2'
        });
        // Colorbox Modal
        $(".CBmodal").colorbox({
            inline: true,
            initialWidth: 100,
            maxWidth: 682,
            initialHeight: 100,
            transition: "elastic",
            speed: 750
        });
    });
</script>
<script src="${baseurl}/js/searchJs.js"></script>
<script type="text/javascript" src="${baseurl}/public/js/pdf/html2canvas.js"></script>
<script type="text/javascript" src="${baseurl}/public/js/pdf/jspdf.debug.js"></script>
<script type="text/javascript" src="${baseurl}/public/js/pdf/renderPDF.js"></script>
<script type="text/javascript">
    let personalCommunicationFeedbackRecords;
    let totalSize = 10;
    let currentIndex = 1;
    let pageSize = 10;
    let communication;
    let student;
    let no;
    let studentNoByUpload;
    layui.use(['jquery', 'layer', 'element', 'laypage', 'form', 'laytpl'], function () {
        window.jQuery = window.$ = layui.jquery;
        window.layer = layui.layer;
        var element = layui.element(),
            form = layui.form(),
            laytpl = layui.laytpl;

        communication = {
            page: function () {
                layui.laypage({
                    cont: 'demo1',
                    pages: totalSize, //总页数
                    curr: currentIndex,
                    last: totalSize,
                    groups: 5,//连续显示分页数
                    skin: '#1E9FFF',
                    jump: function (obj, first) {
                        currentIndex = obj.curr;
                        if (!first) {
                            communication.list();
                        }
                    }
                });
            },
            list: function () {
                let data = {
                    departmentId: $("#module_search").val(),
                    professionId: $("#semester_search").val(),
                    directionId: $("#findDirection").val(),
                    classesId: $("#queryClass").val(),
                    studentNo: $("#no-search").val(),
                    name: $("#name_search").val(),
                    areaId: $("#queryAreaOfRoom").val(),
                    floorId: $("#queryFloor").val(),
                    roomId: $("#queryRoom").val(),
                    currentIndex: currentIndex,
                    pageSize: pageSize
                }
                $.ajax({
                    url: baseUrl + "/communication/list",
                    data: data,
                    type: "post",
                    success: function (data) {
                        if (data.result) {
                            currentIndex = data.page.currentIndex;
                            totalSize = data.page.totalSize;
                            showTotalCount(data.page.totalCount);
                            communication.page();
                            laytpl($("#list-tpl").text()).render(data, function (html) {
                                $("#list").html(html);
                            });
                            form.render();
                        }
                    }
                });
            },
            add: function (studentNo) {
                window.localStorage.setItem("studentNoByUpdate", studentNo);
                $.post(baseUrl + "/studentClass/student", {studentNo: studentNo}, function (data) {
                    if (data.result) {
                        student = data.data;

                        $("#student_radio").prop({checked: true});
                        $(".no").val(student.no);
                        $("#studentName").val(student.name);
                        $(".textarea").val('');
                        form.render();
                        layer.open({
                            type: 1,
                            title: '添加',
                            area: ["100%", "100%"]
                            , content: $("#add")
                        });
                    } else {
                        layer.msg(data.msg);
                    }
                })
                $("#communicationPhone").formatInput({
                    formatArr: [3, 4, 4],
                    delimiter: '-'
                });

                // 初始化插件
                $("#demo").zyUpload({
                    width: "650px",                 // 宽度
                    height: "400px",                 // 宽度
                    studentNoByUpdate: window.localStorage.getItem("studentNoByUpdate"),// 学号
                    itemWidth: "120px",                 // 文件项的宽度
                    itemHeight: "100px",                 // 文件项的高度
                    url: baseUrl + "/communication/UploadAction",  // 上传文件的路径
                    multiple: true,                    // 是否可以多个文件上传
                    dragDrop: true,                    // 是否可以拖动上传文件
                    del: true,                    // 是否可以删除文件
                    finishDel: false,  				  // 是否在上传文件完成后删除预览
                    /* 外部获得的回调接口 */
                    onSelect: function (files, allFiles) {                    // 选择文件的回调方法
                        console.info("当前选择了以下文件：");
                        console.info(files);
                        console.info("之前没上传的文件：");
                        console.info(allFiles);
                    },
                    onDelete: function (file, surplusFiles) {                     // 删除一个文件的回调方法
                        console.info("当前删除了此文件：");
                        console.info(file);
                        console.info("当前剩余的文件：");
                        console.info(surplusFiles);
                    },
                    onSuccess: function (file) {                    // 文件上传成功的回调方法
                        console.info("此文件上传成功：");
                        console.info(file);
                    },
                    onFailure: function (file) {                    // 文件上传失败的回调方法
                        console.info("此文件上传失败：");
                        console.info(file);
                    },
                    onComplete: function (responseInfo) {           // 上传完成的回调方法
                        console.info("文件上传完成");
                        console.info(responseInfo);
                    }
                });

            },
            addAjax: function () {
                let no = $(".no").val();
                let direction = $("#direction").val();
                let talkName = $("#studentName").val();
                let contents = "";
                let contentNodes = $(".add-contents");
                let communicationMode = $("#communicationMode").val();
                let communicationPhone = $("#communicationPhone").val();
                for (let i = 0; i < contentNodes.length; ++i) {
                    contents += $(contentNodes[i]).val() + "$%$";
                }

                let data = {
                    "studentId": no,
                    "direction": direction,
                    "talkName": talkName,
                    "communicationMode": communicationMode,
                    "communicationPhone": communicationPhone,
                    "content": contents
                }
                $.post(baseUrl + "/communication/add", data, function (data) {
                    layer.msg(data.msg);
                    setTimeout("location.reload()", 500);
                })
            },
            updateAjax: function (data) {
                $.post(baseUrl + "/communication/updateContent", data, function (data) {
                    layer.msg(data.msg);
                })
            },
            updateContent: function (id, qaId) {
                let contents = "";
                let contentNodes = $("#id" + qaId + "EX").find(".update-contents");
                for (let i = 0; i < contentNodes.length; ++i) {
                    contents += $(contentNodes[i]).val() + "$%$";//Q&A 分隔符
                }
                let data = {
                    id: id,
                    content: contents
                }
                communication.updateAjax(data);
            },
            uploadAttachment: function () {
                layer.open({
                    type: 1,
                    title: "上传附件",
                    area: ["80%", "95%"],
                    content: $("#demo")
                });
            },
            previewOrUpdate: function (name, studentNo, type) {
                $("#who").text(name);
                window.sessionStorage.setItem("studentNoByDownload", studentNo);
                $.post(baseUrl + "/communication/communication", {studentNo: studentNo}, function (data) {
                    window.sessionStorage.setItem("zyFileByDownload", data.data[data.data.length - 1].zyFile);
                    personalCommunicationFeedbackRecords = data;
                    if (data.result) {
                        showCommunicationContent(data.data);
                        $("#name").text(data.data[(data.data.length - 1)].name);
                        if (data.data[(data.data.length - 1)].gender === "M") {
                            $("#gender").text("男");
                        } else {
                            $("#gender").text("女");
                        }
                        $("#native_place").text(data.data[(data.data.length - 1)].native_place);
                        $("#idcard").text(data.data[(data.data.length - 1)].idcard);
                        $("#profession").text(data.data[(data.data.length - 1)].profession);
                        $("#direction2").text(data.data[(data.data.length - 1)].direction);
                        $("#political_status").text(data.data[(data.data.length - 1)].classesName);
                        let title = null;
                        if (type === "preview") {
                            $("#printPDF").show();
                            title = "预览"
                        } else {
                            $("#printPDF").hide();
                            title = "修改"
                        }
                        if (data.data[data.data.length - 1].zyFile !== undefined) {
                            $("#downloadZyFile").show();
                            $("#getZyFiles").val(window.sessionStorage.getItem("zyFileByDownload"));
                        } else {
                            $("#downloadZyFile").hide();
                        }
                        layer.open({
                            type: 1,
                            title: title,
                            area: ["100%", "100%"]
                            , content: $("#update"),
                            cancel: function () {
                                location.reload();
                            }
                        });
                    } else {
                        layer.msg(data.msg);
                    }
                });
            },
            // downloadZyFile: function () {
            //     $.post(baseUrl + "/communication/downloadZyFile",
            //         {
            //             fileNames: window.sessionStorage.getItem("zyFileByDownload")
            //         });
            // },
            loadDepartmentOrDirection: function (data, selectId) {
                let _html = `<option value=''>请选择</option>`;
                for (let i = 0; i < data.length; ++i) {
                    if (selectId == data[i].id) {
                        _html += `<option selected value="` + data[i].id + `">` + data[i].name + `</option>`;
                    } else {
                        _html += `<option value="` + data[i].id + `">` + data[i].name + `</option>`;
                    }
                }


                return _html;
            },

            select: function () {
                $.post(baseUrl + "/department/allDepartments", function (data) {
                    if (data.result) {
                        $("#module_search").html(`<option value="" selected>系</option>`).append(communication.loadDepartmentOrDirection(data.data, "-"));
                        form.render();
                    }
                });
            },
            nowDate: function () {
                $("#semester_search").html(`<option value="" selected>年级</option><option value=''>请选择</option>`);
                let levels = getSearchLevels().reverse();
                levels.forEach(level => {
                    $("#semester_search").append(`<option value="` + level + `" >` + level + `</option>`);
                });
            },
            direction: function (data) {
                $.post(baseUrl + "/communication/queryDirectionByDepartmentId", {departmentId: data}, function (data) {
                    if (data.result) {
                        $("#findDirection").html(`<option value="">方向</option>`).append(communication.loadDepartmentOrDirection(data.data, "-"))
                        form.render();
                    }
                })
            },
            directionOne: function () {
                $.post(baseUrl + "/communication/queryDirectionByDepartment", function (data) {
                    if (data.result) {
                        $("#findDirection").html(`<option value="">方向</option>`).append(communication.loadDepartmentOrDirection(data.data, "-"))
                        form.render();
                    }
                })
            },
            queryClass: function () {
                $.post(baseUrl + "/communication/queryClass", function (data) {
                    if (data.result) {
                        $("#queryClass").html(`<option value="">班级</option>`).append(communication.loadDepartmentOrDirection(data.data, "-"))
                        form.render();
                    }
                })
            },
            queryClassByDepartmentId: function (data) {
                $.post(baseUrl + "/communication/queryClassByDepartmentId", {departmentId: data}, function (data) {
                    if (data.result) {
                        $("#queryClass").html(`<option value="">班级</option>`).append(communication.loadDepartmentOrDirection(data.data, "-"))
                        form.render();
                    }
                })
            },
            queryFloorAndAreaOfRoom: function () {
                $.post(baseUrl + "/dorm/room/showAreaAndFloorsToQuery", function (data) {
                    if (data.result) {
                        $("#queryFloor").html(`<option value="">层号</option>`).append(`<option value="">请先选择区号</option>`)
                        $("#queryAreaOfRoom").html(`<option value="">区号</option>`).append(communication.loadDepartmentOrDirection(data.data.queryAreaOfRoom, "-"))
                        form.render();
                    }
                })
            },
            queryClassByDirectionId: function (id) {
                $.post(baseUrl + "/studentClass/queryClassesByDirectionId", {id: id}, function (data) {
                    if (data.result) {
                        $("#queryClass").html(`<option value=''>班级</option><option value="">请选择</option>`).append(loadOptionsHtml(data.data, "-"))
                    }
                    form.render();
                })
            },
            queryClassByDirectionIdAndLevel: function (directionId, level) {
                $.post(baseUrl + "/studentClass/queryClassByDirectionIdAndLevel", {
                    directionId: directionId,
                    level: level
                }, function (data) {
                    if (data.result) {
                        $("#queryClass").html(loadOptionsHtml(data.data, "-"))
                    }
                    form.render();
                })
            }


        };
        $(function () {
//            communication.list();
            communication.select();
            communication.nowDate();
//            communication.directionOne();
            communication.queryFloorAndAreaOfRoom();
            form.on('radio(talk)', function (data) {
                let talkName = data.value == "parent" ? student.parentName : student.name;
                $("#talkName").text(talkName);
            });
            form.on('select(department)', function (data) {
                communication.direction(data.value);

            });
            form.on('select(direction)', function (data) {
                let level = $("#semester_search").val();
                communication.queryClassByDirectionIdAndLevel(data.value, level);

            });
            form.on('select(level)', function (data) {
                let directionId = $("#findDirection").val();
                communication.queryClassByDirectionIdAndLevel(directionId, data.value);

            });
            form.on('select(queryAreaOfRoom)', function (data) {
                var id = data.value;
                $.post(baseUrl + "dorm/room/showAreaAndFloors", {areaId: data.value}, function (data) {
                    if (data.result) {
                        var queryAreaOfRoom = data.data.queryAreaOfRoom
                        var queryFloorOfRoom = data.data.queryFloorOfRoom
                        $("#queryAreaOfRoom").html(communication.loadDepartmentOrDirection(queryAreaOfRoom, id))
                        $("#queryFloor").html(`<option value="">层号</option>`).append(communication.loadDepartmentOrDirection(queryFloorOfRoom, "-"))

                        form.render();
                    }
                })
            })
            //监听根据楼层id显示宿舍
            form.on('select(queryFloor)', function (data) {
                $.post(baseUrl + "dorm/room/showFloorsAndRooms", {floorId: data.value}, function (data) {
                    if (data.result) {
                        var queryRoomList = data.data.queryRoomList
                        $("#queryRoom").html(`<option value=''>请选择</option>`).append(communication.loadDepartmentOrDirection(queryRoomList, "-"))
                        form.render();
                    }
                })
            })
        });
    })
    ;

    function printPdf() {
//        pdf(document.getElementById("container"), $("#name").text(), "a4");
        printPDF(personalCommunicationFeedbackRecords);
    }
</script>
</body>
</html>
