// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain.security;

import com.atreceno.it.diaulos.domain.security.Role;
import com.atreceno.it.diaulos.domain.security.User;
import java.util.Set;

privileged aspect User_Roo_JavaBean {
    
    public String User.getUsername() {
        return this.username;
    }
    
    public void User.setUsername(String username) {
        this.username = username;
    }
    
    public String User.getPassword() {
        return this.password;
    }
    
    public void User.setPassword(String password) {
        this.password = password;
    }
    
    public Boolean User.getEnabled() {
        return this.enabled;
    }
    
    public void User.setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
    
    public Set<Role> User.getRoles() {
        return this.roles;
    }
    
    public void User.setRoles(Set<Role> roles) {
        this.roles = roles;
    }
    
}
