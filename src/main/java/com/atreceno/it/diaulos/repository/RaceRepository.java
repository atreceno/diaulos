package com.atreceno.it.diaulos.repository;

import com.atreceno.it.diaulos.domain.Race;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Race.class)
public interface RaceRepository {
}
