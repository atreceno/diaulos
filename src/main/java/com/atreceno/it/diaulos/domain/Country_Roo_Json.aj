// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Country;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Country_Roo_Json {
    
    public String Country.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public String Country.toJson(String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(this);
    }
    
    public static Country Country.fromJsonToCountry(String json) {
        return new JSONDeserializer<Country>().use(null, Country.class).deserialize(json);
    }
    
    public static String Country.toJsonArray(Collection<Country> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static String Country.toJsonArray(Collection<Country> collection, String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<Country> Country.fromJsonArrayToCountrys(String json) {
        return new JSONDeserializer<List<Country>>().use(null, ArrayList.class).use("values", Country.class).deserialize(json);
    }
    
}
