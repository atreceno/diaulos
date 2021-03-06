package com.atreceno.it.diaulos.domain;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity
@RooEquals
@RooJson
@Table(uniqueConstraints = { @UniqueConstraint(columnNames = { "event_id",
"participant_id" }) })
public class ParticEvent {

	@NotNull
	@ManyToOne
	@JoinColumn(name = "event_id")
	private Event event;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "participant_id")
	private Participant participant;

	@ManyToOne
	@JoinColumn(name = "medal_code")
	private Medal medal;

	private Integer rank;

	private String result;
}
