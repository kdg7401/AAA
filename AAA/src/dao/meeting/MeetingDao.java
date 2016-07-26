package dao.meeting;

import databean.MeetingDataBean;

public interface MeetingDao {
	public MeetingDataBean getContent(int meeting_num);
	public int selectMeetingWrite(MeetingDataBean mdto);
	public int selectMeetingDelete(int meeting_num);
	public int selectMeetingUpdate(MeetingDataBean mdto);
}
