package com.feizhou.creep;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

/**
 * web 程序启动类
 *
 * @author lee
 * @version V1.0.0
 * @date 2017/10/18
 */
public class ConsoleServletInitializer extends SpringBootServletInitializer {

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(ConsoleApplication.class);
    }

}
