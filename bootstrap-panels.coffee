$ ->
  $.panels = (toggle) ->
    if toggle
      if $('.panel').hasClass toggle
        $('.panel').removeClass "left right"
      else
        $('.panel').addClass toggle
    else
      $('[data-toggle=slide]').click (event) ->
        event.preventDefault()
        target = $ $(@).attr 'data-target'
        dir = if target.hasClass('panel-left') then 'right' else 'left'
        if target.hasClass(dir)
          $('.panel.panel-center').removeClass 'left right'
          target.removeClass dir
        else
          $('.panel.panel-center').addClass dir
          target.addClass dir

      $('.panel:not(.panel-center) [data-toggle^="tab"]').click ->
        # slide it back
        $('.panel.in').removeClass 'in'
        # force the panel to the top
        $('.panel.panel-center').scrollTop 0

  $.panels()
