(function() {
  $(function() {
    $.windows = function(toggle) {
      if (toggle) {
        if ($('.window').hasClass(toggle)) {
          return $('.window').removeClass("left right");
        } else {
          return $('.window').addClass(toggle);
        }
      } else {
        $('[data-toggle=slide]').click(function(event) {
          var dir, target;
          event.preventDefault();
          target = $($(this).attr('data-target'));
          dir = target.hasClass('window-left') ? 'right' : 'left';
          if (target.hasClass(dir)) {
            $('.window.window-center').removeClass('left right');
            return target.removeClass(dir);
          } else {
            $('.window.window-center').addClass(dir);
            return target.addClass(dir);
          }
        });
        return $('.window:not(.window-center) [data-toggle^="tab"]').click(function() {
          $('.window.in').removeClass('in');
          return $('.window.window-center').scrollTop(0);
        });
      }
    };
    return $.windows();
  });

}).call(this);
