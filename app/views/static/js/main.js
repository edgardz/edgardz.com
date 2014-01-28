$(document)
    .foundation({
      orbit: {
        animation: 'slide',
        timer_speed: 4000,
        pause_on_hover: true,
        resume_on_mouseout: false,
        animation_speed: 400,
        stack_on_small: false,
        navigation_arrows: true,
        slide_number: false,
        bullets: false,
        circular: true,
        timer: false,
        variable_height: false,
        swipe: true
      }
    })
    .foundation('reveal', {
      animation: 'fadeAndPop',
      animation_speed: 0,
      close_on_background_click: true,
      dismiss_modal_class: 'close-reveal-modal',
      bg_class: 'reveal-modal-bg',
      bg : $('.reveal-modal-bg'),
      css : {
        open : {
          'opacity': 0,
          'visibility': 'visible',
          'display' : 'block'
        },
        close : {
          'opacity': 1,
          'visibility': 'hidden',
          'display': 'none'
        }
      }
    });

$('.reveal-modal').on('opened', function(){
  $(this).trigger('resize');
});