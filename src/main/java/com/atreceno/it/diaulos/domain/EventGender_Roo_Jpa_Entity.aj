// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.EventGender;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect EventGender_Roo_Jpa_Entity {
    
    declare @type: EventGender: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "code_")
    private String EventGender.code_;
    
    @Version
    @Column(name = "version")
    private Integer EventGender.version;
    
    public String EventGender.getCode_() {
        return this.code_;
    }
    
    public void EventGender.setCode_(String id) {
        this.code_ = id;
    }
    
    public Integer EventGender.getVersion() {
        return this.version;
    }
    
    public void EventGender.setVersion(Integer version) {
        this.version = version;
    }
    
}
