// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain.security;

import com.atreceno.it.diaulos.domain.security.Role;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Role_Roo_Json {
    
    public String Role.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public String Role.toJson(String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(this);
    }
    
    public static Role Role.fromJsonToRole(String json) {
        return new JSONDeserializer<Role>().use(null, Role.class).deserialize(json);
    }
    
    public static String Role.toJsonArray(Collection<Role> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static String Role.toJsonArray(Collection<Role> collection, String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<Role> Role.fromJsonArrayToRoles(String json) {
        return new JSONDeserializer<List<Role>>().use(null, ArrayList.class).use("values", Role.class).deserialize(json);
    }
    
}
