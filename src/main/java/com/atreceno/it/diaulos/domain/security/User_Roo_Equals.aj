// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain.security;

import com.atreceno.it.diaulos.domain.security.User;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect User_Roo_Equals {
    
    public boolean User.equals(Object obj) {
        if (!(obj instanceof User)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        User rhs = (User) obj;
        return new EqualsBuilder().append(enabled, rhs.enabled).append(id, rhs.id).append(password, rhs.password).append(username, rhs.username).isEquals();
    }
    
    public int User.hashCode() {
        return new HashCodeBuilder().append(enabled).append(id).append(password).append(username).toHashCode();
    }
    
}
