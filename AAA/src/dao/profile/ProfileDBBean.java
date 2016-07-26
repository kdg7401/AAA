package dao.profile;

import java.util.List;
import java.util.Map;

import databean.MeetingListDataBean;
import mybatis.SqlMapClient;

public class ProfileDBBean implements ProfileDao{
	public int getCount()
	{
		return SqlMapClient.getSession().selectOne("Profile.getCount");
	}
	public List<MeetingListDataBean> meetingList(Map<String, Integer> map)
	{
		return SqlMapClient.getSession().selectList("Profile.meetingList", map);
	}
	
}
