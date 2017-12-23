package ${g.codePackage}.service;

import ${g.codePackage}.dao.${g.entityName}Mapper;
import ${g.codePackage}.model.${g.entityName};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
/**
 * ${g.name}Service
 *
 * @author ${g.author}
 * @Date ${g.date}
 */
@Service
public class ${g.entityName}Service {

    @Autowired
    private ${g.entityName}Mapper ${strutil.toLowerCase(strutil.subStringTo (g.entityName,0,1))}${strutil.subString  (g.entityName,1)}Mapper;

    public Integer insert(${g.entityName} entity) {
        return ${strutil.toLowerCase(strutil.subStringTo (g.entityName,0,1))}${strutil.subString  (g.entityName,1)}Mapper.insertSelective(entity);
    }

    public Integer deleteById(Long id) {
        return ${strutil.toLowerCase(strutil.subStringTo (g.entityName,0,1))}${strutil.subString  (g.entityName,1)}Mapper.deleteByPrimaryKey(id);
    }

    public Integer updateById(${g.entityName} entity) {
        return ${strutil.toLowerCase(strutil.subStringTo (g.entityName,0,1))}${strutil.subString  (g.entityName,1)}Mapper.updateByPrimaryKey(entity);
    }

    public ${g.entityName} selectById(Long id) {
        return ${strutil.toLowerCase(strutil.subStringTo (g.entityName,0,1))}${strutil.subString  (g.entityName,1)}Mapper.selectByPrimaryKey(id);
    }

    public ${g.entityName} selectOne(${g.entityName} entity) {
        return ${strutil.toLowerCase(strutil.subStringTo (g.entityName,0,1))}${strutil.subString  (g.entityName,1)}Mapper.selectOne(entity);
    }

    public Integer selectCount(${g.entityName} entity) {
        return ${strutil.toLowerCase(strutil.subStringTo (g.entityName,0,1))}${strutil.subString  (g.entityName,1)}Mapper.selectCount(entity);
    }

    public List<${g.entityName}> selectList(${g.entityName} entity) {
        return ${strutil.toLowerCase(strutil.subStringTo (g.entityName,0,1))}${strutil.subString  (g.entityName,1)}Mapper.selectList(entity);
    }

    public List<${g.entityName}> selectPage(${g.entityName} entity) {
        return ${strutil.toLowerCase(strutil.subStringTo (g.entityName,0,1))}${strutil.subString  (g.entityName,1)}Mapper.selectPage(entity);
    }

}
