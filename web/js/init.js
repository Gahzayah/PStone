/**
 *  Initialize JQuery Gridrotator
 * @returns {undefined}
 */

$(function() {

    $('#ri-grid').gridrotator({
        rows: 3,
        columns: 12,
        animType: 'fadeInOut', // "random" möglich
        animSpeed: 1500, // Animation-speed 1,5s
        interval: 3500, // Intervall for automatic change 3,5s
        step: 1, // Change Images at same Time
        preventClick: true, // User-Clicks on Image
        onhover: true
    });

});

