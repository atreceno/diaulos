// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.repository;

import com.atreceno.it.diaulos.domain.Phase;
import com.atreceno.it.diaulos.repository.PhaseRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect PhaseRepository_Roo_Jpa_Repository {
    
    declare parents: PhaseRepository extends JpaRepository<Phase, Long>;
    
    declare parents: PhaseRepository extends JpaSpecificationExecutor<Phase>;
    
    declare @type: PhaseRepository: @Repository;
    
}
