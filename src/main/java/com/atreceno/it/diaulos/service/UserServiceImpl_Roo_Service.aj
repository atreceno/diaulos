// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.service;

import com.atreceno.it.diaulos.domain.security.User;
import com.atreceno.it.diaulos.repository.UserRepository;
import com.atreceno.it.diaulos.service.UserServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect UserServiceImpl_Roo_Service {
    
    declare @type: UserServiceImpl: @Service;
    
    declare @type: UserServiceImpl: @Transactional;
    
    @Autowired
    UserRepository UserServiceImpl.userRepository;
    
    public long UserServiceImpl.countAllUsers() {
        return userRepository.count();
    }
    
    public void UserServiceImpl.deleteUser(User user) {
        userRepository.delete(user);
    }
    
    public User UserServiceImpl.findUser(Long id) {
        return userRepository.findOne(id);
    }
    
    public List<User> UserServiceImpl.findAllUsers() {
        return userRepository.findAll();
    }
    
    public List<User> UserServiceImpl.findUserEntries(int firstResult, int maxResults) {
        return userRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void UserServiceImpl.saveUser(User user) {
        userRepository.save(user);
    }
    
    public User UserServiceImpl.updateUser(User user) {
        return userRepository.save(user);
    }
    
}
