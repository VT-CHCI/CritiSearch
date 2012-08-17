$(document).ready(function() {

	$("#rearrange").click(function(){
		//supposedly we want the checked items, then the unmodified items, then the items with check and x
		//then the items with x (after rearrangement)

		console.log("rearranging");

		//constant to be added for checked
		var checkedAddend = -200;

		// constant to be added for unchecked
		var deletededAddend = 400;

		$(".result-div.checked-result").each(function(){
			$(this).attr("order", parseInt($(this).attr("order")) + checkedAddend);
		});

		$(".result-div.deleted-result").each(function(){
			$(this).attr("order", parseInt($(this).attr("order")) + deletededAddend);
		});	

		var results = $(".result-div").sort(function(a,b) {
			return $(a).attr("order") - $(b).attr("order");
		});

		$(".result-div").detach();

		$(".ajax-load-wrapper").before(results);

		//turn off load more on scroll
		$(window).unbind("scroll");
	});
});