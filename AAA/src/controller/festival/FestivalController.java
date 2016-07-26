package controller.festival;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.festival.FestivalDao;
import databean.FestivalDataBean;
import databean.Search;


@Controller
public class FestivalController {

	@Resource( name="festivalDao" )
	private FestivalDao festivalDao;
	
	@RequestMapping( "/festivalList" )
	public ModelAndView festivalList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int pageSize = 3;
		int pageBlock = 3;
		ModelAndView modelAndView = new ModelAndView();	
		
		int count = festivalDao.getCount();
		String pageNum = null;
		int currentPage = 0;
		int start = 0;
		int end = 0;
		int number = 0;
		
		int pageCount = 0;
		int startPage = 0;
		int endPage = 0;
		
		pageNum = request.getParameter( "pageNum" );
		if( pageNum == null ) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt( pageNum );
		start = ( currentPage - 1 ) * pageSize + 1;	
		end = start + pageSize - 1 ;
		
		request.setAttribute( "count", count );
		request.setAttribute( "pageNum", pageNum);
		request.setAttribute( "currentPage", currentPage );
		
		if ( count != 0 ) {
			
			number = count - ( currentPage - 1 ) * pageSize;
			
			pageCount = count / pageSize + ( count%pageSize > 0 ? 1 : 0 );
			
			startPage = ( currentPage / pageBlock ) * pageBlock + 1;
			
			if( currentPage % pageBlock == 0 ) startPage -= pageBlock; 
						
			endPage = startPage + pageBlock - 1;	
					
			if( endPage > pageCount ) endPage = pageCount;
		
			System.out.println(start);
			System.out.println(end);
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			
			
			List<FestivalDataBean> list = festivalDao.list( map );
			request.setAttribute( "list", list );
			
			request.setAttribute( "number", number );
			request.setAttribute( "startPage", startPage);
			request.setAttribute( "endPage", endPage );
			request.setAttribute( "pageCount", pageCount );
			request.setAttribute( "pageBlock", pageBlock );
			
			modelAndView.addObject("center", "/board/festival/festival.jsp");
			modelAndView.setViewName("/index");
			
		}
		return modelAndView;
	}
	
	@RequestMapping( "/festivalSearch" )
	public ModelAndView festivalSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int pageSize = 3;
		int pageBlock = 3;
		ModelAndView modelAndView = new ModelAndView();	
		//수정필요
		int count = festivalDao.getCount();
		String pageNum = null;
		int currentPage = 0;
		int start = 0;
		int end = 0;
		int number = 0;
		
		int pageCount = 0;
		int startPage = 0;
		int endPage = 0;
		 
		 String area = request.getParameter("area");
		 String year = "";
		 if(!request.getParameter("year").equals("0")&&!request.getParameter("month").equals("0")){
			 year = request.getParameter("year")+"/"+request.getParameter("month");
		 }
		 String comment = request.getParameter("comment");
		 
		pageNum = request.getParameter( "pageNum" );
		if( pageNum == null ) {
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt( pageNum );
		start = ( currentPage - 1 ) * pageSize + 1;	
		end = start + pageSize - 1 ;
		
		request.setAttribute( "count", count );
		request.setAttribute( "pageNum", pageNum);
		request.setAttribute( "currentPage", currentPage );
		
		if ( count != 0 ) {
			
			number = count - ( currentPage - 1 ) * pageSize;
			
			pageCount = count / pageSize + ( count%pageSize > 0 ? 1 : 0 );
			
			startPage = ( currentPage / pageBlock ) * pageBlock + 1;
			
			if( currentPage % pageBlock == 0 ) startPage -= pageBlock; 
						
			endPage = startPage + pageBlock - 1;	
					
			if( endPage > pageCount ) endPage = pageCount;
		
			Search search = new Search();
			
			System.out.println(start);
			System.out.println(end);
			
			search.setStart(start);
			search.setEnd(end);
			search.setArea(area);
			search.setYear(year);
			search.setComment(comment);
			
			List<FestivalDataBean> list = festivalDao.list( search );
			request.setAttribute( "list", list );
			
			request.setAttribute( "number", number );
			request.setAttribute( "startPage", startPage);
			request.setAttribute( "endPage", endPage );
			request.setAttribute( "pageCount", pageCount );
			request.setAttribute( "pageBlock", pageBlock );
			
			modelAndView.setViewName("/board/festival/festivalSearch");
			
		}
		return modelAndView;
	}
	
	@RequestMapping( "/festivalContent" )
	public ModelAndView festivalContent( HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int board_num = Integer.parseInt(request.getParameter( "board_num" ));
		FestivalDataBean dto = festivalDao.selectFestival( board_num );
		
		festivalDao.clickCount( board_num );
	
		request.setAttribute( "dto", dto );
		ModelAndView modelAndView = new ModelAndView();	
		modelAndView.addObject("center", "/board/festival/content.jsp");
		modelAndView.setViewName("/index");

		return modelAndView;
		
	}
}








