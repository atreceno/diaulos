package com.atreceno.it.diaulos.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

import org.springframework.beans.factory.annotation.Configurable;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

@Configurable
@Embeddable
public final class EventCode implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "discipline_code", nullable = false)
    private String disciplineCode;

	@Column(name = "gender_code", nullable = false)
    private String genderCode;
	
	@Column(name = "subcode", nullable = false)
	private String subcode;

	public EventCode(String disciplineCode, String genderCode, String subcode) {
        super();
        this.disciplineCode = disciplineCode;
        this.genderCode = genderCode;
        this.subcode = subcode;
    }

	public EventCode() {
        super();
    }
	
	@Override
	public String toString() {
		return "EventCode [disciplineCode=" + disciplineCode + ", genderCode=" + genderCode + ", subcode=" + subcode + "]";
	}

	public String getDisciplineCode() {
		return disciplineCode;
	}

	public String getGenderCode() {
		return genderCode;
	}
	
	public String getSubcode() {
		return subcode;
	}

	public String toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }

	public static EventCode fromJsonToEventCode(String json) {
        return new JSONDeserializer<EventCode>().use(null, EventCode.class).deserialize(json);
    }

}
