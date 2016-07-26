package dao.meeting;

import databean.MeetingDataBean;
import mybatis.SqlMapClient;

public class MeetingDBBean implements MeetingDao{

	public MeetingDataBean getContent(int meeting_num)
	{
		return SqlMapClient.getSession().selectOne("Meeting.getContent", meeting_num);
	}
	public int selectMeetingWrite(MeetingDataBean mdto)
	{
		return SqlMapClient.getSession().insert("Meeting.selectMeetingWrite", mdto);
	}
	public int selectMeetingDelete(int meeting_num)
	{
		return SqlMapClient.getSession().delete("Meeting.selectMeetingDelete", meeting_num);
	}
	public int selectMeetingUpdate(MeetingDataBean mdto)
	{
		return SqlMapClient.getSession().update("Meeting.selectMeetingUpdate", mdto);
	}
}
