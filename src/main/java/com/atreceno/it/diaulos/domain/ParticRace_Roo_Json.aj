// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.ParticRace;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect ParticRace_Roo_Json {
    
    public String ParticRace.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public String ParticRace.toJson(String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(this);
    }
    
    public static ParticRace ParticRace.fromJsonToParticRace(String json) {
        return new JSONDeserializer<ParticRace>().use(null, ParticRace.class).deserialize(json);
    }
    
    public static String ParticRace.toJsonArray(Collection<ParticRace> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static String ParticRace.toJsonArray(Collection<ParticRace> collection, String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<ParticRace> ParticRace.fromJsonArrayToParticRaces(String json) {
        return new JSONDeserializer<List<ParticRace>>().use(null, ArrayList.class).use("values", ParticRace.class).deserialize(json);
    }
    
}
