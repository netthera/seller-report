<link rel="stylesheet" type="text/css" href="http://www.agrobids.com/themes/default/style.css">

<h3>Running Auctions</h3>
<table>
	<tr>
	<th>Title</th><th>Status</th><th>Promoted</th><th>Views</th><th>Bids</th><th>Current Bid</th><th>Reserve</th><th>Fees</th><th>Profit/Loss</th><th>Ends</th>
	</tr>
	<!-- BEGIN open -->
	<tr {open.BGCOLOUR}>
		<td>{open.TITLE}</td><td>{open.STATUS}</td><td>{open.PROMO}</td><td>{open.VIEWS}</td><td>{open.BIDS}</td><td>{open.BID}</td><td {open.RSRV_BGCOLOR}>{open.RESERVE}</td><td>{open.FEES}</td><td {open.POFITLOSS_BGCOLOR}>{open.INCOME}</td><td>{open.ENDS}</td>
	</tr>
	<!-- END open -->
	<tr>
		<td>Total</td><td>&nbsp;</td><td>&nbsp;</td><td>{OPEN_TOTAL_VIEWS}</td><td>{OPEN_TOTAL_BIDS}</td><td>&nbsp;</td><td>&nbsp;</td><td>{OPEN_TOTAL_FEES}</td><td>{OPEN_TOTAL_INCOME}</td><td>&nbsp;</td>
	</tr>
</table>
<br><br>
<h3>Closed Auctions</h3>
<table>
	<tr>
	<th>Title</th><th>Status</th><th>Promoted</th><th>Views</th><th>Bids</th><th>Current Bid</th><th>Reserve</th><th>Fees</th><th>Profit/Loss</th><th>Ended</th>
	</tr>
	<!-- BEGIN closed -->
	<tr {closed.BGCOLOUR}>
		<td>{closed.TITLE}</td><td>{closed.STATUS}</td><td>{closed.PROMO}</td><td>{closed.VIEWS}</td><td>{closed.BIDS}</td><td>{closed.BID}</td><td {closed.RSRV_BGCOLOR}>{closed.RESERVE}</td><td>{closed.FEES}</td><td {closed.POFITLOSS_BGCOLOR}>{closed.INCOME}</td><td>{closed.ENDS}</td>
	</tr>
	<!-- END closed -->
	<tr>
		<td>Total</td><td>&nbsp;</td><td>&nbsp;</td><td>{CLOSED_TOTAL_VIEWS}</td><td>{CLOSED_TOTAL_BIDS}</td><td>&nbsp;</td><td>&nbsp;</td><td>{CLOSED_TOTAL_FEES}</td><td>{CLOSED_TOTAL_INCOME}</td><td>&nbsp;</td>
	</tr>
</table>
