package dao.profile;

import java.util.List;
import java.util.Map;

import databean.MeetingListDataBean;

public interface ProfileDao {
	public int getCount();
	public List<MeetingListDataBean> meetingList(Map<String, Integer>map);

}
