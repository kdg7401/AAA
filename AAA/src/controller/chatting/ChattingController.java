package controller.chatting;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.chatting.ChattingDao;
import dao.festival.FestivalDao;
import databean.ChattingDataBean;
import databean.FestivalDataBean;
import databean.Search;

@Controller
public class ChattingController {

	@Resource( name="chattingDao" )
	private ChattingDao chattingDao;	
	
	@Resource( name="festivalDao" )
	private FestivalDao festivalDao;
	
	@RequestMapping( "/chatting" )
	public ModelAndView chatting(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		 ModelAndView modelAndView = new ModelAndView();
		 modelAndView.setViewName("/chatting/chatting");
		return modelAndView;
	}
	
	
	
	@RequestMapping( "/getChatting" )
	public ModelAndView getChatting(HttpServletRequest request, HttpServletResponse response) throws Exception {

		 List<String> chatting = chattingDao.getChatting();
		 ModelAndView modelAndView = new ModelAndView();
		 modelAndView.addObject("chatting", chatting);
		 modelAndView.setViewName("/chatting/outputchat");
		return modelAndView;
	}
	
	@RequestMapping( "/insertChatting" )
	public ModelAndView insertChatting(HttpServletRequest request, HttpServletResponse response) throws Exception {
		   request.setCharacterEncoding("UTF-8");
			
		   int applicant_num = Integer.parseInt(request.getParameter("applicant_num"));
		   String id = request.getParameter("id");
		   String chatting_content = request.getParameter("chatting_content");
		   String chatting_img = request.getParameter("chatting_img");
		   ChattingDataBean dto = new ChattingDataBean();
		  
		   if(chatting_img!=null){
			   int chatting_imgnum = Integer.parseInt(request.getParameter("board_num"));
			   int chatting_imgcate = Integer.parseInt(request.getParameter("category_num"));
			   dto.setChatting_imgnum(chatting_imgnum);
			   dto.setChatting_imgcate(chatting_imgcate);
		   }
		   
		   dto.setApplicant_num(applicant_num);
		   dto.setId(id);
		   dto.setChatting_content(chatting_content);
		   dto.setChatting_img(chatting_img);
		  
		   
		   int result = chattingDao.insertChatting(dto); 
		   List<String> chatting = chattingDao.getChatting();
		   
		   ModelAndView modelAndView = new ModelAndView();
		   modelAndView.addObject("result", result);
		   modelAndView.addObject("chatting", chatting);
		   
		   if(dto.getChatting_img() == null){
			  modelAndView.setViewName("/chatting/outputchat");
		   }else{
			  modelAndView.setViewName("/chattingboard/close");
		   }
		   
		return modelAndView;
	}
	
	
	
	
	
	@RequestMapping( "/festivallist" )
	public ModelAndView festivallist(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView();
		
		
		List<FestivalDataBean> list =  festivalDao.allList();
		 
		 modelAndView.addObject("category_num",200);
		 modelAndView.addObject("list", list);
		 modelAndView.setViewName("/chattingboard/boardlist");
		
		return modelAndView;
	}
	
	@RequestMapping( "/festivalsearch" )
	public ModelAndView festivalsearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 request.setCharacterEncoding("UTF-8");
		
		 String area = request.getParameter("area");
		 String year = "";
		 if(!request.getParameter("year").equals("0")&&!request.getParameter("month").equals("0")){
			 year = request.getParameter("year")+"/"+request.getParameter("month");
		 }
		 String comment = request.getParameter("comment");
		 
		 Search search = new Search();
		 
		 search.setArea(area);
		 search.setYear(year);
		 search.setComment(comment);
		 
		 List<FestivalDataBean> list =  festivalDao.festivalSearch(search); 
		 ModelAndView modelAndView = new ModelAndView();
		 modelAndView.addObject("category_num",200);
		 modelAndView.addObject("list", list);
		 modelAndView.setViewName("/chattingboard/boardsearch");
		return modelAndView;
	}
		
	@RequestMapping( "/getboard" )
	public ModelAndView getboard(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int category_num = Integer.parseInt(request.getParameter("category_num"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		ModelAndView modelAndView = new ModelAndView();
		if(category_num == 100){

		}else if(category_num == 200){
			FestivalDataBean dto =  festivalDao.selectFestival(board_num);
			
			modelAndView.addObject("dto", dto);
			modelAndView.setViewName("/chattingboard/boardselect");
		}else if(category_num == 300){
			
		}
		return modelAndView;
	}
}








