package com.atreceno.it.diaulos.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString(excludeFields = "events")
@RooEquals
@RooJpaActiveRecord(finders = { "findSportsByCodeEquals",
		"findSportsByNameLike" })
@RooJson
public class Sport {

	@Id
	@NotNull
	@Size(min = 2, max = 2)
	private String code;

	@NotNull
	@Size(max = 25)
	private String name;

	@Size(max = 255)
	private String description;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "sport")
	private Set<Event> events = new HashSet<Event>();
}
