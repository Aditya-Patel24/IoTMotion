<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Motion</title>

<link rel="stylesheet" href="all_component/motionstyle.css" >

</head>
<body>
	
	 <div class="container">
        <h1>Smart Home Motion Monitor</h1>
        <div class="status-box">
            <img id="status-icon" src="all_component/img/waiting.gif" alt="Waiting...">
            <audio id="alert-sound" src="all_component/img/alert.mp3" preload="auto"></audio>
            <h2 id="status">Initializing...</h2>
            <h2 id="time">Initializing...</h2>

        </div>
        <p>This real-time monitor keeps you informed about any motion activity in your smart home.</p>
    </div>
   
	
		<script>
		if (!!window.EventSource) {
		    var source = new EventSource('http://localhost:8080/motiontemp/motionServlet');
		  
		    source.onmessage = function(event) {
		        console.log("Data received: ", event.data);
		        document.getElementById('status').innerText = event.data;
		        const statusIcon = document.getElementById('status-icon');
		        if (event.data.includes("Motion detected!")) {
		            statusIcon.src = "all_component/img/thief_running.gif"; // Image of a thief running
		        } else {
		            statusIcon.src = "all_component/img/waiting.gif"; // Image indicating waiting or no motion
		        }
		    };
		  
		    source.onerror = function(event) {
		        console.log("SSE error", event);
		        source.close();
		        document.getElementById('status').innerText = "Error in SSE stream. Trying to reconnect...";
		        setTimeout(() => {
		            source = new EventSource('http://localhost:8080/motiontemp/motionServlet');
		        }, 5000);
		    };
		} else {
		    document.getElementById('status').innerText = "Your browser does not support server-sent events.";
		}

		</script>	
</body>
</html>