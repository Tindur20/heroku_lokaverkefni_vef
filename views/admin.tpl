<!DOCTYPE html>
<html>
<head>
	<title></title>
	<style>
		body{
			width: 90%;
			margin:0 auto;
			font-size: 120%;
		}
     	section{
     		text-align: center;
     	}

		header{
			text-align: center;
			font-size: 1em;
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
</head>
<body>
	<header><h3>Innskráningarform:</h3></header>
	<section>

		<form method="post" action="/doinnskra" accept-charset="ISO-8859-1">
			Notendanafn:<br>
			<input type="text" name="author" required><br>
			Lykilorð:<br>
			<input type="text" name="pass" required><br>
			<input type="submit" value="Innskrá">
		</form>
		<br><br>
		<a href="/">Home / frétta síða</a>
	</section>
</body>
</html>
