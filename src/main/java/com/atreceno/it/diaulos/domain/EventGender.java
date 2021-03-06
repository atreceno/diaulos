package com.atreceno.it.diaulos.domain;

import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.equals.RooEquals;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooEquals
@RooJson
public class EventGender {

	@Id
    @NotNull
    @Size(min = 1, max = 1)
    private String code;

    @NotNull
    @Size(max = 15)
    private String name;
}
