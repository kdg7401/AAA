package controller.meeting;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.meeting.MeetingDao;
import dao.profile.ProfileDao;
import databean.MeetingDataBean;
import databean.MeetingListDataBean;




@Controller
public class MeetingController {
	
	@Resource(name="meetingDao")
	private MeetingDao meetingDao;
	
	@Resource(name="profileDao")
	private ProfileDao profileDao;
	
	@RequestMapping("meetingContent")
	public ModelAndView meetingContent(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int meeting_num = Integer.parseInt(request.getParameter("meeting_num"));
		
		MeetingDataBean mdto = meetingDao.getContent(meeting_num);
		
		request.setAttribute("meeting_num", meeting_num);
		request.setAttribute("mdto", mdto);
		ModelAndView modelAndView = new ModelAndView();	
		modelAndView.addObject("center", "/board/meeting/meetingContent.jsp");
		modelAndView.setViewName("/index");
		return modelAndView;
	}
	
	

	@RequestMapping("meetingList")
	public ModelAndView meetingList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pageSize = 3;
		int pageBlock = 3;
		ModelAndView modelAndView = new ModelAndView();	
		int count = profileDao.getCount();
		String pageNum= null;
		int currentPage = 0;
		int start = 0;
		int end = 0;
		int number = 0;
		
		int pageCount = 0;
		int startPage = 0;
		int endPage=0;
		
		pageNum = request.getParameter("pageNum");
		if(pageNum==null)
		{
			pageNum="1";
		}
		currentPage = Integer.parseInt(pageNum);
		start = (currentPage - 1) * pageSize +1;
		end = start + pageSize -1;
		
		request.setAttribute("count", count);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		
		if(count!=0)
		{
			number = count - (currentPage -1)*pageSize;
			pageCount = count / pageSize +(count%pageSize > 0 ? 1 : 0);
			startPage = (currentPage/pageBlock) * pageBlock +1;
			if(currentPage % pageBlock ==0)
			{
				startPage -= pageBlock;
			}
			endPage = startPage + pageBlock -1;
			if(endPage>pageCount)
				endPage = pageCount;
			
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("start", start);
			map.put("end", end);
			List<MeetingListDataBean> list= profileDao.meetingList(map);
			
			
			request.setAttribute("number",number);
			request.setAttribute("startPage",startPage);
			request.setAttribute("endPage",endPage);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageBlock",pageBlock);
			request.setAttribute("list", list);
		}

		modelAndView.addObject("center", "/board/meeting/meetingList.jsp");
		modelAndView.setViewName("/index");
		return modelAndView;
	}
	
	@RequestMapping("meetingSelectDeletePro")
	public ModelAndView meetingSelectDeletePro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int meeting_num = Integer.parseInt(request.getParameter("meeting_num"));
		
		int result = meetingDao.selectMeetingDelete(meeting_num);
		
		request.setAttribute("result", result);
		return new ModelAndView("/board/meeting/meetingSelectDeletePro");
	}
	
	@RequestMapping("meetingSelectUpdateForm")
	public ModelAndView meetingSelectUpdateForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int meeting_num = Integer.parseInt(request.getParameter("meeting_num"));
		
		MeetingDataBean mdto= meetingDao.getContent(meeting_num);
		request.setAttribute("mdto",mdto);
		System.out.println(meeting_num);
		ModelAndView modelAndView = new ModelAndView();	
		modelAndView.addObject("center", "/board/meeting/meetingSelectUpdateForm.jsp");
		modelAndView.setViewName("/index");
		return modelAndView;
	}
	
	@RequestMapping("meetingSelectUpdatePro")
	public ModelAndView meetingSelectUpdatePro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MeetingDataBean mdto = new MeetingDataBean();
		mdto.setId(request.getParameter("id"));
		mdto.setMeeting_title(request.getParameter("meeting_title"));
		mdto.setMeeting_area(request.getParameter("meeting_area"));
		mdto.setMeeting_age(Integer.parseInt(request.getParameter("meeting_age")));
		mdto.setMeeting_people(Integer.parseInt(request.getParameter("meeting_people")));
		mdto.setMeeting_content(request.getParameter("meeting_content"));
		mdto.setMeeting_num(Integer.parseInt(request.getParameter("meeting_num")));
		
		int result = meetingDao.selectMeetingUpdate(mdto);
		
		System.out.println(result);
		
		
		request.setAttribute("result", result);
		return new ModelAndView("/board/meeting/meetingSelectUpdatePro");
	}
	

	@RequestMapping("meetingSelectWriteForm")
	public ModelAndView meetingSelectWriteForm(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int meeting_check = Integer.parseInt(request.getParameter("meeting_check"));
		request.setAttribute("meeting_check", meeting_check);
		ModelAndView modelAndView = new ModelAndView();	
		modelAndView.addObject("center", "/board/meeting/meetingSelectWriteForm.jsp");
		modelAndView.setViewName("/index");
		return modelAndView;
	}
	
	@RequestMapping("meetingSelectWritePro")
	public ModelAndView meetingSelectWritePro(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		request.setCharacterEncoding("UTF-8");
		MeetingDataBean mdto = new MeetingDataBean();
		mdto.setId(request.getParameter("id"));
		mdto.setMeeting_age(Integer.parseInt(request.getParameter("meeting_age")));
		mdto.setMeeting_title(request.getParameter("meeting_title"));
		mdto.setMeeting_area(request.getParameter("meeting_area"));
		mdto.setMeeting_people(Integer.parseInt(request.getParameter("meeting_people")));
		mdto.setMeeting_age(Integer.parseInt(request.getParameter("meeting_age")));
		mdto.setMeeting_check(Integer.parseInt(request.getParameter("meeting_check")));
		mdto.setMeeting_content(request.getParameter("meeting_content"));
		mdto.setReg_date(new Timestamp(System.currentTimeMillis()));
		
		int result = meetingDao.selectMeetingWrite(mdto);
		
		request.setAttribute("mdto",mdto);
		request.setAttribute("result", result);
		return new ModelAndView("/board/meeting/meetingSelectWritePro");
	}
  
	
   
}