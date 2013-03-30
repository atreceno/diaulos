package com.atreceno.it.diaulos.domain;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierField = "code", identifierType = String.class)
@RooEquals
public class Venue {

    @NotNull
    @Size(min = 3, max = 3)
    private String code;

    @NotNull
    @Size(max = 25)
    private String name;

    @Size(max = 255)
    private String description;

    @Min(1L)
    @Max(100000L)
    private Integer capacity;

    @Size(max = 255)
    private String address;
}
