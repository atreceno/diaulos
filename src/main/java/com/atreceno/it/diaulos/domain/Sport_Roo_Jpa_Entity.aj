// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Sport;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Version;

privileged aspect Sport_Roo_Jpa_Entity {
    
    declare @type: Sport: @Entity;
    
    @Version
    @Column(name = "version")
    private Integer Sport.version;
    
    public Integer Sport.getVersion() {
        return this.version;
    }
    
    public void Sport.setVersion(Integer version) {
        this.version = version;
    }
    
}
