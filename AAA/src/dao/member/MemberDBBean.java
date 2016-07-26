package dao.member;


import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import databean.MemberDataBean;
import mybatis.SqlMapClient;
public class MemberDBBean implements MemberDao{
	
	public int check( String id, String passwd ) {
		int result=0;
		int count= check(id);
		if( count!=0 ) {
			// 아이디가 있다
			String getpasswd=SqlMapClient.getSession().selectOne("Member.getMember",id);
			if(getpasswd.equals(passwd)){
				result=1;
			}else{
				result=-1;
			}
		} else {
			// 아이디가 없다
			result = 0;
		}
		return result;
	}
	
	public int check( String id ) {
		int result=0;
		int count=SqlMapClient.getSession().selectOne("Member.selectCount",id);
		if( count!=0 ) {
			// 아이디가 있다
			result = 1;
		} else {
			// 아이디가 없다
			result = 0;
		}
		return result;
	}
	
	public int insertMember( MemberDataBean dto ) {		
		return SqlMapClient.getSession().insert("Member.insertMember",dto);
	}
	
	public int send(String email) {
    	int result = (int) (Math.random()*1000000);
    	int errorcode = 10000000;
        Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");     // gmail은 무조건 true 고정
        p.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 주소
        p.put("mail.smtp.auth","true");                 // gmail은 무조건 true 고정
        p.put("mail.smtp.port", "587");                 // gmail 포트
           
        Authenticator auth = new MyAuthentication();
         
        //session 생성 및  MimeMessage생성
        Session session = Session.getDefaultInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
         
        try{
            //편지보낸시간
            msg.setSentDate(new Date());
             
            InternetAddress from = new InternetAddress() ;
             
             
            from = new InternetAddress("<kdg7403@gmail.com>");
             
            // 이메일 발신자
            msg.setFrom(from);
             
             
            // 이메일 수신자
            InternetAddress to = new InternetAddress(email);
            msg.setRecipient(Message.RecipientType.TO, to);
             
            // 이메일 제목
            msg.setSubject("KH정보교육원 인증메일 발송", "UTF-8");
             
            // 이메일 내용 
            msg.setText("인증번호 :"+String.valueOf(result), "UTF-8");
             
            // 이메일 헤더 
            msg.setHeader("content-Type", "text/html");
             
            //메일보내기
            javax.mail.Transport.send(msg);
             
        }catch (AddressException addr_e) {
        	result = errorcode;
            addr_e.printStackTrace();
        }catch (MessagingException msg_e) {
        	result = errorcode;
        	msg_e.printStackTrace();
        }catch (Exception e){
        	result = errorcode;
        	e.printStackTrace();
        }
        return result;
    }
	
} // class










