package com.atreceno.it.diaulos.repository;

import com.atreceno.it.diaulos.domain.Lap;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Lap.class)
public interface LapRepository {
}
