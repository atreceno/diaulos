// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.atreceno.it.diaulos.domain;

import com.atreceno.it.diaulos.domain.Venue;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect Venue_Roo_Json {
    
    public String Venue.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static Venue Venue.fromJsonToVenue(String json) {
        return new JSONDeserializer<Venue>().use(null, Venue.class).deserialize(json);
    }
    
    public static String Venue.toJsonArray(Collection<Venue> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<Venue> Venue.fromJsonArrayToVenues(String json) {
        return new JSONDeserializer<List<Venue>>().use(null, ArrayList.class).use("values", Venue.class).deserialize(json);
    }
    
}
