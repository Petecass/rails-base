
$(document).on 'turbolinks:load', ->

  $('.message .close').on 'click', () ->
      $(this).closest('.message').transition('fade')