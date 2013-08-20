$ ->
  $.windows = (toggle) ->
    if toggle
      if $('.window').hasClass toggle
        $('.window').removeClass "left right"
      else
        $('.window').addClass toggle
    else
      $('[data-toggle=slide]').click (event) ->
        event.preventDefault()
        target = $ $(@).attr 'data-target'
        dir = if target.hasClass('window-left') then 'right' else 'left'
        if target.hasClass(dir)
          $('.window.window-center').removeClass 'left right'
          target.removeClass dir
        else
          $('.window.window-center').addClass dir
          target.addClass dir

      $('.window:not(.window-center) [data-toggle^="tab"]').click ->
        # slide it back
        $('.window.in').removeClass 'in'
        # force the window to the top
        $('.window.window-center').scrollTop 0

  $.windows()
