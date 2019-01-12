function users() {
    $('#alumnus_record_birth_date').datepicker({
        dateFormat: 'yy-mm-dd'
    });

    let current_form_window;
    let next_form_window;
    let previous_form_window;
    let animating;
    let left, opacity, scale;
    $('.next-button').click(function() {
        if (animating) return false;

        current_form_window = $(this).parent();
        next_form_window = $(this).parent().next();

        next_form_window.show();
        current_form_window.animate({opacity: 0}, {
            step: function(now, mx) {
                scale = 1 - (1 - now) * 0.2;
                left = (now * 50) + '%';
                opacity = 1 - now;
                current_form_window.css({
                    'position': 'absolute'
                });
                next_form_window.css({'left': left, 'opacity': opacity, 'display': 'visible'});
            },
            duration: 800,
            complete: function() {
                current_form_window.hide();
                animating = false;
            }
        });
    });

    $('.back-button').click(function() {
        if(animating) return  false;
        animating = true;

        current_form_window = $(this).closest('fieldset');
        previous_form_window = $(this).closest('fieldset').prev();

        previous_form_window.show();
        current_form_window.animate({opacity: 0}, {
            step: function(now, mx) {
                //as the opacity of current_fs reduces to 0 - stored in "now"
                //1. scale previous_fs from 80% to 100%
                scale = 0.8 + (1 - now) * 0.2;
                //2. take current_fs to the right(50%) - from 0%
                left = ((1-now) * 50)+"%";
                //3. increase opacity of previous_fs to 1 as it moves in
                opacity = 1 - now;
                current_form_window.css({'left': left});
                previous_form_window.css({'transform': 'scale('+scale+')', 'opacity': opacity});
            },
            duration: 800,
            complete: function() {
                current_form_window.hide();
                animating = false;
            }
        })       
    })
}