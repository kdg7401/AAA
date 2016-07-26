package controller.main;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.member.MemberDao;
import databean.MemberDataBean;



@Controller
public class MainController {
	@Resource( name="memberDao" )
	private MemberDao memberDao;
	
	
   @RequestMapping(value = "/main")
   public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
	   
	   ModelAndView modelAndView = new ModelAndView();
	   modelAndView.addObject("center", "inc/content.jsp");
	   modelAndView.setViewName("/index");
	return modelAndView;
   }
   
   @RequestMapping( "/loginform" )
	public ModelAndView loginform(HttpServletRequest request, HttpServletResponse response) throws Exception {
	   ModelAndView modelAndView = new ModelAndView();
	   modelAndView.addObject("center", "member/main.jsp");
	   modelAndView.setViewName("/index");
	   return modelAndView;
	}
   
   @RequestMapping( "/logonLoginPro" )
	public ModelAndView logon(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String id = request.getParameter( "id" );
		String passwd = request.getParameter( "passwd" );	
	
		int result = memberDao.check( id, passwd );
		
		request.setAttribute( "id", id );
		request.setAttribute( "result", result );
		
		return new ModelAndView( "/member/loginPro" );
	}
	
	@RequestMapping( "/logonLogout" )
	public ModelAndView logonLogout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.getSession().removeAttribute( "memId" );
				
		return new ModelAndView( "/member/main" );
	}
	
	@RequestMapping( "/provision" )
	public ModelAndView provision(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 ModelAndView modelAndView = new ModelAndView();
		 modelAndView.addObject("center", "member/provision.jsp");
		 modelAndView.setViewName("/index");		
		return modelAndView;
	}
	
	@RequestMapping( "/logonInputForm" )
	public ModelAndView logonInputForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		 modelAndView.addObject("center", "member/inputForm.jsp");
		 modelAndView.setViewName("/index");
		return modelAndView;
	}
	
	@RequestMapping( "/confirmId" )
	public ModelAndView confirmId(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String id = request.getParameter( "id" );
		int result = memberDao.check( id );
		
		request.setAttribute( "id", id );
		request.setAttribute( "result", result );
				
		System.out.println(id);
		System.out.println(result);
		return new ModelAndView( "/member/confirm" );
	}
	
	@RequestMapping( "/logonInputPro" )
	public ModelAndView logonInputPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding( "utf-8" );
	
		MemberDataBean dto = new MemberDataBean();
		dto.setId( request.getParameter( "id" ) );
		dto.setPasswd( request.getParameter( "passwd1" ) );
		dto.setName( request.getParameter( "name" ) );
		dto.setJumin1( Integer.parseInt( request.getParameter( "jumin1" )));
		dto.setJumin2( Integer.parseInt( request.getParameter( "jumin2" )));
		
		String zipcode =null;
//		String zipcode1=request.getParameter("zipcode1");
//		String zipcode2=request.getParameter("zipcode2");
//		if(!zipcode1.equals("") && !zipcode2.equals(""))
//		{
//			zipcode = zipcode1 + "-" + zipcode2;
//		}		
		dto.setZipcode(zipcode);
		
		String address = null;
//		String address1=request.getParameter("address1");
//		String address2=request.getParameter("address2");
//		if(!address1.equals(""))
//		{
//			address=address1+"-"+address2;
//		}	
		dto.setAddress(address);
		
		
		
		String tel = null;
		String tel1 = request.getParameter( "tel1" );
		String tel2 = request.getParameter( "tel2" );
		String tel3 = request.getParameter( "tel3" );
		if( ! tel1.equals( "" ) 
			&& ! tel2.equals( "" ) 
			&& ! tel3.equals( "" ) ) {
			tel = tel1 + "-" + tel2 + "-" + tel3;
		}	
		dto.setTel( tel );
	
		String email = null;
		String email1 = request.getParameter( "email1" );
		String email2 = request.getParameter( "email2" );
		if( ! email1.equals( "" ) && ! email2.equals( "" ) ) {
			if( email2.equals( "0" ) ) {
				// 직접입력
				email = email1;
			} else {
				// 선택입력
				email = email1 + "@" + email2;
			}
		}
		dto.setEmail( email );
		
		int result = memberDao.insertMember( dto );
		
		request.setAttribute( "result", result );
		
		return new ModelAndView( "/member/inputPro" );
	}
	
	@RequestMapping( "/sendMail" )
	public ModelAndView sendMail(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String email = request.getParameter("email");
		int result = memberDao.send(email);
	
		request.setAttribute( "email", email );
		request.setAttribute( "result", result );
	
		return new ModelAndView( "/member/sendMail");
	}
	
   
}