package com.atreceno.it.diaulos.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString(excludeFields = { "laps", "participants" })
@RooJpaEntity
@RooEquals
@RooJson
public class Race {

    @NotNull
    @Column(unique = true)
    @Size(min = 9, max = 9)
    private String code;

    @NotNull
    @Size(max = 45)
    private String name;

    @Size(max = 255)
    private String description;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Date startDate;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Date finishDate;

    private Boolean official;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "phase_id")
    private Phase phase;

    @ManyToOne
    @JoinColumn(name = "venue_code")
    private Venue venue;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "race")
    private Set<Lap> laps = new HashSet<Lap>();

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "race")
    private Set<ParticRace> participants = new HashSet<ParticRace>();
}
