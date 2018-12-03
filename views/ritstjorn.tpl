<!DOCTYPE html>
<html>
<head>
	<title>Ný frétt</title>
   <style>
	body{
		max-width:70em;
		margin:0 auto;
		font-size: 120%;
	}
  	h3{
  		text-align: center;
  	}
  	table {
	  	font-family: arial, sans-serif;
	  	border-collapse: collapse;
		size:0.4em;
		width: 100%;
	}
 	td, th {
		text-align: center;
	 	border: 1px solid #dddddd;
	 	text-align: center;
	 	padding: 8px;
 	}
  	tr:nth-child(even) {
	 	background-color: #dddddd;
 	}
    </style>
    <script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
    <script>tinymce.init({selector:'textarea'});</script>
</head>
<body>
    <h2>Velkominn {{a}} ritstjóri.</h2>
    <h3>Nýskráning frétta</h3>

    <form method="post" action="/nyfrett" accept-charset="ISO-8859-1">
        <textarea name="story" cols="100" rows="5"></textarea>
        <p>Höfundur: <input type="text" name="author"> | <input type="submit" value="Skrá frétt"></p>
    </form>

    <hr>
    <p><a href="/">Fréttasíða</a></p>
    <br>
    <form method="post" action="/breyta_frett" accept-charset="ISO-8859-1">
        höfundur:<br>
        <input type="text" name="author" required><br>
        <input type="submit" value="Innskrá">
    </form>
</body>
</html>
