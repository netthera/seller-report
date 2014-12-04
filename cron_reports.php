<?php

include 'common.php';

function send_reports(){
	
global $system, $DBPrefix,$template;

$daysold= 45; // change this number to reflect 
//how many days old should an auction be to appear on the repors.
//------------------------------------------------------------

$oldest = time() - (60 * 60 * 24 * $daysold) ;
 
  		//walk through the auction db and build a user list
  $query = "SELECT DISTINCT user  FROM " . $DBPrefix . "auctions 
 						WHERE starts >= " . $oldest ;
  $res = mysql_query($query);
  $system->check_mysql($res, $query, __LINE__, __FILE__);
  		
$headers  = 'MIME-Version: 1.0' . "\r\n";
$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
  $headers .= "From: ".$system->SETTINGS['adminmail']; 
  $subject= 'Your weekly report from '.$system->SETTINGS['sitename'];
    		//for each user email report
  while ($auctions = mysql_fetch_array($res)){
  	/*
  	$user_id = $auctions['user'];
  	$emailer = new email_handler();
  	//prepair_report($user_id,'emailer');
  	prepair_report($user_id,'template');
  	$emailer->email_uid = $auctions['user'];
    $emailer->email_sender($mailres['email'], 'send_report_email.inc.php', $subject);
    */
    $user_id = $auctions['user'];
    $query = "SELECT email FROM " . $DBPrefix . "users WHERE id = " . $user_id;
		$res2 = mysql_query($query);
		$system->check_mysql($res2, $query, __LINE__, __FILE__);
		$to = mysql_result($res2, 0);
    $msg =  file_get_contents($main_path .'report.php?id='.$user_id);
    
    mail($to, $subject, $msg, $headers); 
    
  }
  

}

//Get day of the week
// if (isset ($_SERVER['SHELL']) && $_SERVER['USER']=='agrobids'){  
// 	send_reports();
//}

 send_reports(); 

?>
