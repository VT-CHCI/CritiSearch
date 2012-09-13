function sendLog (logInfoPairs) {
  var logs = [];
  for (i=0; i<logInfoPairs.length; i++) {
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
  $.post("http://test.astronomicalproportions.org/interaction_logs/service", 
    {"logs":logs, "application": "CritiSearch"}, 
    function(data, textStatus, jqXHR){
      console.log("in my callback");
      console.log(data);
      console.log(textStatus);
      console.log(jqXHR);
    }
  );
}