// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.EventGender;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect EventGender_Roo_Equals {
    
    public boolean EventGender.equals(Object obj) {
        if (!(obj instanceof EventGender)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        EventGender rhs = (EventGender) obj;
        return new EqualsBuilder().append(code, rhs.code).append(name, rhs.name).isEquals();
    }
    
    public int EventGender.hashCode() {
        return new HashCodeBuilder().append(code).append(name).toHashCode();
    }
    
}