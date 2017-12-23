package com.feizhou.creep.module.prime.service.dict;

import com.alibaba.fastjson.JSONObject;
import com.feizhou.creep.helper.enums.Enumeration;
import com.feizhou.creep.module.rscrm.dao.CustomerMapper;
import com.feizhou.creep.module.rscrm.model.Customer;
import com.feizhou.creep.module.system.dao.SystemUserMapper;
import com.feizhou.creep.module.system.model.SystemUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 字典服务
 *
 * @author lee
 * @version V1.0.0
 * @date 2017/11/21
 */
@Service
public class CustomerDictService {

    @Autowired
    private SystemUserMapper systemUserMapper;

    public List<Enumeration> searchDictByKey(String key, String params) {
        List<Enumeration> list = null;
        switch (key) {
            case DictKey.DICT_SYS_USER:
                list = searchSystemUserList(params);
                break;
        }
        return list;
    }

    private List<Enumeration> searchSystemUserList(String params) {
        Map json = (Map) JSONObject.parse(params);
        List<Enumeration> list = new ArrayList<>();
        List<SystemUser> userList = systemUserMapper.selectByExample(new Example(SystemUser.class));
        if (null != userList && 0 != userList.size()) {
            for (SystemUser user : userList) {
                Enumeration enumeration = new Enumeration();
                enumeration.setCode(user.getId().toString());
                enumeration.setName(user.getUserName());
                list.add(enumeration);
            }
        }
        return list;
    }
}
