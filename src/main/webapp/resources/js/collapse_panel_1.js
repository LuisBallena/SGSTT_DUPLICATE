jQuery(function ($) {
        $('.panel-busqueda .panel-heading span.clickable').on("click", function (e) {
            if ($(this).hasClass('panel-collapsed')) {
                // expand the panel
                $(this).parents('.panel-busqueda').find('.panel-body').slideDown();
                $(this).removeClass('panel-collapsed');
            }
            else {
                // collapse the panel
                $(this).parents('.panel-busqueda').find('.panel-body').slideUp();
                $(this).addClass('panel-collapsed');
            }
        });
        $('.panel-busqueda-trans .panel-heading span.clickable').on("click", function (e) {
            if ($(this).hasClass('panel-collapsed')) {
                // expand the panel
                $(this).parents('.panel-busqueda-trans').find('.panel-body').slideDown();
                $(this).removeClass('panel-collapsed');
            }
            else {
                // collapse the panel
                $(this).parents('.panel-busqueda-trans').find('.panel-body').slideUp();
                $(this).addClass('panel-collapsed');
            }
        });
    });