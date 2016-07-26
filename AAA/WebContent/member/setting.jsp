<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 회원관리 -->
<c:set var="project" value="/AAA/member/"/>

<c:set var="page_main" value="메인 페이지"/>
<c:set var="page_input" value="회원 가입"/>
<c:set var="page_confirm" value="아이디 중복확인"/>
<c:set var="page_login" value="로그인"/>
<c:set var="page_board" value="게시판"/>
<c:set var="page_delete" value="회원 탈퇴"/>
<c:set var="page_modify" value="회원 정보 수정"/>
<c:set var="page_email" value="인증확인"/>
<c:set var="page_input_AAA" value="AAA 회원이 되시면 다양한 서비스를 이용할 수 있습니다."/>
<c:set var="page_step1" value="step1 약관동의"/>
<c:set var="page_step2" value="step2 회원정보 입력"/>
<c:set var="page_step3" value="step3 가입완료"/>
<c:set var="page_all_agree" value="모든 약관에 동의합니다."/>

<c:set var="page_clause1" value="AAA 이용약관"/>
<c:set var="page_clause2" value="개인정보취급방침"/>
<c:set var="page_agree" value="약관동의"/>
<c:set var="page_inputForm3" value="AAA<br>
		회원가입이 완료되었습니다<br><br>	
		-회원 가입 시 입력하신 E-mail 정보를 통해 AAA의 이벤트 정보 등 <br>
		다양한 소식을 받으실 수 있습니다. (메일 수신여부 동의 시)<br>
		WALKSHOP에서 제공하는 다양한 혜택과 쿠폰, 서비스를 이용하실 수 있습니다"/>

<c:set var="msg_main" value="비회원이시면 회원가입을 해주세요"/>
<c:set var="msg_login" value="님 안녕하세요"/>		
<c:set var="msg_input" value="회원정보를 입력해주세요"/>
<c:set var="msg_id_x" value="는 사용할 수 없습니다"/>
<c:set var="msg_id_o" value="는 사용할 수 있습니다"/>
<c:set var="msg_login_ok" value="가입 확인을 위해서 로그인해주세요"/>
<c:set var="msg_passwd" value="비밀번호를 다시 입력해주세요"/>
<c:set var="msg_modify" value="수정할 정보를 입력해주세요"/>	
<c:set var="msg_sendfail" value="전송에 실패하였습니다. 이메일을 다시확인하세요."/>
<c:set var="msg_sendok" value="인증번호를 입력하세요"/>
<c:set var="msg_mailcheck" value="메일인증을 완료하세요"/>

<c:set var="str_id" value="아이디"/>
<c:set var="str_passwd" value="비밀번호"/>
<c:set var="str_passwd2" value="비밀번호 확인"/>
<c:set var="str_name" value="이름"/>
<c:set var="str_jumin" value="주민등록번호"/>
<c:set var="str_address" value="주소"/>
<c:set var="str_tel" value="전화번호"/>
<c:set var="str_email" value="이메일"/>
<c:set var="str_reg_date" value="가입일자"/>
<c:set var="str_emailin" value="인증번호 입력"/>
<c:set var="str_mailing" value="광고성 정보 수신여부(선택)"/>

<c:set var="btn_login" value="로그인"/>
<c:set var="btn_cancel" value="취소"/>
<c:set var="btn_input" value="회원가입"/>
<c:set var="btn_modify" value="정보수정"/>
<c:set var="btn_delete" value="회원탈퇴"/>
<c:set var="btn_logout" value="로그아웃"/>
<c:set var="btn_join" value="가입"/>
<c:set var="btn_join_cancel" value="가입취소"/>
<c:set var="btn_confirm" value="중복확인"/>
<c:set var="btn_ok" value="확인"/>
<c:set var="btn_ok_cancel" value="확인취소"/>
<c:set var="btn_login_cancel" value="로그인취소"/>
<c:set var="btn_del" value="탈퇴"/>
<c:set var="btn_del_cancel" value="탈퇴취소"/>
<c:set var="btn_mod" value="수정"/>
<c:set var="btn_mod_cancel" value="수정취소"/>
<c:set var="btn_emailin" value="메일인증"/>










