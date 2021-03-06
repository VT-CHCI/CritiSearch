$(document).ready(function() {
  var deletedClass = 'deleted-result';
	var checkedClass = 'checked-result';
	var locked = false;

  var logTypes = {"action":3}

  $("#venn-link").attr("href", "/venn/"+$("#q").val());

  

  function enableResultEvents () {
    $('.search .results .result-div .content').mouseenter(searchResultMouseEnter);
    clickifyResultsAndAnnotations();
    $(".result-div").each(function(){
      $(this).attr("original-order", $(this).attr("order"));
    });
  }
	// When a result-div's content is moused-over, hide all other check or delete
 	// images and show only the ones for this result
	

	function searchResultMouseEnter () {
    $(".active-result").find("p."+deletedClass).addClass("greyed");
    $(".active-result").removeClass("active-result");
		var parent = $(this).parent();
    hideContextImages(parent);
    parent.addClass("active-result");
    parent.find('.delete-image').show();
    parent.find('.rtab-image').show();
  
    // Since we want the check image to appear at the bottom, find the height
    // and set the absolute position for the top dynamically
    // Only show image if it does not have the checkedClass
    var checkImage = parent.find('.check-image');
    // var top = parent.height() - checkImage.height() - 3;
    // checkImage.css('top', top);
    checkImage.show();
    $(".active-result").find("p."+deletedClass).removeClass("greyed");
	}

	// Function that does the actual hiding of delete and check images
	function hideContextImages(e) {
    e.parent().find('.delete-image').hide();
    e.parent().find('.check-image').hide();
    e.parent().find('.rtab-image').hide(); 
	}

	//when a search result is clicked: 
	
  function getURLForAnnotationControl(element) {
    return element.parents(".result-div").find(".content .result-title a").attr("href");
  }

  function getContentForAnnotationControl(element) {
    return element.parents(".result-div").find(".content").html();
  }

  function clickifyResultsAndAnnotations () {  
    addFollow();

    applyRatings();
    
    $('.search .results .result-div .delete-image').unbind('click');
    $('.search .results .result-div .check-image').unbind('click');

    $('.search .results .result-div .delete-image').click(function() {
      if ($(this).parents(".result-div").find("p").hasClass(deletedClass)) {
        sendLog([[logTypes["action"], "toggle delete: off for: " + getURLForAnnotationControl($(this))]]);
        $.post("/ajaxratings", 
          {
            url: getURLForAnnotationControl($(this)),
            query: $("#q").val(),
            person: $("#current_person_id").text(),
            deletion: 'true'
          }, 
          function() {
            console.log("callback");
          }
        );
        // if (--rearrangements == 0) {
        //   $("#rearrange").addClass("disabled");
        // }
      }
      else {
        sendLog([[logTypes["action"], "toggle delete: on for: " + getURLForAnnotationControl($(this))]]);
        $.post("/ajaxratings", 
          {
            url: getURLForAnnotationControl($(this)),
            query: $("#q").val(),
            person: $("#current_person_id").text(),
            ratingValue: 'down',
            resultContent: getContentForAnnotationControl($(this))
          }, 
          function() {
            console.log("callback");
          }
        );
        // if (rearrangements++ == 0) {
        //   $("#rearrange").removeClass("disabled"); 
        // }
        if ($(this).parents(".result-div").find("p").hasClass(checkedClass)) {
          sendLog([[logTypes["action"], "toggle checked: off (via delete on) for: " + getURLForAnnotationControl($(this))]]);
          // if (--rearrangements == 0) {
          //   $("#rearrange").addClass("disabled");
          // }
          var resultDiv = $(this).parents(".result-div");
          resultDiv.find("p").removeClass(checkedClass);
          resultDiv.removeClass(checkedClass);
        }
      }
      $(this).parents(".result-div").find("p").toggleClass(deletedClass);
      $(this).parents(".result-div").toggleClass(deletedClass);

      
    });

    $('.search .results .result-div .check-image').click(function() {
      if ($(this).parents(".result-div").find("p").hasClass(checkedClass)) {
        sendLog([[logTypes["action"], "toggle check: off for: " + getURLForAnnotationControl($(this))]]);
        $.post("/ajaxratings", 
          {
            url: getURLForAnnotationControl($(this)),
            query: $("#q").val(),
            person: $("#current_person_id").text(),
            deletion: 'true'
          }, 
          function() {
            console.log("callback");
          }
        );
        // if (--rearrangements == 0) {
        //   $("#rearrange").addClass("disabled");
        // }
      }
      else {
        sendLog([[logTypes["action"], "toggle check: on for: " + getURLForAnnotationControl($(this))]]);
        console.log("about to post to ajaxratings");

        $.post("/ajaxratings", 
          {
            url: getURLForAnnotationControl($(this)),
            query: $("#q").val(),
            person: $("#current_person_id").text(),
            ratingValue: 'up',
            resultContent: getContentForAnnotationControl($(this))
          }, 
          function() {
            console.log("callback");
          }
        );
        // if (rearrangements++ == 0) {
        //   $("#rearrange").removeClass("disabled"); 
        // }
        if ($(this).parents(".result-div").find("p").hasClass(deletedClass)) {
          sendLog([[logTypes["action"], "toggle deleted: off (via check on) for: " + getURLForAnnotationControl($(this))]]);
          // if (--rearrangements == 0) {
          //   $("#rearrange").addClass("disabled");
          // }
          var resultDiv = $(this).parents(".result-div");
          resultDiv.find("p").removeClass(deletedClass+" greyed");
          resultDiv.removeClass(deletedClass);
        }
      }
      $(this).parents(".result-div").find("p").toggleClass(checkedClass);
      $(this).parents(".result-div").toggleClass(checkedClass);
    });
    
  }

  function enableScroll() {
    $(window).scroll(function() {
      if ($(window).scrollTop() == $(document).height() - $(window).height()) {
       	if (!locked) {
       		$.ajax({url: '/search/ajax', data: "uri="+escape($('.next-page').text()), dataType: "html", success: loadMoreResults});
       	}
     	}
     });
  }

  enableScroll();

  function addFollow() {
    $(".result-title a").click(function(){
      // console.log($(this).attr("href"));
      $.post("/addfollow", 
        {
          url: $(this).attr("href"),
          query: $("#q").val(),
          person: $("#current_person_id").text()
        }, 
        function() {
          console.log("callback");
        }
      );
    });
  }

  function applyRatings() {
    console.log("applyRatings");
    // console.log(gon.ratings);
    if (typeof gon != 'undefined') {
      console.log("in gon if");
      $.each(gon.ratings, function(url, rating){
        var resultDiv = $('a[href="'+url+'"]').parents(".result-div");
        var result = resultDiv.find("p");
        if (rating == "up") {
          result.addClass(checkedClass);
          resultDiv.addClass(checkedClass);
        }
        else {
          result.addClass(deletedClass+" greyed");
          resultDiv.addClass(deletedClass);
        }
        // rearrangements++;
        // $("#rearrange").removeClass("disabled");
      });
    }
  }

  // Function that handles the ajax response to load more results
  function loadMoreResults (data) {
    $('.next-page').remove();
    $('.results').append(data);
    var addtlResults = $('.ajax-load-wrapper').detach();
    addtlResults.appendTo('.results');
    // addtlResults.mouseenter(searchResultMouseEnter);
    enableResultEvents();
    addFollow();
  }

  // TODO: Make an Ajax request for more results if there are fewer than 5 results currenly shown
  // Show loading image during AJAX start
  $('.ajax-load').ajaxStart(function() {
    locked = true;
    $(this).show();
  });

  // Hide loading image during AJAX stop
  $('.ajax-load').ajaxStop(function() {
    locked = false;
    $(this).hide();
  });

  function critisort () {
    
  }

  function originalSort(){
    
  }

  $("#rearrange").click(function(){
    if (! $(this).hasClass("disabled")) {
  // $("input#critisort_switch").click(function(){
    //supposedly we want the checked items, then the unmodified items, then the items with check and x
    //then the items with x (after rearrangement)

    // console.log("rearranging");

    // if ($(this).text() == "CritiSORT!") {
      console.log("critisort");
      sendLog([[logTypes["action"], "clicked critisort: for: " + $("#q").val()]]);
      $(this).text("CritiSort Again!");
      //constant to be added for checked
      var checkedAddend = -200;

      // constant to be added for unchecked
      var deletededAddend = 400;

      $(".result-div."+checkedClass).each(function(){
        $(this).attr("order", parseInt($(this).attr("order")) + checkedAddend);
      });

      $(".result-div."+deletedClass).each(function(){
        $(this).attr("order", parseInt($(this).attr("order")) + deletededAddend);
      }); 

      var results = $(".result-div").sort(function(a,b) {
        return $(a).attr("order") - $(b).attr("order");
      });

      $(".result-div").detach();

      $(".ajax-load-wrapper").before(results);

      //turn off load more on scroll
      $(window).unbind("scroll");
      // $("#originalSort").removeClass("disabled");
      // $("#rearrange").addClass("disabled");
    // }
    // else {
    //   originalSort($(this));
    // }
    }
  });

  $("#originalSort").click(function(){
    if (! $(this).hasClass("disabled")) {
    console.log("original sort");
    sendLog([[logTypes["action"], "clicked undo critisort: for: " + $("#q").val()]]);
      // $(this).text("CritiSORT!"); 
      $("#rearrange").text("CritiSORT!");
      // $("#originalSort").addClass("disabled");
      // $("#rearrange").removeClass("disabled");
      var results = $(".result-div").sort(function(a,b) {
        return $(a).attr("original-order") - $(b).attr("original-order");
      });

      $(".result-div").detach();

      $(".ajax-load-wrapper").before(results);

      enableScroll();
    }
  });

  // $("input#critisort_switch").bind("critisort", critisort);
  // $("input#critisort_switch").bind("originalSort", originalSort);

  enableResultEvents();

});