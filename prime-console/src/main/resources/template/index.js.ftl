/**
 * ${g.name}管理初始化
 */
var ${g.entityName} = {
    id: "${g.entityName}Table",
    seItem: null,
    table: null,
    layerIndex: -1
};

/**
 * 初始化表格的列
 */
${g.entityName}.initColumn = function () {
    return [
        {field: 'selectItem', radio: true},
	<%for(field in t.fields){%>
	     {title: '${field.chinaName}', field: '${field.name}', align: 'center', valign: 'middle'},
	<%}%>
    ];
};

/**
 * 检查是否选中
 */
${g.entityName}.check = function () {
    var selected = $('#' + this.id).bootstrapTable('getSelections');
    if(selected.length == 0){
        Feng.info("请先选中表格中的某一记录！");
        return false;
    }else{
        ${g.entityName}.seItem = selected[0];
        return true;
    }
};

/**
 * 点击添加${g.name}
 */
${g.entityName}.openAdd${g.entityName} = function () {
    var index = layer.open({
        type: 2,
        title: '添加${g.name}',
        area: ['800px', '420px'],
        fix: false,
        maxmin: true,
        content: Feng.ctxPath + '/${strutil.toLowerCase(g.entityName)}/add_page'
    });
    this.layerIndex = index;
};

/**
 * 打开查看${g.name}详情
 */
${g.entityName}.open${g.entityName}Detail = function () {
    if (this.check()) {
        var index = layer.open({
            type: 2,
            title: '${g.name}详情',
            area: ['800px', '420px'],
            fix: false,
            maxmin: true,
            content: Feng.ctxPath + '/${strutil.toLowerCase(g.entityName)}/update_page/' + ${g.entityName}.seItem.id
        });
        this.layerIndex = index;
    }
};

/**
 * 删除${g.name}
 */
${g.entityName}.delete = function () {
    if (this.check()) {
        var operation = function(){
            var ajax = new $ax(Feng.ctxPath + "/${strutil.toLowerCase(g.entityName)}/delete", function (data) {
                Feng.success("删除成功!");
                ${g.entityName}.table.refresh();
            }, function (data) {
                Feng.error("删除失败!" + data.responseJSON.message + "!");
            });
            ajax.set("id",${g.entityName}.seItem.id);
            ajax.start();
        }

        Feng.confirm("是否刪除选中项?", operation);
    }
};

${g.entityName}.formParams = function() {
    var queryData = {};
    return queryData;
};

/**
 * 查询${g.name}列表
 */
${g.entityName}.search = function () {
    var queryData = {};
    queryData['condition'] = $("#condition").val();
    ${g.entityName}.table.refresh({query: queryData});
};

$(function () {
    var defaultColunms = ${g.entityName}.initColumn();
    var table = new BSTable(${g.entityName}.id, "/${strutil.toLowerCase(g.entityName)}/list", defaultColunms);
    table.setPaginationType("server");
    table.setQueryParams(${g.entityName}.formParams());
    ${g.entityName}.table = table.init();
});
