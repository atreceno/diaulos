package com.atreceno.it.diaulos.repository;

import com.atreceno.it.diaulos.domain.security.Role;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Role.class)
public interface RoleRepository {
}
