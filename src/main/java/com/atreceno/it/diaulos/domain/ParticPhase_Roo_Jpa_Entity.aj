// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.ParticPhase;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect ParticPhase_Roo_Jpa_Entity {
    
    declare @type: ParticPhase: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long ParticPhase.id;
    
    @Version
    @Column(name = "version")
    private Integer ParticPhase.version;
    
    public Long ParticPhase.getId() {
        return this.id;
    }
    
    public void ParticPhase.setId(Long id) {
        this.id = id;
    }
    
    public Integer ParticPhase.getVersion() {
        return this.version;
    }
    
    public void ParticPhase.setVersion(Integer version) {
        this.version = version;
    }
    
}
