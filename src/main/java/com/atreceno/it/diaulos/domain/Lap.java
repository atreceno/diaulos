package com.atreceno.it.diaulos.domain;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity
@RooEquals
public class Lap {

    @NotNull
    private String code;

    @Size(max = 20)
    private String name;

    private BigDecimal cumulativeDistance;

    private BigDecimal partialDistance;

    @NotNull
    @ManyToOne
    @JoinColumn(name = "competition_id")
    private Race race;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "lap")
    private Set<ParticLap> participants = new HashSet<ParticLap>();
}
