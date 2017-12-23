package ${g.codePackage}.controller;

import com.feizhou.creep.annotion.Permission;
import com.feizhou.creep.framework.common.controller.BaseController;
import com.feizhou.creep.framework.common.exception.BusinessException;
import com.feizhou.creep.framework.core.annotion.log.BusinessLog;
import com.feizhou.creep.framework.core.util.ToolUtil;
import com.feizhou.creep.module.system.SystemConstant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * ${g.name}控制器
 *
 * @author ${g.author}
 * @Date ${g.date}
 */
@Controller
@RequestMapping("/${strutil.toLowerCase(g.entityName)}")
public class ${g.entityName}Controller extends BaseController {

    private String PREFIX = "/${strutil.toLowerCase(g.entityName)}/";

    @Autowired
    private ${g.entityName}Service ${strutil.toLowerCase(strutil.subStringTo (g.entityName,0,1))}${strutil.subString  (g.entityName,1)}Service;

    /**
     * 首页
     *
     * @return
     */
    @RequestMapping("")
    public String index() {
        return PREFIX + "${strutil.toLowerCase(g.entityName)}.html";
    }

    /**
     * 新增
     *
     * @return
     */
    @RequestMapping("/add_page")
    public String ${g.entityName}Add() {
        return PREFIX + "${strutil.toLowerCase(g.entityName)}_add.html";
    }

    /**
     * 修改
     *
     * @return
     */
    @RequestMapping("/update_page/{id}")
    public String ${g.entityName}Update(@PathVariable Long id, Model entity) {
	entity.addAttribute("${strutil.toLowerCase(g.entityName)}", ${strutil.toLowerCase(strutil.subStringTo (g.entityName,0,1))}${strutil.subString  (g.entityName,1)}Service.selectById(id));
        return PREFIX + "${strutil.toLowerCase(g.entityName)}_edit.html";
    }

    /**
     * 获取列表
     */
    @RequestMapping(value = "/list")
    @ResponseBody
    public Object list(${g.entityName} entity) {
        PageParam pageParam = getPageParam();
        PageHelper.offsetPage(pageParam.getOffset(), pageParam.getLimit());
        List<${g.entityName}> result = ${strutil.toLowerCase(strutil.subStringTo (g.entityName,0,1))}${strutil.subString  (g.entityName,1)}Service.selectPage(entity);
        return ResponsePage(result);
    }

    @BusinessLog(desc = "${g.name}新增")
    @RequestMapping(value = "/add")
    @Permission
    @ResponseBody
    public Object add(${g.entityName} entity) {
        ${strutil.toLowerCase(strutil.subStringTo (g.entityName,0,1))}${strutil.subString  (g.entityName,1)}Service.insert(entity);
        return SUCCESS_RESPONSE;
    }

    @BusinessLog(desc = "${g.name}删除")
    @RequestMapping(value = "/delete")
    @Permission
    @ResponseBody
    public Object delete(Long id) {
        ${strutil.toLowerCase(strutil.subStringTo (g.entityName,0,1))}${strutil.subString  (g.entityName,1)}Service.deleteById(id);
        return SUCCESS_RESPONSE;
    }


    @BusinessLog(desc = "${g.name}修改")
    @RequestMapping(value = "/update")
    @Permission
    @ResponseBody
    public Object update(${g.entityName} entity) {
        if (ToolUtil.isOneEmpty(entity.getId())) {
        throw new BusinessException(SystemConstant.PARAM_EXCEPTION);
        }
        ${strutil.toLowerCase(strutil.subStringTo (g.entityName,0,1))}${strutil.subString  (g.entityName,1)}Service.updateById(entity);
        return super.SUCCESS_RESPONSE;
    }

    /**
     * 详情
     */
    @RequestMapping(value = "/detail")
    @ResponseBody
    public Object detail(${g.entityName} entity) {
        return ${strutil.toLowerCase(strutil.subStringTo (g.entityName,0,1))}${strutil.subString  (g.entityName,1)}Service.selectOne(entity);
    }
}
