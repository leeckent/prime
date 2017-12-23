<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${g.codePackage}.dao.${g.entityName}Mapper">

    <resultMap id="BaseResultMap" type="${g.codePackage}.model.${g.entityName}">
        <%for(field in t.fields){%>
        <result column="${field.fieldName}" property="${field.name}"/>
        <%}%>
    </resultMap>

    <sql id="Base_Column_List">
        <%for(field in t.fields){%>
        <%if(fieldLP.last){%>
    ${field.fieldName} as ${field.name}
        <%} else {%>
    ${field.fieldName} as ${field.name},
        <%}%>
        <%}%>
    </sql>

    <select id="selectList" resultMap="BaseResultMap">
        select * from ${g.tableName} t
        <where>
            <include refid="select_content"/>
        </where>
    </select>

    <select id="selectPage" resultMap="BaseResultMap">
        select * from ${g.tableName} t
        <where>
            <include refid="select_content"/>
        </where>
    </select>

    <sql id="select_content">
        <%for(field in t.fields){%>
        <if test="e.${field.name} != null and e.${field.name} != '' ">
            AND t.${strutil.toUpperCase(field.fieldName)} = #{e.${field.name}}
        </if>
        <%}%>
    </sql>

</mapper>
