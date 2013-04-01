package com.atreceno.it.diaulos.reference;

public enum Gender {

	M("Male"), F("Female");

	private final String name;

	private Gender(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
	
	public String toString() {
		return name;
	}

}
