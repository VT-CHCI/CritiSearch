# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# Variable assignments
offWhite = '#F1F1F1'
deletedClass = 'deleted-result'
checkedClass = 'checked-result'

$ bind = () ->
  # When a result-div's content is moused-over, hide all other check or delete
  # images and show only the ones for this result
  $('.search .results .result-div .content').mouseover -> 
    parent = $(this).parent()
    hideContextImages(parent)
    parent.find('.delete-image').show()
  
    # Since we want the check image to appear at the bottom, find the height
    # and set the absolute position for the top dynamically
    # Only show image if it does not have the checkedClass
    if !parent.hasClass(checkedClass)
      checkImage = parent.find('.check-image')
      top = parent.height() - checkImage.height() - 3
      checkImage.css('top', top)
      checkImage.show()
 
  # Function that does the actual hiding of delete and check images
  hideContextImages = (e) ->
    e.parent().find('.delete-image').hide()
    e.parent().find('.check-image').hide()   

  # Logic for when the delete-image is clicked  
  $('.search .results .result-div .delete-image').click ->
    parent = $(this).parent()
    if parent.hasClass('checked-result')
      parent.removeClass('checked-result')
      parent.css({'background-color':'#90FD54'}).animate({'background-color':offWhite}, 1000);
      parent.find('.check-image').show()
    else 
      parent.hide('drop', 1000)
    parent.addClass(deletedClass)

  # Perform a highlight-fade animation when the check mark is clicked
  $('.search .results .result-div .check-image').click ->
    parent = $(this).parent()
    parent.css({'background-color':'#90FD54'}).animate({'background-color':'#DDFFDE'}, 1000)
    parent.addClass(checkedClass)
    $(this).hide()

  # TODO: Make an Ajax request for more results when the page is scrolled to the bottom
  $(window).scroll ->
    if $(window).scrollTop() >= $(document).height() - $(window).height() - 1
     uri = $('.next-page').text()
     $.ajax(url: '/search/ajax', data: "uri="+escape(uri), dataType: "html", success: loadMore)

  # Function that handles the ajax response to load more results
  loadMore = (data) ->
    $('.next-page').remove()
    $('.results').append(data)
    loadImg = $('.ajax-load-wrapper').detach()
    loadImg.appendTo('.results')
    bind()

  # TODO: Make an Ajax request for more results if there are fewer than 5 results currenly shown

  # Show loading image during AJAX start
  $('.ajax-load').ajaxStart ->
    $(this).show()

  # Hide loading image during AJAX stop
  $('.ajax-load').ajaxStop ->
    $(this).hide()
