window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 16 || document.documentElement.scrollTop > 100) {
    document.getElementById("header-brand").classList.remove("big");
  }
  else {
    document.getElementById("header-brand").classList.add("big");
  }
}
