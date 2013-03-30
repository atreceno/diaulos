package com.atreceno.it.diaulos.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooEquals
@RooJpaActiveRecord(identifierType = EventCode.class, finders = { "findEventsByCodeLike", "findEventsByDisciplineAndEventGender", "findEventsByNameLike" })
public class Event {

	@NotNull
	@ManyToOne
	@JoinColumn(name = "discipline_code", insertable = false, updatable = false)
	private Discipline discipline;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "gender_code", insertable = false, updatable = false)
	private EventGender eventGender;

	@NotNull
	@Size(min = 3, max = 3)
	@Column(insertable = false, updatable = false)
	private String subcode;

	@NotNull
	@Size(max = 45)
	private String name;

	@Size(max = 255)
	private String description;

//	@OneToMany(cascade = CascadeType.ALL, mappedBy = "event")
//	private Set<Phase> phases = new HashSet<Phase>();
}
