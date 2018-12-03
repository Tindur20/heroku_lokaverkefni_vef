<!DOCTYPE html>
<html>
<head>
	<title>Ekki leynisíða</title>
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
    <h2>Velkominn {{a}} ritstjóri.</h2>
    <h3>Nýskráning frétta</h3>
    <table>
        <tr>
            <th>ID / NR</th>
            <th>Frétt</th>
            <th>höfundur</th>
            <th>Breyta</th>
            <th>Eyða</th>
        </tr>
        %for i in cur:
        <form method="post" action="/breyta" accept-charset="ISO-8859-1">
            <tr>
                <td><input type="text" name="ID" value="{{i[0]}}"></td>
                <td><textarea name="story" cols="66" rows="3">{{i[1]}}</textarea></td>
                <td><input type="text" name="Author" value="{{i[2]}}"></td>
                <td><input type="submit" name="breytan" value="Breyta"></td>
                <td><input type="submit" name="eyda" value="Eyða"></td>
            </tr>
        </form>
        %end
        </table>
    <hr>
    <p><a href="/">Fréttasíða</a></p>
</body>
</html>
