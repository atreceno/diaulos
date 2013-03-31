// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.ParticPhase;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect ParticPhase_Roo_Json {
    
    public String ParticPhase.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static ParticPhase ParticPhase.fromJsonToParticPhase(String json) {
        return new JSONDeserializer<ParticPhase>().use(null, ParticPhase.class).deserialize(json);
    }
    
    public static String ParticPhase.toJsonArray(Collection<ParticPhase> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<ParticPhase> ParticPhase.fromJsonArrayToParticPhases(String json) {
        return new JSONDeserializer<List<ParticPhase>>().use(null, ArrayList.class).use("values", ParticPhase.class).deserialize(json);
    }
    
}