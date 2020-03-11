package model;

public class Jobs {
	private int jobid;
	private String title;
	private String description;
	private int jobtype;
	private int status;
	private String expiration_date;
	private int employer_id;

public int getjobid() {
	return jobid;
}

public void setjobid(int jobid) {
	this.jobid = jobid;
	
}

public int getemployerid() {
	return employer_id;
}

public void setemployerid(int employer_id) {
	this.employer_id = employer_id;
}

public String gettitle() {
	return title;
}

public void settitle(String title) {
	this.title = title;
}

public String getdescription() {
	return description;
}

public void setdescription(String description) {
	this.description = description;
}

public int getjobtype() {
	return jobtype;
}

public void setjobtype(int jobtype) {
	this.jobtype = jobtype;
}

public int getstatus() {
	return status;
}

public void setstatus(int status) {
	this.status = status;
}

public String getexpiration_date() {
	return expiration_date;
}

public void setexpiration_date(String expiration_date) {
	this.expiration_date = expiration_date;
}

}