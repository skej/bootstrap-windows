$ ->
  $.panels = (toggle) ->
    if toggle
      if $('.panel').hasClass toggle
        $('.panel').removeClass toggle
      else
        $('.panel').addClass toggle
    else
      $('[data-toggle=slide]').click ->
        target = $ $(@).attr 'data-target'
        dir = if target.hasClass('panel-left') then 'right' else 'left'
        if target.hasClass(dir)
          $('.panel.panel-center').removeClass dir
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
