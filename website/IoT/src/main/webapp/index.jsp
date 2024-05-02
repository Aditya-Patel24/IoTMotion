
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Motion Catcher</title>
<%@include file="all_component/all_css.jsp"%>
<style type="text/css" >
      .hidden {
        display: none;
      }
    
    </style>
</head>
<body>
	<%@include file="all_component/navbar1.jsp"%>

	<!-- home content -->
	<section class="home">
		<div class="content">
			<h1>
				<span>Welcome to </span><br> <span id="span2">our </span>Site
			</h1>
			<p>
				A Motion Detection System is a technology that notifies you when
				there's movement in a particular area. <br>It's commonly used
				for security to quickly alert you if someone tries to enter a
				restricted area.
			</p>
			<!-- Hidden paragraph that will be shown when the button is clicked -->
			<p id="moreText" class="hidden">
				Motion detection can be integrated with various systems such as
				cameras, lights, or alarms to enhance security measures. <br>Advanced
				systems can even differentiate between types of movement, reducing
				false alarms and increasing overall effectiveness.
			</p>
			<!-- Button to show/hide the additional text -->
			<div class="btn">
				<button onclick="toggleText()">Read more...</button>
			</div>
		</div>
		<div class="img">
			<img src="all_component/img/29273.jpg"
				style="width: 30vw; height: 50vh; margin-left: 150px; border-radius: 10px;">
		</div>
	</section>
	<!-- home content -->








	<!-- Component cards -->
	<div class="container" id="Component-cards">
		<h1 class="text-center">Components</h1>
		<div class="row" style="margin-top: 30px;">
			<div class="col-md-3 py-3 py-md-0">
				<div class="card">
					<img src="all_component/img/PIR1.jpeg" alt="">
					<div class="card-body">
						<h3 class="text-center">PIR Sensor</h3>
						<p class="text-center">A PIR (Passive Infrared) sensor detects
							changes in infrared radiation emitted by moving objects, commonly
							used for motion detection in security and automation systems.</p>

					</div>
				</div>
			</div>
			<div class="col-md-3 py-3 py-md-0">
				<div class="card">
					<img src="all_component/img/NodeMCU.jpg" alt="">
					<div class="card-body">
						<h3 class="text-center">NodeMCU</h3>
						<p class="text-center">NodeMCU is an open-source Lua based
							firmware and development board specially targeted for IoT based
							Applications.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 py-3 py-md-0">
				<div class="card">
					<img src="all_component/img/Buzzer.jpeg" alt="">
					<div class="card-body">
						<h3 class="text-center">Buzzer</h3>
						<p class="text-center">A buzzer is an electronic sound-making
							device, producing a buzzing or beeping sound when activated</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 py-3 py-md-0">
				<div class="card">
					<img src="all_component/img/LED.png" alt="">
					<div class="card-body">
						<h3 class="text-center">LED</h3>
						<p class="text-center">LED lights are semiconductor devices
							that emit light when an electric current passes through them,
							used for illumination and indicators.</p>

					</div>
				</div>
			</div>


			<div class="row" style="margin-top: 30px;">
				<div class="col-md-3 py-3 py-md-0">
					<div class="card">
						<img src="all_component/img/Jumperwire.jpeg" alt="">
						<div class="card-body">
							<h3 class="text-center">Jumper Wire</h3>
							<p class="text-center">Jumper wires are flexible cables with
								connectors used to establish connections between electronic
								components on a breadboard or circuit.</p>

						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- Component cards -->

		<%@include file="all_component/footer.jsp"%>
		<a href="#" class="arrow"><i><img
			src="all_component/img/arrow.png" alt=""></i></a>
		
		    <script>
      function toggleText() {
        var text = document.getElementById("moreText");
        if (text.classList.contains("hidden")) {
          text.classList.remove("hidden");
        } else {
          text.classList.add("hidden");
        }
      }
    </script>		
</body>
</html>