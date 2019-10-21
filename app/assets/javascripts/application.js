// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

// $(function(){
//  var mainSlider = "#slider"; //メインスライダーid
//  var thumbnailSlider = "#thumbnail_slider"; //サムネイルスライダーid

//   $(mainSlider).slick({
//     autoplay: true,
//     speed: 1000,
//     arrows: false,
//     asNavFor: thumbnailSlider
//   });
//   $(thumbnailSlider).slick({
//     slidesToShow: 3,
//     speed: 1000,
//     asNavFor: mainSlider
//   });
//   //#thumbnail_sliderでクリックしたスライドをカレントにする
//   $(thumbnailSlider+" .slick-slide").on('click',function(){
//     var index = $(this).attr("data-slick-index");
//     $(thumbnailSlider).slick("slickGoTo",index,false);
//   });
// });

$(function(){
  var mainSlider = "#slider";
  var thumbnailSlider = "#thumbnail_slider";

  $(mainSlider).slick({
    autoplay: true,
    speed: 1000,
    arrows: false,
    asNavFor: thumbnailSlider
  });
  $(thumbnailSlider).slick({
    slidesToShow: 3,
    speed: 1000,
    asNavFor: mainSlider
  });
  $(thumbnailSlider+" .slick-slide").on('click', function(){
    var index = $(this).attr("data-slick-index");
    $(thumbnailSlider).slick("slickGoTo", index,false);
  });
});



$(document).ready(function() {
  $('.drawer').drawer();
});