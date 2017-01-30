<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/moyeo/resources/resource/js/plugins/slick/slick.css">
<link rel="stylesheet" type="text/css" href="/moyeo/resources/resource/js/plugins/slick/slick-theme.css">
<style type="text/css">
  html, body {
    margin: 0;
    padding: 0;
  }

  * {
    box-sizing: border-box;
  }

  .slider {
      width: 50%;
      margin: 100px auto;
  }

  .slick-slide {
    margin: 0px 20px;
  }

  .slick-slide img {
    width: 100%;
  }

  .slick-prev:before,
  .slick-next:before {
      color: black;
  }
</style>
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script src="/moyeo/resources/resource/js/plugins/slick/slick.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
  $(document).on('ready', function() {
    $(".regular").slick({
      dots: true,
      infinite: true,
      slidesToShow: 3,
      slidesToScroll: 3
    });
    $(".center").slick({
      dots: true,
      infinite: true,
      centerMode: true,
      slidesToShow: 3,
      slidesToScroll: 3
    });
    $(".variable").slick({
      dots: true,
      infinite: true,
      variableWidth: true
    });
  });
</script>
