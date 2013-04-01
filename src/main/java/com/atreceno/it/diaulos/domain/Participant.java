package com.atreceno.it.diaulos.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

import com.atreceno.it.diaulos.reference.Gender;

@RooJavaBean
@RooToString
@RooJpaEntity
@RooEquals
@RooJson
public class Participant {

    @NotNull
    @Column(unique = true)
    private String code;

    @NotNull
    @Size(min = 3, max = 30)
    private String firstName;

    @NotNull
    @Size(min = 3, max = 30)
    private String lastName;

    @NotNull
    @Enumerated(EnumType.STRING)
    private Gender gender;

    @Size(min = 6, max = 30)
    @Pattern(regexp = "[a-zA-Z0-9.]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+")
    private String email;

    @NotNull
    @Past
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date birthDate;

//    @RooUploadedFile(contentType = "image/jpeg")
//    @Lob
//    private byte[] image;

    @DecimalMin("0.0")
    @DecimalMax("299.99")
    private BigDecimal weight;

    @DecimalMin("0.0")
    @DecimalMax("299.99")
    private BigDecimal height;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "participant")
    private Set<ParticLap> laps = new HashSet<ParticLap>();

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "participant")
    private Set<ParticRace> races = new HashSet<ParticRace>();

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "participant")
    private Set<ParticPhase> phases = new HashSet<ParticPhase>();

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "participant")
    private Set<ParticEvent> events = new HashSet<ParticEvent>();

    @ManyToOne
    @JoinColumn(name = "country_code")
    private Country country;
}
