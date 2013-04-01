package com.atreceno.it.diaulos.domain;

import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEquals
@RooJpaActiveRecord(finders = { "findCountrysByCodeEquals", "findCountrysByNameLike" })
@RooJson
public class Country {

	@Id
	@NotNull
	@Size(min = 3, max = 3)
	private String code;

	@NotNull
	@Size(max = 30)
	private String name;
}
