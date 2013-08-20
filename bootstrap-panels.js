(function() {
  $(function() {
    $.panels = function(toggle) {
      if (toggle) {
        if ($('.panel').hasClass(toggle)) {
          return $('.panel').removeClass("left right");
        } else {
          return $('.panel').addClass(toggle);
        }
      } else {
        $('[data-toggle=slide]').click(function(event) {
          var dir, target;
          event.preventDefault();
          target = $($(this).attr('data-target'));
          dir = target.hasClass('panel-left') ? 'right' : 'left';
          if (target.hasClass(dir)) {
            $('.panel.panel-center').removeClass('left right');
            return target.removeClass(dir);
          } else {
            $('.panel.panel-center').addClass(dir);
            return target.addClass(dir);
          }
        });
        return $('.panel:not(.panel-center) [data-toggle^="tab"]').click(function() {
          $('.panel.in').removeClass('in');
          return $('.panel.panel-center').scrollTop(0);
        });
      }
    };
    return $.panels();
  });

}).call(this);
