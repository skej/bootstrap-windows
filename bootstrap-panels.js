(function() {
  $(function() {
    $.windows = function(toggle) {
      if (toggle) {
        if ($('.window').hasClass(toggle)) {
          return $('.window').removeClass("window-go-left window-go-right");
        } else {
          return $('.window').addClass(toggle);
        }
      } else {
        $('[data-toggle=window][data-target]').click(function(event) {
          var dir, target;
          event.preventDefault();
          target = $($(this).attr('data-target'));
          dir = target.hasClass('window-left') ? 'window-go-right' : 'window-go-left';
          if (target.hasClass(dir)) {
            $('.window.window-center').removeClass('window-go-left window-go-right');
            return target.removeClass(dir);
          } else {
            $('.window.window-center').addClass(dir);
            return target.addClass(dir);
          }
        });
        return $('.window:not(.window-center) [data-toggle^="tab"]').click(function() {
          $('.window.window-go-left').removeClass('window-go-left');
          $('.window.window-go-right').removeClass('window-go-right');
          return $('.window.window-center').scrollTop(0);
        });
      }
    };
    return $.windows();
  });

}).call(this);
