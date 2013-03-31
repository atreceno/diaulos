// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Participant;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Participant_Roo_Json {
    
    public String Participant.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static Participant Participant.fromJsonToParticipant(String json) {
        return new JSONDeserializer<Participant>().use(null, Participant.class).deserialize(json);
    }
    
    public static String Participant.toJsonArray(Collection<Participant> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<Participant> Participant.fromJsonArrayToParticipants(String json) {
        return new JSONDeserializer<List<Participant>>().use(null, ArrayList.class).use("values", Participant.class).deserialize(json);
    }
    
}
