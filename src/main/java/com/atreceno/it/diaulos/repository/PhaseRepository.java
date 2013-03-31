package com.atreceno.it.diaulos.repository;

import com.atreceno.it.diaulos.domain.Phase;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Phase.class)
public interface PhaseRepository {
}
