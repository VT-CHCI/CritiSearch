$(document).ready(function() {
  $("#ask-audience-prompt").modal({
    backdrop: "static",
    show: false
  });

  $("#student-reflection").val("");

  $("#cancel-ask-audience").click(function(){
    $("#ask-audience-prompt").modal('hide');
  });

  $("#submit-reflection").click(function(){
    if (reflectionValidates()) {
      $.post("/reflection", 
        {
          query: $("#q").val(),
          person: $("#current_person_id").text(),
          reflection: $("#student-reflection").val()
        }, 
        function() {
          $("#ask-audience-li").addClass("active");
          replaceRatingControlsWithAggregates();
          $('.search .results .result-div .content').unbind('mouseenter');
          $('.search .results .result-div .content').mouseenter(function(){
            $(deletedClass+" p").addClass("greyed");
            $(this).find("p").removeClass("greyed");
          });
        }
      );
      $("#ask-audience-prompt").modal('hide');
    }
    else {
      $("#reflection-validation-errors").removeClass("hidden");
    }
  });

  function reflectionValidates() {
    return $("#student-reflection").val().length > 10;
  }
  function replaceRatingControlsWithAggregates () {
    $(".rtab-container img").remove();
    $(".rtab-container div").text("0");
    $(".check-image").addClass("green-bg");
    $(".delete-image").addClass("red-bg");

    // $(".result-div").addClass("active-result");
    $(".result-div").addClass("venn-result");
    $('.delete-image').show();
    $('.rtab-image').show();
    $('.check-image').show();

    $(".result-div").each(function(){
      var elem = $(this);
      // check if it's url is in the hash
      var url = elem.find(".result-title a").attr("href");
      if (gon.audience[url]) {
        if (gon.audience[url]["up"]) {
          var div = elem.find(".controls .check-image");
            div.text(gon.audience[url]["up"]);
        }

        if (gon.audience[url]["down"]) {
            var div = elem.find(".controls .check-image");
            div.text(gon.audience[url]["down"]);
        }
      }

    });
  }

  $("#ask-audience").click(toggleAsk);

  $("#ask-audience-prompt").on('show', function(e) {
    var modal = $(this);

    modal.css('margin-top', (modal.outerHeight() / 2) * -1)
      .css('margin-left', (modal.outerWidth() / 2) * -1);

    return this;
  });

  function toggleAsk () {
    if ($("#ask-audience-li").hasClass("active")) {
      // $("#ask-audience-li").removeClass("active");
    }
    else {
      $("#ask-audience-prompt").modal('show');
      // $("#ask-audience-li").addClass("active");
    }
  }
});

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