// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.ParticRace;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;

privileged aspect ParticRace_Roo_Equals {
    
    public boolean ParticRace.equals(Object obj) {
        if (!(obj instanceof ParticRace)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        ParticRace rhs = (ParticRace) obj;
        return new EqualsBuilder().append(bib, rhs.bib).append(id, rhs.id).append(lane, rhs.lane).append(participant, rhs.participant).append(race, rhs.race).append(rank, rhs.rank).append(result, rhs.result).isEquals();
    }
    
    public int ParticRace.hashCode() {
        return new HashCodeBuilder().append(bib).append(id).append(lane).append(participant).append(race).append(rank).append(result).toHashCode();
    }
    
}
