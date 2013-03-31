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
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity
@RooEquals
@RooJson
public class Phase {

    @NotNull
    @Column(unique = true)
    @Size(min = 7, max = 7)
    private String code;

    @NotNull
    @Size(max = 45)
    private String name;

    @Size(max = 255)
    private String description;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "event_id")
    private Event event;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "phase")
    private Set<Race> races = new HashSet<Race>();

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "phase")
    private Set<ParticPhase> participants = new HashSet<ParticPhase>();
}
