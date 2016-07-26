<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Mobile-first Background Image Slider Demo</title>
  <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="inc/style.css" media="screen">
</head>


   <div id="cont">
     <div style="background: url(https://unsplash.it/1920/450?image=419); background-position: center;"></div>
     <div style="background: url(https://unsplash.it/1920/450?image=431); background-position: center;"></div>
     <div style="background: url(https://unsplash.it/1920/450?image=435); background-position: top;"></div>
   </div>

  <!-- <button id="test"></button> -->

  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <script src="inc/slider.js" charset="utf-8"></script>
  <script src="inc/script.js" charset="utf-8"></script>
  <script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
</body>
</html>
 