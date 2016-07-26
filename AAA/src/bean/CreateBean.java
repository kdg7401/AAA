package bean;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import dao.chatting.ChattingDBBean;
import dao.chatting.ChattingDao;
import dao.festival.FestivalDBBean;
import dao.festival.FestivalDao;
import dao.meeting.MeetingDBBean;
import dao.meeting.MeetingDao;
import dao.member.MemberDBBean;
import dao.member.MemberDao;
import dao.profile.ProfileDBBean;
import dao.profile.ProfileDao;

@Configuration
public class CreateBean {
	
	// DAO
	
	@Bean
	public ChattingDao chattingDao() {
		return new ChattingDBBean();
	}
	
	@Bean
	public FestivalDao festivalDao() {
		return new FestivalDBBean();
	}
	
	@Bean
	public MemberDao memberDao() {
		return new MemberDBBean();
	}
	
	@Bean
	public ProfileDao profileDao(){
		return new ProfileDBBean();
	}
	@Bean
	public MeetingDao meetingDao(){
		return new MeetingDBBean();
	}
	
	
	// ViewResolver
	@Bean
	public ViewResolver viewResolver() throws ClassNotFoundException {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		Class <?> viewClass = Class.forName( "org.springframework.web.servlet.view.JstlView" );
		viewResolver.setViewClass( viewClass );		
		viewResolver.setSuffix( ".jsp" );
		return viewResolver;
	}	
	
}















