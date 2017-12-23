@layout("/common/_container.html"){
<div class="ibox float-e-margins">
    <div class="ibox-content">
        <div class="form-horizontal">

            <input type="hidden" id="id" value="">

            <div class="row">
                <div class="col-sm-6 b-r">
			<%for(field in t.fields){%>
			     <${"#"}input id="${field.name}" name="${field.chinaName}" underline="true"/>
			<%}%>
                </div>

                <div class="col-sm-6">

                </div>
            </div>

            <div class="row btn-group-m-t">
                <div class="col-sm-10">
                    <${"#"}button btnCss="info" name="提交" id="ensure" icon="fa-check" clickFun="${g.entityName}InfoDlg.addSubmit()"/>
                    <${"#"}button btnCss="danger" name="取消" id="cancel" icon="fa-eraser" clickFun="${g.entityName}InfoDlg.close()"/>
                </div>
            </div>
        </div>

    </div>
</div>
<script src="\${ctxPath}/static/modular/${strutil.toLowerCase(g.entityName)}/${strutil.toLowerCase(g.entityName)}_info.js"></script>
@}
