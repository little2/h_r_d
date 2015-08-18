
function MyList(options) {
    var defaults = { // 默认值。
        title: '标题',       // 标题文本，若不想显示title请通过CSS设置其display为none 
        width: 820,             // 默认宽度
        id: false,          // list的id，若为false，则无法产生
        tid: false,           // 模板的id，若为false，则无法产生
        url: false, // ajax方式对应的url地址
        method: 'POST', // 数据发送方式
        dataType: 'json', // 数据加载的类型
        autoload: true, // 自动加载
        showHead: true, //是否显示标题
        showButton: true //是否显示工具栏
    };
    var options = $.extend(defaults, options);
    if (!options.id || !options.tid) {
        return;
    }
    $('#' + options.id).empty();
    $('#' + options.id).show();

    /* 新增按钮*/
    //var btnHtml = ' <input type="button" class="btnAdd" value="新增"  id="addList" />';
    var btnHtml = ' <div class="gridhead">';
    if (options.showHead) {
        btnHtml += '                 <div class="mDiv" style="width: ' + options.width + 'px; "> <span>' + options.title + '</span></div>';
    }
    if (options.showButton) {
        btnHtml += '                  <div class="tDiv" style="width: ' + options.width + 'px; ">';
        btnHtml += '                      <div class="fbutton">';
        btnHtml += '                         <div>';
        btnHtml +='                             <span class="add"  id="addList">';
        btnHtml += '                                 新增</span>';
        btnHtml += '                         </div>';
        btnHtml += '                   </div>';
        btnHtml += '                   <div class="btnseparator">';
        btnHtml += '                  </div>';
        btnHtml += '              </div>';
    }
    btnHtml += '              </div>';
    btnHtml += '<div  style="clear:both;"></div>';


    $('#' + options.id).append(btnHtml);

    $('#' + options.id).find('#addList').bind('click', addList);


    if (options.url && options.autoload) {
        loaddata();
    }


    function addList() {
        var container = setContainer(MyList.__count); //创建容器
        $('#' + options.id).append(container); //添加容器
        $('#panel' + MyList.__count).panel({
            controls: $('#drop' + MyList.__count).html(),
            collapseSpeed: 400
        });
        MyList.__count++;
    }
    function setContainer(id) {
        var content = $('#' + options.tid).html();
        var div = '<div id="panel' + id + '" class="centralPanel" style="width:' + options.width + 'px;"><h3>' + options.title + '</h3><div>';
        div += content;
        div += '</div></div><div id="drop' + id + '" style="display: none"><a href="javascript:void(0)"  onclick="SaveList(\'' + id + '\');">保存</a>&nbsp;|&nbsp;<a href="javascript:void(0)"  onclick="delList(\'' + id + '\');">删除</a></div>';

        return div;
    }

    function loaddata() { // get latest data
        $.ajax({
            type: options.method,
            url: options.url,
            dataType: options.dataType,
            success: function (data) {
                addData(data);
            },
            error: function (data) {
                try {
                } catch (e) {

                }
            }
        });
    }
    function addData(data) {

        if (options.dataType == 'json') {
            $.each(data.rows, function (i, row) {
                var num = MyList.__count;
                addList();
                $("#panel" + num + " input[type='text']").each(function () {
                    var x = $(this).attr('name');
                    $.each(data.rows[i], function (x, y) {
                        if (seleceName == x) {
                            $('#panel' + num + ' input[name="' + x + '"]').val(y);
                        }
                    })
                });
            });
        }
    }
}
MyList.__count = 1;

function delList(id) {
    $('#panel' + id).remove();
    $('#drop' + id).remove();
}

function SaveList(id) {
    $('#panel' + id).remove();
    $('#drop' + id).remove();
}




