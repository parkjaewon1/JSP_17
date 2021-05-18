<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table { height: 450px; border: 2px solid green; width: 90%; table-layout: fixed; overflow: hidden; }
	div { height: 400px; overflow: scroll; }
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	var websocket = new WebSocket("ws://172.30.1.44:8080/ch18/websocket");
	var disp;
	websocket.onopen = function() { // 처음 연결
		disp = document.getElementById("disp");
		disp.innerHTML += "연결 되었습니다<br>";
	}
	websocket.onclose = function() {
		disp.innerHTML += "종료 되었습니다<br>";
	}
	websocket.onerror = function() {
		disp.innerHTML += "어이쿠 에러네<br>";
	}
	websocket.onmessage = function(event) {
		disp.innerHTML += event.data+"<br>";
		// scrollbar를 움직여서 최신 글자가 보이게
		var objDiv = document.getElementById("disp"); 
		objDiv.scrollTop = objDiv.scrollHeight;
	}
	function webstart() {
		var message  = document.getElementById("content").value;
		var name = document.getElementById("name").value;
		websocket.send(name+" > "+message);
		document.getElementById("content").value = ""; 		
	}
	function init() {
		cont = document.getElementById("content");
		cont.addEventListener("keyup", function(event) {
			// 누른 키보드 값                 IE           나머지
			var keycode = event.keyCode?event.keyCode:event.which;
			if (keycode == 13) webstart();   // 아스키 코드 13번 enter
			event.stopPropagation();   // 이벤트 전달을 금지
		});
	}
/* onload 화면이 출력 되고 바로 실행 */
</script></head><body onload="init()">
	별명 : <input type="text" name="name" id="name">
<table border="1">
	<tr><th height="400" id="a"><div id="disp"></div></th></tr>
	<tr><td height="50"><input type="text" id="content"><br>
		<button onclick="webstart()">웹 채팅</button></td></tr>
</table>
</body>
</html>