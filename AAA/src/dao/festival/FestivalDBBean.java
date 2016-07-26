package dao.festival;

import java.util.List;
import java.util.Map;

import databean.FestivalDataBean;
import databean.Search;
import mybatis.SqlMapClient;

public class FestivalDBBean implements FestivalDao {
	
	public List<FestivalDataBean> allList() {
		return SqlMapClient.getSession().selectList( "Festival.allList");
	}
	
	public List<FestivalDataBean> list(Map<String,Integer> map ) {
		return SqlMapClient.getSession().selectList( "Festival.getList", map);
	}
	
	public List<FestivalDataBean> list(Search search ){
		return SqlMapClient.getSession().selectList( "Festival.searchFestivalList", search);
	};
	
	public FestivalDataBean selectFestival(int board_num){
		return SqlMapClient.getSession().selectOne("Festival.selectFestival", board_num );
	}
	
	public List<FestivalDataBean> festivalSearch(Search search){
		return SqlMapClient.getSession().selectList( "Festival.searchFestival", search);
	}
	
	public int clickCount( int board_num ) {
		return SqlMapClient.getSession().update( "Festival.clickCount", board_num );
	}
	
	public int getCount() {
		return SqlMapClient.getSession().selectOne( "Festival.getCount" );
	} 
	
	
	

}
