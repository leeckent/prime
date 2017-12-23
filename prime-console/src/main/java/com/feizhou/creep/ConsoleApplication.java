package com.feizhou.creep;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 启动类
 *
 * @author lee
 * @version V1.0.0
 * @date 2017/10/18
 */
@SpringBootApplication
@EnableAspectJAutoProxy(exposeProxy = true)
public class ConsoleApplication extends WebMvcConfigurerAdapter {

    protected final static Logger logger = LoggerFactory.getLogger(ConsoleApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(ConsoleApplication.class, args);
    }
}
