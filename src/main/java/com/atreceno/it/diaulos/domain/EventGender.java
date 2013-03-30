package com.atreceno.it.diaulos.domain;

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
public class EventGender {

    @NotNull
    @Size(min = 1, max = 1)
    private String code;

    @NotNull
    @Size(max = 15)
    private String name;
}
