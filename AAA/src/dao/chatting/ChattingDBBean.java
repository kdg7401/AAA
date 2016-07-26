package dao.chatting;


import java.util.List;

import databean.ChattingDataBean;
import mybatis.SqlMapClient;

public class ChattingDBBean implements ChattingDao{
	
	public List<String> getChatting(){
		return SqlMapClient.getSession().selectList("Chatting.getChatting");
	}
	
	public int insertChatting(ChattingDataBean dto){
		return SqlMapClient.getSession().insert("Chatting.insertChatting", dto);
	}
	
} // class










