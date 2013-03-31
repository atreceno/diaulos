package com.atreceno.it.diaulos.repository;

import com.atreceno.it.diaulos.domain.security.User;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = User.class)
public interface UserRepository {
}
