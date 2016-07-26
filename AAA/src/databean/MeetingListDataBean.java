package databean;

import java.sql.Timestamp;

public class MeetingListDataBean {
	private String profile_img;
	private int meeting_num;
	private String meeting_title;
	private String meeting_area;
	private int meeting_people;
	private int meeting_age;
	private Timestamp reg_date;
	private String name;
	private String id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public int getMeeting_num() {
		return meeting_num;
	}
	public void setMeeting_num(int meeting_num) {
		this.meeting_num = meeting_num;
	}
	public String getMeeting_title() {
		return meeting_title;
	}
	public void setMeeting_title(String meeting_title) {
		this.meeting_title = meeting_title;
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
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
