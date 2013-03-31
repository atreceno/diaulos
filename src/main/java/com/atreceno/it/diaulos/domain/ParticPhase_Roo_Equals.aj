// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.ParticPhase;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect ParticPhase_Roo_Equals {
    
    public boolean ParticPhase.equals(Object obj) {
        if (!(obj instanceof ParticPhase)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        ParticPhase rhs = (ParticPhase) obj;
        return new EqualsBuilder().append(id, rhs.id).append(participant, rhs.participant).append(phase, rhs.phase).append(qualified, rhs.qualified).append(rank, rhs.rank).append(result, rhs.result).isEquals();
    }
    
    public int ParticPhase.hashCode() {
        return new HashCodeBuilder().append(id).append(participant).append(phase).append(qualified).append(rank).append(result).toHashCode();
    }
    
}