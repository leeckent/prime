package ${g.codePackage}.model;

import javax.persistence.*;
import java.util.Date;

/**
 * ${g.name}
 *
 * @author ${g.author}
 * @Date ${g.date}
 */
@Table(name = "${g.tableName}")
public class ${g.entityName} {

    private static final long serialVersionUID = 1L;


		<%for(field in t.fields){%>
		     /**
		     * ${field.chinaName}
		     * ${field.comment}
		     */
			<%if (field.name == 'id') {%>
			@Id
			@GeneratedValue(strategy = GenerationType.IDENTITY)
			private Long ${field.name};
			<%}else{%>
			@Column(name="${field.fieldName}")
			private ${field.type} ${field.name};
			<%}%>


		<%}%>

		<%for(field in t.fields){%>
		     /**
		     * 获取: ${field.chinaName}
		     * ${field.comment}
		     */

		    public <%if (field.name == 'id') {%>Long<%}else{%>${field.type}<%}%> get${strutil.toUpperCase(strutil.subStringTo (field.name,0,1))}${strutil.subString  (field.name,1)}() {
			return ${field.name};
		    }
		     /**
		     * 设置: ${field.chinaName}
		     * ${field.comment}
		     */
		    public void set${strutil.toUpperCase(strutil.subStringTo (field.name,0,1))}${strutil.subString  (field.name,1)}(<%if (field.name == 'id') {%>Long<%}else{%>${field.type}<%}%> ${field.name}) {
			this.${field.name} = ${field.name};
		    }
		<%}%>

}
