# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
 $('#photo_category_tokens').tokenInput '/categories.json'
 theme: 'facebook',
 prePopulate: $('#photo_category_tokens').data('load')
