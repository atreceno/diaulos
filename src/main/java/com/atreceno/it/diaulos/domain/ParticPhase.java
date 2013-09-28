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
@Table(uniqueConstraints = { @UniqueConstraint(columnNames = { "phase_id",
		"participant_id" }) })
public class ParticPhase {

	@NotNull
	@ManyToOne
	@JoinColumn(name = "phase_id")
	private Phase phase;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "participant_id")
	private Participant participant;

	private Integer rank;

	private String result;

	private Boolean qualified;
}
