// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.repository;

import com.atreceno.it.diaulos.domain.security.Role;
import com.atreceno.it.diaulos.repository.RoleRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect RoleRepository_Roo_Jpa_Repository {
    
    declare parents: RoleRepository extends JpaRepository<Role, Long>;
    
    declare parents: RoleRepository extends JpaSpecificationExecutor<Role>;
    
    declare @type: RoleRepository: @Repository;
    
}