// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Country;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

privileged aspect Country_Roo_Finder {
    
    public static TypedQuery<Country> Country.findCountrysByCodeEquals(String code) {
        if (code == null || code.length() == 0) throw new IllegalArgumentException("The code argument is required");
        EntityManager em = Country.entityManager();
        TypedQuery<Country> q = em.createQuery("SELECT o FROM Country AS o WHERE o.code = :code", Country.class);
        q.setParameter("code", code);
        return q;
    }
    
    public static TypedQuery<Country> Country.findCountrysByNameLike(String name) {
        if (name == null || name.length() == 0) throw new IllegalArgumentException("The name argument is required");
        name = name.replace('*', '%');
        if (name.charAt(0) != '%') {
            name = "%" + name;
        }
        if (name.charAt(name.length() - 1) != '%') {
            name = name + "%";
        }
        EntityManager em = Country.entityManager();
        TypedQuery<Country> q = em.createQuery("SELECT o FROM Country AS o WHERE LOWER(o.name) LIKE LOWER(:name)", Country.class);
        q.setParameter("name", name);
        return q;
    }
    
}
