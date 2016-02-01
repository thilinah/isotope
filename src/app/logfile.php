<?php
$numberOfLines = 1000;
$file = file("data/app.log");

$start = count($file) - $numberOfLines;
if($start < 0){
    $start = 0;
}
$data = "";
for ($i = $start; $i < count($file); $i++) {
    echo $file[$i] . "<br/><br/>";
}