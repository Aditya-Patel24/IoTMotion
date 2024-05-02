<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MDS Site</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar2.jsp"%>
	<div class="container" id="about">
		<h3>Objectives</h3>
		<hr>
		<ul>
			<li>Motion Detection:
				<p>The primary objective is to detect motion within a specified
					area using the passive infrared (PIR) sensor. This involves
					accurately sensing changes in infrared radiation emitted by moving
					objects.</p>
			<li>Alert System:
				<p>Implement an effective alert system using both audible and
					visual cues. When motion is detected, the buzzer generates an
					audible alert, while the LED lights up to provide a visual
					indication of the detected motion.</p>
			</li>
		</ul>
		<hr>

		<br> <br>
		<h3>Uniqueness</h3>
		<hr>
		<ul>
			<li>Integrated Solution:
				<p>The combination of NodeMCU, PIR sensor, buzzer, and LED
					offers a compact and integrated solution for motion detection and
					alerting. This integrated setup provides a streamlined approach
					compared to traditional standalone systems.</p>
			<li>Customizable Alerts:
				<p>Users have the flexibility to customize the alert system
					according to their preferences. They can adjust the sound and
					visual indicators to suit their specific requirements, enhancing
					the system's usability.</p>

				<p>Explore the integration of advanced alerting mechanisms such
					as SMS notifications or email alerts. This would extend the
					system's functionality and provide users with multiple channels for
					receiving alerts.</p>
			</li>

			<li>Low-Cost Implementation:
				<p>Leveraging readily available components such as NodeMCU, PIR
					sensor, buzzer, and LED, this system offers a cost-effective
					solution for motion detection and alerting. It provides a balance
					between affordability and functionality.</p>
			</li>

		</ul>
		<hr>

	</div>

	<%@include file="all_component/footer.jsp"%>
	<a href="#" class="arrow"><i><img
			src="all_component/img/arrow.png" alt=""></i></a>
			
</body>
</html>