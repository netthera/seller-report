<?php
include 'common.php';
include $include_path . 'functions_cron.php';


	
//prepair user report
function prepair_report($user_id,$output){
	
	global $system, $DBPrefix,$template;
	
	$query = "SELECT a.*, ac.counter FROM " . $DBPrefix . "auctions a
    LEFT JOIN " . $DBPrefix . "auccounter ac ON (ac.auction_id = a.id)
 		WHERE a.user = " . $user_id ;
  $res = mysql_query($query);
  $system->check_mysql($res, $query, __LINE__, __FILE__);
	
	$j=$i=$std_counter=$bno_counter=$dutch_counter=$std_counter_c=$bno_counter_c=$dutch_counter_c=0; 
	$opened_ra = $closed_ra = array();
	
	
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
    
    if ( $user_auctions_feed['bn_only']=='y' ){
    	
    	
      $query = "SELECT * FROM " . $DBPrefix . "winners WHERE auction =" . $id ;
      $res3 = mysql_query($query);
    	$system->check_mysql($res3, $query, __LINE__, __FILE__);
      
      $income=$quantity=$buyers = 0;
      
      while ($winners = mysql_fetch_array($res3)){
    		$income +=  $user_auctions_feed['buy_now'] * $winners['qty'];
    		$quantity += $winners['qty'];
    		$buyers++;
    		$has_buy_now_only = true;
    	}
    	$income -=$fees_total;
    	$quantity_not_sold = $user_auctions_feed['initial_quantity']-$quantity;
    }else if ($user_auctions_feed['auction_type']==2 ){	
    	$dutch_info = get_lowest_qualified_bid($id ,$user_auctions_feed['quantity'],true);
    	$income =  $dutch_info['lowest_qualified_bid'] * $dutch_info['quantity_sold'];
    	$quantity = $dutch_info['quantity_sold'];
    	$income -=$fees_total;
    	$quantity_not_sold = $user_auctions_feed['quantity']-$quantity;
    	$has_dutch = true;
		}else{
    
      //maybe how profit/loss is calculated should be a user or admin option 
      //current_bid-$fees-reserve_price  OR
      //current_bid-$fees-minimum_bid  OR
      //current_bid-$fees
      //for now comment accordingly 2 of the 3 lines bellow
  		if ($user_auctions_feed['reserve_price'] <= $user_auctions_feed['current_bid'] )
      //$income = $user_auctions_feed['current_bid'] - $user_auctions_feed['reserve_price'] - $fees['total'];
      //$income = $user_auctions_feed['current_bid'] - $user_auctions_feed['minimum_bid'] - $fees['total'];
      	$income = $user_auctions_feed['current_bid'] - $fees_total;
      else
      	$income = 0 - $fees_total;
 		}   
    $rsrv_bgcolor = ($user_auctions_feed['reserve_price'] <= $user_auctions_feed['current_bid'] )?'bgcolor=lightgreen':'bgcolor=#F55';
		if($user_auctions_feed['bn_only']!='y' && !$user_auctions_feed['closed'])
			$pofitloss_bgcolor = ($income >= 0 )?'bgcolor=lightblue':'bgcolor=#F55';
		else
			$pofitloss_bgcolor = ($income >= 0 )?'bgcolor=lightgreen':'bgcolor=#F55';

    if ($user_auctions_feed['closed'] || $user_auctions_feed['suspended']>0 ){   //add data to the closed array

			if ($user_auctions_feed['auction_type']==2){
					$output_ra_name='dutch_c';
					$j=$dutch_counter_c++;
			}else if($user_auctions_feed['bn_only']=='y'){
					$output_ra_name='buynowonly_c';
					$j=$bno_counter_c++;
			}else{
					$output_ra_name='closed';
					$j=$std_counter_c++;
			}	
			$closed_ra['total_income'] += $income;
    	$closed_ra['total_fees'] += $fees_total;
    	$closed_ra['total_num_views'] += $user_auctions_feed['counter'];
    	$closed_ra['total_nun_bids'] += $user_auctions_feed['num_bids'];
    	$closed_ra['has_buy_now_only'] = $has_buy_now_only;
    	$closed_ra['has_dutch'] = $has_dutch;
    	$status=( $user_auctions_feed['suspended'] == 0)?'Completed':'Suspended';
    	
    }else{ //add data to the open array
    	
    	if ($user_auctions_feed['auction_type']==2){
					$output_ra_name='dutch';
					$j=$dutch_counter++;
			}else if($user_auctions_feed['bn_only']=='y'){
					$output_ra_name='buynowonly';
					$j=$bno_counter++;
			}else{
    		$output_ra_name='open';   	
    		$j= $i++;
    	}
    	$opened_ra['total_income'] += $income;
    	$opened_ra['total_fees'] += $fees_total;
    	$opened_ra['total_num_views'] += $user_auctions_feed['counter'];
    	$opened_ra['total_nun_bids'] += $user_auctions_feed['num_bids'];   	
    	$opened_ra['has_buy_now_only'] = $has_buy_now_only;
    	$opened_ra['has_dutch'] = $has_dutch;
    	$status=(time() < $user_auctions_feed['starts'] )?'Pending':'Active';
    	
  	}
  	
  	$template->assign_block_vars($output_ra_name, array(
			'BGCOLOUR' => (!(($j + 1) % 2)) ? '' : 'class="alt-row"',
			'TITLE' => $user_auctions_feed['title'],
			'STATUS' => $status,
			'PROMO' => $promo,
			'RSRV_BGCOLOR'=>$rsrv_bgcolor,
			'POFITLOSS_BGCOLOR' => $pofitloss_bgcolor,
			'VIEWS' => $user_auctions_feed['counter'],
			'BIDS' => $user_auctions_feed['num_bids'],
			'BID' => $user_auctions_feed['current_bid'],
			'BUYERS' => $buyers,
			'QUANTITY' => $quantity,
			'QNT_NOT_SOLD' => $quantity_not_sold,
			'PRICE' => $user_auctions_feed['buy_now'],
			'RESERVE' => $user_auctions_feed['reserve_price'],
			'FEES' => $fees_total,
			'INCOME' => $income,
			'ENDS' => ArrangeDateNoCorrection($user_auctions_feed['ends'] + $system->tdiff)
			));
  	
  	
  } 
	$template->assign_vars(array(
		'OPEN_TOTAL_VIEWS' => $opened_ra['total_num_views'],
		'OPEN_TOTAL_BIDS' => $opened_ra['total_nun_bids'],
		'OPEN_TOTAL_INCOME' => $opened_ra['total_income'],
		'OPEN_TOTAL_FEES' => $opened_ra['total_fees'],
		'CLOSED_TOTAL_FEES' => $closed_ra['total_fees'],
		'CLOSED_TOTAL_INCOME' => $closed_ra['total_income'],
		'CLOSED_TOTAL_VIEWS' => $closed_ra['total_num_views'],
		'CLOSED_TOTAL_BIDS' => $closed_ra['total_nun_bids'],
			
		'B_HAS_BUY_NOW_ONLY'=>$opened_ra['has_buy_now_only'],
		'B_HAS_DUTCH'=>$opened_ra['has_dutch'],
		'B_HAS_BUY_NOW_ONLY_C'=>$closed_ra['has_buy_now_only'],
		'B_HAS_DUTCH_C'=>$closed_ra['has_dutch'],
		'B_SHOW_HEADER' =>($output == 'template')? true : false
		));


}

if (isset ($_REQUEST['id'])){
	echo 'Your Profit/Loss Report';
	$user_id = $_REQUEST['id'];
	prepair_report($user_id,'email');
	$template->set_filenames(array(
  		'body' => 'report.tpl'
  		));
  $template->display('body');
  
}else if(strpos($_SERVER[HTTP_REFERER],'user_menu.php?cptab=selling')){
	
  if (!$user->is_logged_in())
  {
  	header('location: user_login.php');
  	exit;
  }
  $user_id = $user->user_data['id'];
  prepair_report($user_id,'template');
  
  include 'header.php';
  $TMP_usmenutitle = 'Your Profit/Loss Report';
  include $include_path . 'user_cp.php';
  $template->set_filenames(array(
  		'body' => 'report.tpl'
  		));
  $template->display('body');
  include 'footer.php';

}else{ 

	header('location: index.php');
}
?> 
