// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

var ready;
ready = function() {
// Show full page Loading Overlay
$.LoadingOverlay("show");

// Hide it after 3 seconds
setTimeout(function(){
    $.LoadingOverlay("hide");
}, 3000);
};

var ready_2;
ready_2 = function() {
// Show full page Loading Overlay
$.LoadingOverlay("show");

// Hide it after 3 seconds
setTimeout(function(){
    $.LoadingOverlay("hide");
}, 3000);
};

$(document).ready(ready_2);
$(document).on('page:before-change', ready);

$(document).ajaxStart(function(){
    $.LoadingOverlay("show");
});
$(document).ajaxStop(function(){
    $.LoadingOverlay("hide");
});

$(document).ready(function() {
    setTimeout(function() {
        $('#success-notifi').fadeOut(1500);
        $('#error-notifi').fadeOut(1500);
    },8000);
});
