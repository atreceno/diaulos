// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Medal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Version;

privileged aspect Medal_Roo_Jpa_Entity {
    
    declare @type: Medal: @Entity;
    
    @Version
    @Column(name = "version")
    private Integer Medal.version;
    
    public Integer Medal.getVersion() {
        return this.version;
    }
    
    public void Medal.setVersion(Integer version) {
        this.version = version;
    }
    
}
