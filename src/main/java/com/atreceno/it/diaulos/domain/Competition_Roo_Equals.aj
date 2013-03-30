// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Competition;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect Competition_Roo_Equals {
    
    public boolean Competition.equals(Object obj) {
        if (!(obj instanceof Competition)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        Competition rhs = (Competition) obj;
        return new EqualsBuilder().append(code, rhs.code).append(description, rhs.description).append(finishDate, rhs.finishDate).append(id, rhs.id).append(name, rhs.name).append(officialResult, rhs.officialResult).append(startDate, rhs.startDate).append(venue, rhs.venue).isEquals();
    }
    
    public int Competition.hashCode() {
        return new HashCodeBuilder().append(code).append(description).append(finishDate).append(id).append(name).append(officialResult).append(startDate).append(venue).toHashCode();
    }
    
}
