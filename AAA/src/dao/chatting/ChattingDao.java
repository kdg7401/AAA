package dao.chatting;

import java.util.List;

import databean.ChattingDataBean;

public interface ChattingDao {

	public List<String> getChatting();
	public int insertChatting(ChattingDataBean dto);
	
}
