package com.atreceno.it.diaulos.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooEquals
public class Competition {

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
    @DateTimeFormat(style = "M-")
    private Date startDate;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date finishDate;

    private Boolean officialResult;

//    @NotNull
//    @ManyToOne
//    @JoinColumn(name = "phase_id")
//    private Phase phase;

    @ManyToOne
    @JoinColumn(name = "venue_code")
    private Venue venue;
}
