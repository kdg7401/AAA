package dao.festival;

import java.util.List;
import java.util.Map;

import databean.FestivalDataBean;
import databean.Search;

public interface FestivalDao {
	public List<FestivalDataBean> allList();
	public List<FestivalDataBean> list(Map<String,Integer> map );
	public List<FestivalDataBean> list(Search search );
	public FestivalDataBean selectFestival(int board_num);
	public int clickCount( int board_num );
	public int getCount();
	public List<FestivalDataBean> festivalSearch(Search search);
}
