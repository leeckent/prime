package com.feizhou.creep.plugins;

import com.feizhou.creep.config.beetl.BeetlConfiguration;
import com.feizhou.creep.framework.common.plugin.IPlugin;
import com.feizhou.creep.framework.common.plugin.annotation.Plugin;
import com.feizhou.creep.module.prime.tag.SelectDictTag;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 系统初始化插件
 *
 * @author lee
 * @version V1.0.0
 * @date 2017/11/21
 */
@Plugin(value = "系统初始化插件")
public class InitConfig implements IPlugin {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    BeetlConfiguration beetlConfiguration;

    public void initBeetlTags() {
        beetlConfiguration.getGroupTemplate().registerTag("SelectDict", SelectDictTag.class);
    }

    @Override
    public boolean init(String[] args) {
        System.out.println("加载系统配置参数...");
        System.out.println("================ 插件测试 ==================");
        System.out.println("系统配置初始化完成，当前系统版本：1.0.0");
        initBeetlTags();
        return true;
    }

    @Override
    public void destroy(String[] args) {
        System.out.println("系统配置参数已注销");
    }
}
