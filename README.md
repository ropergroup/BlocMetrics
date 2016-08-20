# Blocmetrics

Blocmetrics is a website for basic website analytics.

The Blocmetrics service uses a javascript snippet to send information back to the analytic service.

Paste this Javascript snippet on your website for event tracking:

var blocmetrics = {};
 blocmetrics.report = function(eventName){
   var event = { name: eventName };
   var request = new XMLHttpRequest();
   request.open("POST", "http://localhost:3000/api/events", true);
   request.setRequestHeader('Content-Type','application/json');
   request.send(JSON.stringify(event));
 };


 <script type="text/javascript">
   $(document).on("ready page:load", function () {
      blocmetrics.report("page_view");
    })
 </script>
