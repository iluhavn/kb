<?php
$db = new mysqli('127.0.0.1', 'root', '', 'kb', 3306);

$db->query("SET NAMES UTF-8");
$db->query("SET collation_connection = utf8_general_ci");
$db->query("SET CHARACTER SET utf8");
$res = $db->query("SELECT * FROM `komer4banki`");


$r = array();
while($item = $res->fetch_assoc()) {
	$r[] = $item;
}
		
 echo '<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>';
    echo "<table class=\"table table-hover\">";
    echo "<tr>";
    $index = 0;
    $i = 0;
    foreach ($r[0] as $key => $value) {
        echo "<td>";
        echo $key;
        echo "</td>";
    }
    echo "</tr>";

    foreach ($r as $client) {
        echo "<tr>";
        $i = 0;
        foreach ($client as $value) {
            echo "<td>";
            echo $value;
            if($i == 3) echo " %";
            echo "</td>";
            $i++;
        }
        echo "</tr>";
    }

    echo "</table>";