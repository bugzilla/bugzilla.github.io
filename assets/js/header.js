window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 16 || document.documentElement.scrollTop > 16) {
    document.getElementById("header-logo").width = "32";
    document.getElementById("header-logo").height = "48";
    document.getElementById("header-name").classList.remove('h2');
    document.getElementById("header-name").classList.add('h4');
  }
  else {
    document.getElementById("header-logo").width = "64";
    document.getElementById("header-logo").height = "96";
    document.getElementById("header-name").classList.remove('h4');
    document.getElementById("header-name").classList.add('h2');
  }
} 
