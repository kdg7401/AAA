<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<form method="post" action="meetingSelectWritePro.do"
name="meetingSelectWriteForm">
<input type="hidden"  name="meeting_check" value="${meeting_check}">
<table border="1">
	<tr>
		<th>아이디</th>
		<td style="width: 300">
			<input type="text" name="id" value="${sessionScope.memId}"  style="width: 200" readonly="readonly">
		</td>
	</tr>
	<tr>	
		<th>타이틀</th>
		<td>
			<input type="text" name="meeting_title" value="미팅 신청합니다." style="width: 200">
		</td>
	</tr>
	<tr>
		<th>미팅 지역</th>
		<td>
			<select name="meeting_area" style="width: 200">
				<option selected>전체</option>
				<option>서울</option>
				<option>인천</option>
				<option>대전</option>
				<option>대구</option>
				<option>광주</option>
				<option>부산</option>
				<option>울산</option>
				<option>세종특별자치시</option>
				<option>경기도</option>
				<option>강원도</option>
				<option>충청북도</option>
				<option>충청남도</option>
				<option>경상북도</option>
				<option>경상남도</option>
				<option>전라북도</option>
				<option>전라남도</option>
				<option>제주도</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>인원</th>
		<td>
			<select name="meeting_people" style="width: 200">
				<option value="1" selected> 1명</option>
				<option value="2" > 2명</option>
				<option value="3" > 3명</option>
				<option value="4" > 4명</option>
				<option value="5" > 5명</option>
				<option value="6" > 6명</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>연령</th>
		<td>
			<select name="meeting_age" style="width: 200">
				<option value="10" selected> 10대</option>
				<option value="20" > 20대</option>
				<option value="30" > 30대</option>
				<option value="40" > 40대</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="meeting_content" cols="26" rows="15">
미팅해요~♥
			</textarea>
		</td>
	</tr>
    <tr>
    	<th colspan="2">
    		<input type="submit" value="작성">
    		<input type="button" value="나가기" onclick="window.location='meetingList.do'">
    	</th>
    </tr>
</table>
</form>

