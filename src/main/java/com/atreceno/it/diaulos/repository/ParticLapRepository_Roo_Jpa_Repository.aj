// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.repository;

import com.atreceno.it.diaulos.domain.ParticLap;
import com.atreceno.it.diaulos.repository.ParticLapRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect ParticLapRepository_Roo_Jpa_Repository {
    
    declare parents: ParticLapRepository extends JpaRepository<ParticLap, Long>;
    
    declare parents: ParticLapRepository extends JpaSpecificationExecutor<ParticLap>;
    
    declare @type: ParticLapRepository: @Repository;
    
}
