package ${g.codePackage}.dao;

import ${g.codePackage}.model.${g.entityName};

import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
import java.util.Map;

/**
 * ${g.entityName}Dao
 *
 * @author ${g.author}
 * @Date ${g.date}
 */
public interface ${g.entityName}Mapper extends Mapper<${g.entityName}>{

    /**
     * 查询列表
     * @param entity
     * @return
     */
    List<${g.entityName}> selectList(@Param("e")${g.entityName} entity);

    /**
     * 分页查询信息
     * @param entity
     * @return
     */
    List<${g.entityName}> selectPage(@Param("e") ${g.entityName} entity);

}
