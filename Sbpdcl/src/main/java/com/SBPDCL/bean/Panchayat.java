package com.SBPDCL.bean;
public class Panchayat {
    private int id;
    private String name;
    private int blockId;
    public Panchayat() {}
    public Panchayat(int id, String name, int blockId) {
        this.id = id;
        this.name = name;
        this.blockId = blockId;
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
	public int getBlockId() {
		return blockId;
	}
	public void setBlockId(int blockId) {
		this.blockId = blockId;
	}
	@Override
	public String toString() {
		return "Panchayat [id=" + id + ", name=" + name + ", blockId=" + blockId + "]";
	}  	
}
