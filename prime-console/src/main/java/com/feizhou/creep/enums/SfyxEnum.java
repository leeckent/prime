package com.feizhou.creep.enums;

import com.feizhou.creep.helper.enums.EnumIntType;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * 是否有效，针对所有数据表的数据有效性
 */
public enum SfyxEnum implements EnumIntType<SfyxEnum> {

    /**
     * 无效
     */
    Wx(1,"无效",""),
    /**
     * 有效
     */
    Yx(0,"有效",""),
    
    NULL(-1, "", "");

    // 字典代码
    private int id;
    // 字典名称
    private String name;
    // 串行代码
    private String serialCode;

    /**
     * 私有构造函数，只允枚举声明创建
     * @param id
     * @param name
     * @param serialCode
     */
    private SfyxEnum(int id, String name, String serialCode) {
        this.id = id;
        this.name = name;
        this.serialCode = serialCode;
    }

    // 字典代码缓存
    private static final Map<Integer, SfyxEnum> map = new HashMap<Integer, SfyxEnum>(values().length);
    // 串行代码缓存
    private static final Map<String, SfyxEnum> mapSerialCode = new HashMap<String, SfyxEnum>(values().length);

    static {
        // 初始化
        for (SfyxEnum instance : values()) {
            map.put(instance.intValue(), instance);
            mapSerialCode.put(instance.getSerialCode(), instance);
        }
    }

    /**
     * 获得所有的字典项目
     * @return
     */
    public static List<SfyxEnum> getAllEnum() {
        List<SfyxEnum> list = new LinkedList<SfyxEnum>();
        for (SfyxEnum instance : values()) {
            if (!instance.isNull()) {
                list.add(instance);
            }
        }
        return list;
    }

    public static SfyxEnum value2Obj(Integer intValue) {
        SfyxEnum instance = map.get(intValue);
        return instance == null ? NULL : instance;
    }

    public boolean isNull() {
        return NULL == this;
    }

    @Override
    public int intValue() {
        return this.id;
    }

    @Override
    public SfyxEnum getNull() {
        return NULL;
    }

	@Override
    public String getName() {
        return name;
    }

    public String getSerialCode() {
        return serialCode;
    }
}
