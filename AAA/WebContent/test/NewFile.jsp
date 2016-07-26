<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>

<html lang="en">

<head>

  <meta charset="utf-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <title>jQuery UI Slider - Slider bound to select</title>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">

  <link rel="stylesheet" href="/resources/demos/style.css">

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

  <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>

  <script>

  $( function() {

    var select = $( "#minbeds" );

    var slider = $( "<div id='slider'></div>" ).insertAfter( select ).slider({

      min: 1,

      max: 6,

      range: "min",

      value: select[ 0 ].selectedIndex + 1,

      slide: function( event, ui ) {

        select[ 0 ].selectedIndex = ui.value - 1;

      }

    });

    $( "#minbeds" ).on( "change", function() {

      slider.slider( "value", this.selectedIndex + 1 );

    });

  } );

  </script>

</head>

<body>

 

<form id="reservation">

  <label for="minbeds">Minimum number of beds</label>

  <select name="minbeds" id="minbeds">

    <option>1</option>

    <option>2</option>

    <option>3</option>

    <option>4</option>

    <option>5</option>

    <option>6</option>

  </select>

</form>

 

 

</body>

</html>

