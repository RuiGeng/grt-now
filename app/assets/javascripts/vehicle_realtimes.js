$(document).ready(function() {
    setInterval(function() {
        window.location.href = "/vehicle_realtimes/pull";
    }, 5000);
});