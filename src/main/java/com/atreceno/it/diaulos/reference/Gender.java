package com.atreceno.it.diaulos.reference;

public enum Gender {

	MALE("M", "Male"), FEMALE("F", "Female");

	private final String code;
	private final String name;

	private Gender(String code, String name) {
		this.code = code;
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public String getName() {
		return name;
	}

}
