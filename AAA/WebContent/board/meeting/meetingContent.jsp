<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <table border="1">
    	<tr>
    		<th>미팅 타이틀</th>
    		<td>
    	
    		<input type="text" name="meeting_title" value="${mdto.meeting_title }" readonly>
    		</td>
    	</tr>
    	<tr>
    		<th>지역</th>
    		<td>${mdto.meeting_area }</td>
    	</tr>
    	<tr>
    		<th>연령</th>
    		<td>${mdto.meeting_age }</td>
    	</tr>
    	<tr>
    		<th>인원</th>
    		<td>${mdto.meeting_people }</td>
    	</tr>
    	<tr>
    		<th>글 내용</th>
    		<td>
    		<textarea cols="36" rows="15" readonly >
${mdto.meeting_content }
    		</textarea>
    		</td>
    	</tr>
	<tr>
		<th colspan="2">
			<input type="button" value="글수정" onclick="window.location='meetingSelectUpdateForm.do?meeting_num=${mdto.meeting_num}'">
			<input type="button" value="글삭제" onclick="window.location='meetingSelectDeletePro.do?meeting_num=${mdto.meeting_num}' ">
			<input type="button" value="나가기" onclick="window.location='meetingList.do'">
		</th>
	</tr>
    </table>