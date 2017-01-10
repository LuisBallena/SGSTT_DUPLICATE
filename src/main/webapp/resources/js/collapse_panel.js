jQuery(function ($) {
    $('.panel-busqueda .panel-heading span.clickable').on("click", function (e) {
        if ($(this).hasClass('panel-collapsed')) {
            // expand the panel
            $(this).parents('.panel-busqueda').find('.panel-body').slideDown();
            $(this).removeClass('panel-collapsed');
            $(this).find('i').removeClass("fa-plus").addClass("fa-minus");
        }
        else {
            // collapse the panel
            $(this).parents('.panel-busqueda').find('.panel-body').slideUp();
            $(this).addClass('panel-collapsed');
            $(this).find('i').removeClass("fa-minus").addClass("fa-plus");
        }
    });
});