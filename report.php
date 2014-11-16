<?php
include 'common.php';

if (!$user->is_logged_in())
{
	header('location: user_login.php');
	exit;
}
	$user_id = $user->user_data['id'];

	$query = "SELECT a.*, ac.counter FROM " . $DBPrefix . "auctions a
    LEFT JOIN " . $DBPrefix . "auccounter ac ON (ac.auction_id = a.id)
 		WHERE a.user = " . $user_id ;
  $res = mysql_query($query);
  $system->check_mysql($res, $query, __LINE__, __FILE__);
	
	$j=$i=0; 
	while ($user_auctions_feed = mysql_fetch_array($res)){
    //for each auction get the info
    $id = $user_auctions_feed['id'];
    
    $query = "SELECT total FROM " . $DBPrefix . "useraccounts WHERE auc_id =" . $id ;
    $res2 = mysql_query($query);
  	$system->check_mysql($res2, $query, __LINE__, __FILE__);
  	$fees_total=0;
  	while ($fees = mysql_fetch_array($res2)){
  		$fees_total += $fees['total'];
  	}
  	$promo = ($user_auctions_feed['bold']=='y')?'B':'';
    $promo .= ($user_auctions_feed['highlighted']=='y')?'H':'';
    $promo .= ($user_auctions_feed['featured']=='y')?'F':'';
    
    //maybe how profit/loss is calculated should be a user or admin option 
    //current_bid-$fees-reserve_price  OR
    //current_bid-$fees-minimum_bid  OR
    //current_bid-$fees
    //for now comment accordingly the 3 lines bellow
     
    //$income = $user_auctions_feed['current_bid'] - $user_auctions_feed['reserve_price'] - $fees['total'];
    //$income = $user_auctions_feed['current_bid'] - $user_auctions_feed['minimum_bid'] - $fees['total'];
    $income = $user_auctions_feed['current_bid'] - $fees_total;
    
    $rsrv_bgcolor = ($user_auctions_feed['reserve_price'] >= $user_auctions_feed['current_bid'] )?'bgcolor=lightgreen':'bgcolor=red';
		$pofitloss_bgcolor = ($income >= 0 )?'bgcolor=lightgreen':'bgcolor=#F55';

    if ($user_auctions_feed['closed']){   //add data to the closed array

    	$template->assign_block_vars('closed', array(
			'BGCOLOUR' => (!(($j + 1) % 2)) ? '' : 'class="alt-row"',
			'TITLE' => $user_auctions_feed['title'],
			'STATUS' => 'Completed',
			'PROMO' => $promo,
			'RSRV_BGCOLOR'=>$rsrv_bgcolor,
			'POFITLOSS_BGCOLOR' => $pofitloss_bgcolor,
			'VIEWS' => $user_auctions_feed['counter'],
			'BIDS' => $user_auctions_feed['num_bids'],
			'BID' => $user_auctions_feed['current_bid'],
			'RESERVE' => $user_auctions_feed['reserve_price'],
			'FEES' => $fees_total,
			'INCOME' => $income,
			'ENDS' => ArrangeDateNoCorrection($user_auctions_feed['ends'] + $system->tdiff)
			));
			$j++;
    	$closed_ra['total_income'] += $income;
    	$closed_ra['total_fees'] += $fees_total;
    	$closed_ra['total_num_views'] += $user_auctions_feed['counter'];
    	$closed_ra['total_nun_bids'] += $user_auctions_feed['num_bids'];
    	
    }else{ //add data to the closed array
    	    	
    	$template->assign_block_vars('open', array(
			'BGCOLOUR' => (!(($i + 1) % 2)) ? '' : 'class="alt-row"',
			'TITLE' => $user_auctions_feed['title'],
			'STATUS' => (time() < $user_auctions_feed['starts'] )?'Pending':'Live',
			'PROMO' => $promo,
			'RSRV_BGCOLOR'=>$rsrv_bgcolor,
			'POFITLOSS_BGCOLOR' => $pofitloss_bgcolor,
			'VIEWS' => $user_auctions_feed['counter'],
			'BIDS' => $user_auctions_feed['num_bids'],
			'BID' => $user_auctions_feed['current_bid'],
			'RESERVE' => $user_auctions_feed['reserve_price'],
			'FEES' => $fees_total,
			'INCOME' =>  $income,
			'ENDS' => ArrangeDateNoCorrection($user_auctions_feed['ends'] + $system->tdiff)
			));
			$i++;
    	$opened_ra['total_income'] += $income;
    	$opened_ra['total_fees'] += $fees_total;
    	$opened_ra['total_num_views'] += $user_auctions_feed['counter'];
    	$opened_ra['total_nun_bids'] += $user_auctions_feed['num_bids'];
  	}
  } 
  
  $template->assign_vars(array(
		'OPEN_TOTAL_VIEWS' => $opened_ra['total_num_views'],
		'OPEN_TOTAL_BIDS' => $opened_ra['total_nun_bids'],
		'OPEN_TOTAL_INCOME' => $opened_ra['total_income'],
		'OPEN_TOTAL_FEES' => $opened_ra['total_fees'],
		'CLOSED_TOTAL_FEES' => $closed_ra['total_fees'],
		'CLOSED_TOTAL_INCOME' => $closed_ra['total_income'],
		'CLOSED_TOTAL_VIEWS' => $closed_ra['total_num_views'],
		'CLOSED_TOTAL_BIDS' => $closed_ra['total_nun_bids']
		
		));

// include 'header.php'; 
$template->set_filenames(array(
		'body' => 'report.tpl'
		));
$template->display('body');
//include 'footer.php';
?> 