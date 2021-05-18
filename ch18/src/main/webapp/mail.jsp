<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("common.css");</style>
</head><body>
<form action="mailto.do">
<table><caption>메일 작성</caption>
	<tr><th>받는 사람</th><td><input type="email" name="to" required="required"
		autofocus="autofocus"></td></tr>
	<tr><th>제목</th><td><input type="text" name="subject" 
		required="required"></td></tr>
	<tr><th>내용</th><td><textarea rows="5" cols="40" name="msg" 
		required="required"></textarea></td></tr>
	<tr><th colspan="2"><input type="submit" value="전송"></th></tr>
</table>
</form>
</body>
</html>