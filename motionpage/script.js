if (!!window.EventSource) {
    var source = new EventSource('http://localhost:8080/motiontemp/motionServlet');
    var alertSound = document.getElementById('alert-sound'); // Get the audio element
    var motionCounter = 0; // Initialize a counter
    source.onmessage = function(event) {
        var time = new Date().toLocaleTimeString(); // Get the current time
        console.log("Data received: ", event.data);
        console.log("Time of receipt: ", time);
        document.getElementById('status').innerText = event.data;
        document.getElementById('time').innerText = "Time of receipt: " + time;
        const statusIcon = document.getElementById('status-icon');
       if (event.data.includes("Motion detected!")) {
    console.log("Motion detected, playing sound...");
    // rest of your code
            statusIcon.src = "thief_running.gif"; // Change icon
            alertSound.play(); // Play the alert sound
            localStorage.setItem('motionDetectedTime' + motionCounter, time); // Store time in local storage with a unique key
            motionCounter++; // Increment the counter
        } else {
            statusIcon.src = "waiting.gif"; // Change icon to waiting
            alertSound.pause(); // Optional: Pause sound
            alertSound.currentTime = 0; // Reset sound to start
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