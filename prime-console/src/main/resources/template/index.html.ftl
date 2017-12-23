@layout("/common/_container.html"){
<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <div class="row row-lg">
                    <div class="col-sm-12">
                        <div class="row">
                            <div class="col-sm-3">
                                <${"#"}NameCon id="condition" name="名称" />
                            </div>
                            <div class="col-sm-3">
                                <${"#"}button name="搜索" btnCss="primary btn-sm" icon="fa-search" clickFun="${g.entityName}.search()"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-sm-12">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>${g.name}管理</h5>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">
                    <div class="col-sm-12">
                        <div class="hidden-xs" id="${g.entityName}TableToolbar" role="group">
                            @if(shiro.hasPermission("/${strutil.toLowerCase(g.entityName)}/add")){
                                <${"#"}button name="添加" btnCss="primary btn-sm" icon="fa-plus" clickFun="${g.entityName}.openAdd${g.entityName}()"/>
                            @}
                            @if(shiro.hasPermission("/${strutil.toLowerCase(g.entityName)}/update")){
                                <${"#"}button name="修改" btnCss="primary btn-sm" icon="fa-edit" clickFun="${g.entityName}.open${g.entityName}Detail()" space="true"/>
                            @}
                            @if(shiro.hasPermission("/${strutil.toLowerCase(g.entityName)}/delete")){
                                <${"#"}button name="删除" btnCss="primary btn-sm" icon="fa-remove" clickFun="${g.entityName}.delete()" space="true"/>
                            @}
                        </div>
                        <${"#"}table id="${g.entityName}Table"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="\${ctxPath}/static/modular/${strutil.toLowerCase(g.entityName)}/${strutil.toLowerCase(g.entityName)}.js"></script>
@}
