package dao.member;

import databean.MemberDataBean;

public interface MemberDao {
	public int check( String id, String passwd );
	public int check( String id );
	public int insertMember( MemberDataBean dto );
	public int send(String email);
}
