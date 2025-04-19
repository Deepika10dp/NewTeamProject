package com.SBPDCL.bean;

public class Section {
    private int id;
    private String name;
    private int subDivisionId;

    public Section() {}

    public Section(int id, String name, int subDivisionId) {
        this.id = id;
        this.name = name;
        this.subDivisionId = subDivisionId;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSubDivisionId() {
		return subDivisionId;
	}

	public void setSubDivisionId(int subDivisionId) {
		this.subDivisionId = subDivisionId;
	}

	@Override
	public String toString() {
		return "Section [id=" + id + ", name=" + name + ", subDivisionId=" + subDivisionId + "]";
	}

    
	
}
