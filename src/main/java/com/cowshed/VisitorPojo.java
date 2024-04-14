package com.cowshed;

import java.sql.Timestamp;

public class VisitorPojo {
	private int eid;
	private String name;
	private int phno;
	private String email;
	private Timestamp etime;
	private Timestamp extime;
	
	public VisitorPojo() {}

	public VisitorPojo(String name, int phno, String email) {
		super();
		this.name = name;
		this.phno = phno;
		this.email = email;
	}

	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPhno() {
		return phno;
	}

	public void setPhno(int phno) {
		this.phno = phno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getEtime() {
		return etime;
	}

	public void setEtime(Timestamp etime) {
		this.etime = etime;
	}

	public Timestamp getExtime() {
		return extime;
	}

	public void setExtime(Timestamp extime) {
		this.extime = extime;
	}
	
	
	
}	
