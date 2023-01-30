$(window).scroll(function () {
  if ($(this).scrollTop() > 100) {
    $("#topBtn").addClass("on");
  } else {
    $("#topBtn").removeClass("on");
  }
});

$("#topBtn").click(function () {
  window.scrollTo({ top: 0, behavior: "smooth" });
});
