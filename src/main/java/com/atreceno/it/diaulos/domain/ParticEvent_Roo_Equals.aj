// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.ParticEvent;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect ParticEvent_Roo_Equals {
    
    public boolean ParticEvent.equals(Object obj) {
        if (!(obj instanceof ParticEvent)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        ParticEvent rhs = (ParticEvent) obj;
        return new EqualsBuilder().append(event, rhs.event).append(id, rhs.id).append(medal, rhs.medal).append(participant, rhs.participant).append(rank, rhs.rank).append(result, rhs.result).isEquals();
    }
    
    public int ParticEvent.hashCode() {
        return new HashCodeBuilder().append(event).append(id).append(medal).append(participant).append(rank).append(result).toHashCode();
    }
    
}
