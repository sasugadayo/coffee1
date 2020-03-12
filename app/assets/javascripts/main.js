$(document).ready(function() {
  //initialize swiper when document ready

  var mySwiper = new Swiper(".swiper-container", {
    autoHeight: true,
    loop: true,
    autoplay: {
      delay: 3000,
      disableOnInteraction: true,
      reverseDirection: false
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev"
    },
    pagination: {
      el: ".swiper-pagination",
      type: "bullets",
      clickable: true
    }
  });
});