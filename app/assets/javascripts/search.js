$(document).ready(function() {
  var deletedClass = 'deleted-result';
	var checkedClass = 'checked-result';
	var locked = false;

  var rearrangements = 0;

  function enableResultEvents () {
    $('.search .results .result-div .content').mouseenter(searchResultMouseEnter);
    clickifyResultsAndAnnotations();
  }
	// When a result-div's content is moused-over, hide all other check or delete
 	// images and show only the ones for this result
	

	function searchResultMouseEnter () {
		var parent = $(this).parent();
    hideContextImages(parent);
    parent.find('.delete-image').show();
    parent.find('.rtab-image').show();
  
    // Since we want the check image to appear at the bottom, find the height
    // and set the absolute position for the top dynamically
    // Only show image if it does not have the checkedClass
    var checkImage = parent.find('.check-image');
    var top = parent.height() - checkImage.height() - 3;
    checkImage.css('top', top);
    checkImage.show();
	}

	// Function that does the actual hiding of delete and check images
	function hideContextImages(e) {
    e.parent().find('.delete-image').hide();
    e.parent().find('.check-image').hide();
    e.parent().find('.rtab-image').hide(); 
	}

	//when a search result is clicked: 
	

  function clickifyResultsAndAnnotations () {
    $(".result-title a").click(function() {
      console.log("clicked: " + $(this).text());
    });
    
    $('.search .results .result-div .delete-image').unbind('click');
    $('.search .results .result-div .check-image').unbind('click');

    $('.search .results .result-div .delete-image').click(function() {
      if ($(this).parent().hasClass(deletedClass)) {
        if (--rearrangements == 0) {
          $("#rearrange").addClass("hidden");
        }
      }
      else {
        if (rearrangements++ == 0) {
          $("#rearrange").removeClass("hidden"); 
        }
      }
      $(this).parent().toggleClass(deletedClass);
    });

    $('.search .results .result-div .check-image').click(function() {
      if ($(this).parent().hasClass(checkedClass)) {
        if (--rearrangements == 0) {
          $("#rearrange").addClass("hidden");
        }
      }
      else {
        if (rearrangements++ == 0) {
          $("#rearrange").removeClass("hidden"); 
        }
      }
      $(this).parent().toggleClass(checkedClass);
    });
    
  }

  $(window).scroll(function() {
    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
     	if (!locked) {
     		$.ajax({url: '/search/ajax', data: "uri="+escape($('.next-page').text()), dataType: "html", success: loadMore});
     	}
   	}
   });

  // Function that handles the ajax response to load more results
  function loadMore (data) {
    $('.next-page').remove();
    $('.results').append(data);
    var addtlResults = $('.ajax-load-wrapper').detach();
    addtlResults.appendTo('.results');
    // addtlResults.mouseenter(searchResultMouseEnter);
    enableResultEvents();
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

  enableResultEvents();

});