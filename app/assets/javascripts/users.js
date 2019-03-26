function users() {
    $('#user_alumnus_record_attributes_birth_date').datepicker({
        yearRange: '1950:2019',
        changeMonth: true,
        changeYear: true,
        dateFormat: 'MM dd, yy'
    });

    $('#user_alumnus_record_attributes_employment_record_attributes_date_started').datepicker({
        yearRange: '1950:2019',
        changeMonth: true,
        changeYear: true,
        dateFormat: 'MM dd, yy',
        maxDate: '-1d'
    })

    let current_form_window;
    let next_form_window;
    let previous_form_window;
    let animating;
    let left, opacity, scale;
    $('.next-button').click(function() {
        if (animating) return false;
        animating = true;

        current_form_window = $(this).closest('fieldset');
        next_form_window = setNextAndPreviousFormWindow('next', current_form_window);
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
        previous_form_window = setNextAndPreviousFormWindow('back', current_form_window);

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

function setNextAndPreviousFormWindow(movement, current_form_window) {

    if (movement === 'next') {
        if (current_form_window.hasClass('third-window')) {
            if ($('#user_alumnus_record_attributes_employment_status_employed').prop('checked')) {
                next_form_window = $('fieldset.employment-information-window');
            } else {
                next_form_window = $('fieldset.unemployment-reason-window');
            }
        } else {
            next_form_window = $(current_form_window).closest('fieldset').next();
        }
        return next_form_window;
    } else if(movement === 'back') {
        if (current_form_window.hasClass('unemployment-reason-window') || current_form_window.hasClass('employment-information-window')) {
            previous_form_window = $('fieldset.third-window');
        } else {
            previous_form_window = $(current_form_window).closest('fieldset').prev();
        }
        return previous_form_window;
    }
}