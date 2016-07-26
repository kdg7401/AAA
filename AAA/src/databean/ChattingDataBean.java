package databean;

import java.sql.Timestamp;

public class ChattingDataBean {
	private int applicant_num;
	private String id;
	private String chatting_content;
	private String chatting_img;
	private int chatting_imgnum;
	private int chatting_imgcate;
	private Timestamp reg_date;
	
	
	public int getChatting_imgcate() {
		return chatting_imgcate;
	}
	public void setChatting_imgcate(int chatting_imgcate) {
		this.chatting_imgcate = chatting_imgcate;
	}
	public int getChatting_imgnum() {
		return chatting_imgnum;
	}
	public void setChatting_imgnum(int chatting_imgnum) {
		this.chatting_imgnum = chatting_imgnum;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getApplicant_num() {
		return applicant_num;
	}
	public void setApplicant_num(int applicant_num) {
		this.applicant_num = applicant_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getChatting_content() {
		return chatting_content;
	}
	public void setChatting_content(String chatting_content) {
		this.chatting_content = chatting_content;
	}
	public String getChatting_img() {
		return chatting_img;
	}
	public void setChatting_img(String chatting_img) {
		this.chatting_img = chatting_img;
	}
	
	
	
}









