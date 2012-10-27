function sendLog (logInfoPairs) {
  console.log("about to log to astro props");
  var logs = [];
  for (i=0; i<logInfoPairs.length; i++) {
    console.log("infopairs");
    var log = {
      "logType_id": logInfoPairs[i][0], 
      "details":    logInfoPairs[i][1]
    };
    if ($("#current_person_id").length == 1) {
      var p_id = $("#current_person_id");
      if (p_id && p_id.text()) {
        log["person_id"] = p_id.text();
      }
    }
    else if ($("#last_person_id").length == 1) {
      log["unknown_user_details"] = $("#last_person_id").text();
    }
    logs.push(log);
  }

  console.log("ajaxing");
  $.ajax("http://localhost:3000/interaction_logs/service", 
    {
      data: {"logs":logs, "application": "CritiSearch"}, 
      type: "POST",
      dataType: "jsonp",
      success: function(data, textStatus, jqXHR){
        console.log("in my callback");
        console.log(data);
        console.log(textStatus);
        console.log(jqXHR);
      },
      error: function(data, textStatus, jqXHR){
        console.log("in my ERROR callback");
        console.log(data);
        console.log(textStatus);
        console.log(jqXHR);
      }
    }
  );
}