<!DOCTYPE html>
<html>
<head>
	<title>Lokaverkefni</title>
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
</head>
<body>
	<h3>Fréttir</h3>
		<table>
			<tr>
				<th>Frétt/ir / Stories</th>
			</tr>
		%for row in rows:
		%for col in row:
			<tr>
				<td>{{!col}}</td>
			</tr>

		%end
		%end
		</table>

	<footer>
		<p><a href="/admin">Ritstjórn</a></p>
	</footer>


</body>
</html>
