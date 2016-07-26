package databean;

import java.sql.Timestamp;

public class MeetingDataBean {
	private int meeting_num;
	private String id;
	private String meeting_title;
	private int meeting_readcount;
	private String meeting_area;
	private int meeting_people;
	private int meeting_age;
	private String meeting_content;
	private int meeting_check;
	private Timestamp reg_date;
	
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getMeeting_num() {
		return meeting_num;
	}
	public void setMeeting_num(int meeting_num) {
		this.meeting_num = meeting_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMeeting_title() {
		return meeting_title;
	}
	public void setMeeting_title(String meeting_title) {
		this.meeting_title = meeting_title;
	}
	public int getMeeting_readcount() {
		return meeting_readcount;
	}
	public void setMeeting_readcount(int meeting_readcount) {
		this.meeting_readcount = meeting_readcount;
	}
	public String getMeeting_area() {
		return meeting_area;
	}
	public void setMeeting_area(String meeting_area) {
		this.meeting_area = meeting_area;
	}
	public int getMeeting_people() {
		return meeting_people;
	}
	public void setMeeting_people(int meeting_people) {
		this.meeting_people = meeting_people;
	}
	public int getMeeting_age() {
		return meeting_age;
	}
	public void setMeeting_age(int meeting_age) {
		this.meeting_age = meeting_age;
	}
	public String getMeeting_content() {
		return meeting_content;
	}
	public void setMeeting_content(String meeting_content) {
		this.meeting_content = meeting_content;
	}
	public int getMeeting_check() {
		return meeting_check;
	}
	public void setMeeting_check(int meeting_check) {
		this.meeting_check = meeting_check;
	}

	
}
