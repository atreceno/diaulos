// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain.security;

import com.atreceno.it.diaulos.domain.security.Role;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect Role_Roo_Equals {
    
    public boolean Role.equals(Object obj) {
        if (!(obj instanceof Role)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        Role rhs = (Role) obj;
        return new EqualsBuilder().append(id, rhs.id).append(name, rhs.name).isEquals();
    }
    
    public int Role.hashCode() {
        return new HashCodeBuilder().append(id).append(name).toHashCode();
    }
    
}