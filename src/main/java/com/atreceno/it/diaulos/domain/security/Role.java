package com.atreceno.it.diaulos.domain.security;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ManyToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
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
public class Role {

    @NotNull
    @Column(unique = true)
    @Size(min = 8, max = 20)
    @Pattern(regexp = "^ROLE_[A-Z]*")
    private String name;

    @ManyToMany(cascade = CascadeType.ALL, mappedBy = "roles")
    private Set<User> users = new HashSet<User>();
}
