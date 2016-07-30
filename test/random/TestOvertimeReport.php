<?php
date_default_timezone_set('Asia/Colombo');
$overtime = array();
$overtime['2016-01-29'] = array('o'=>1,'d'=>1);
$overtime['2016-01-30'] = array('o'=>1,'d'=>1);
$overtime['2016-01-31'] = array('o'=>1,'d'=>1);
$overtime['2016-02-01'] = array('o'=>1,'d'=>1);
$overtime['2016-02-02'] = array('o'=>1,'d'=>1);
$overtime['2016-02-03'] = array('o'=>1,'d'=>1);
$overtime['2016-02-04'] = array('o'=>1,'d'=>1);
$overtime['2016-02-05'] = array('o'=>1,'d'=>1);
$overtime['2016-02-06'] = array('o'=>1,'d'=>1);
$overtime['2016-02-07'] = array('o'=>1,'d'=>1);
$overtime['2016-02-08'] = array('o'=>1,'d'=>1);
$overtime['2016-02-09'] = array('o'=>1,'d'=>1);
$overtime['2016-02-10'] = array('o'=>1,'d'=>1);

//Find first Sunday in array
$firstDate = null;
//Find double time days (7th work day of a week without a break)
$doubleTimeDates = array();
$prvDate = null;
$consecutiveWorkDays = 1;
foreach($overtime as $k=>$v){
    if($firstDate == null) {
        $dw = date("w", strtotime($k));
        if ($dw == 0) {
            $firstDate = $k;
            echo "First Date:".$k."\r\n";
        }
    }

    if($firstDate != null){
        echo "Today:".$k."\r\n";
        echo "Prvdate:".$prvDate."\r\n";
        echo "Prvdate cal:".date('Y-m-d', strtotime('-1 days',strtotime($k)))."\r\n";
        if($prvDate != null && date('Y-m-d', strtotime('-1 day',strtotime($k))) == $prvDate){

            $consecutiveWorkDays++;
            echo "cd :  $k ".$consecutiveWorkDays."\r\n";
            if($consecutiveWorkDays == 7){
                //This is a double time day
                $overtime[$k]['d'] = $overtime[$k]['d'] + $overtime[$k]['o'];
                $overtime[$k]['o'] = 0;
            }
        }

        //Resetting $consecutiveWorkDays at the start of the work week
        if($prvDate != null && date( "w", strtotime($k)) == 0){
            $consecutiveWorkDays = 1;
            $prvDate = null;
        }

        $prvDate = $k;
    }
}

echo print_r($overtime,true);