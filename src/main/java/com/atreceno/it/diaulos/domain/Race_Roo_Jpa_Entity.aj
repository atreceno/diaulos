// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Race;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Race_Roo_Jpa_Entity {
    
    declare @type: Race: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Race.id;
    
    @Version
    @Column(name = "version")
    private Integer Race.version;
    
    public Long Race.getId() {
        return this.id;
    }
    
    public void Race.setId(Long id) {
        this.id = id;
    }
    
    public Integer Race.getVersion() {
        return this.version;
    }
    
    public void Race.setVersion(Integer version) {
        this.version = version;
    }
    
}
