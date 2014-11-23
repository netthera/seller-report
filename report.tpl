<link rel="stylesheet" type="text/css" href="http://www.agrobids.com/themes/default/style.css">
<style>
	td {
    text-align: right;
}
</style>
<h3>Running Auctions</h3>
<h4 style='margin-top:10px;margin-bottom:1px;'>Standard Auctions</h4>
<table style="text-align:center;" width=800>
	<tr>
	<th width=30% >Title</th><th width=9%>Status</th><th>Promoted</th><th>Views</th><th>Bids</th><th>Current Bid</th><th>Reserve</th><th>Fees</th><th>Profit/Loss</th><th>Ends</th>
	</tr>
	<!-- BEGIN open -->
	<tr {open.BGCOLOUR}>
		<td style="text-align:left;">{open.TITLE}</td><td style="text-align:center;">{open.STATUS}</td><td style="text-align:center;">{open.PROMO}</td><td align=right>{open.VIEWS}</td><td>{open.BIDS}</td><td>{open.BID}</td><td {open.RSRV_BGCOLOR}>{open.RESERVE}</td><td>{open.FEES}</td><td {open.POFITLOSS_BGCOLOR}>{open.INCOME}</td><td>{open.ENDS}</td>
	</tr>
	<!-- END open -->
</table>
<!-- IF bynowonly -->
<h4 style='margin-top:10px;margin-bottom:1px;'>Buy Now Only</h4>
<table width=800>
	<tr>
	<th width=30%>Title</th><th width=9%>Status</th><th>Promoted</th><th>Views</th><th>Buyers</th><th>Price</th><th>Quantity</th><th>Fees</th><th>Profit/Loss</th><th>Ends</th>
	</tr>
	<!-- BEGIN bynowonly -->
	<tr {bynowonly.BGCOLOUR}>
		<td style="text-align:left;">{bynowonly.TITLE}</td><td style="text-align:center;">{bynowonly.STATUS}</td><td style="text-align:center;">{bynowonly.PROMO}</td><td>{bynowonly.VIEWS}</td><td>{bynowonly.BUYERS}</td><td >{bynowonly.PRICE}</td><td>{bynowonly.QUANTITY}</td><td>{bynowonly.FEES}</td><td {bynowonly.POFITLOSS_BGCOLOR}>{bynowonly.INCOME}</td><td>{bynowonly.ENDS}</td>
	</tr>
	<!-- END bynowonly -->
</table>
<!-- ENDIF -->

<!-- IF dutch -->
<h4 style='margin-top:10px;margin-bottom:1px;'>Dutch Auctions</h4>
<table width=800>
	<tr>
	<th width=30%>Title</th><th width=9% >Status</th><th>Promoted</th><th>Views</th><th>Bids</th><th>Current Bid</th><th>Quantity</th><th>Fees</th><th>Profit/Loss</th><th>Ends</th>
	</tr>
	<!-- BEGIN dutch -->
	<tr {dutch.BGCOLOUR}>
		<td style="text-align:left;">{dutch.TITLE}</td><td style="text-align:center;">{dutch.STATUS}</td><td style="text-align:center;">{dutch.PROMO}</td><td>{dutch.VIEWS}</td><td>{dutch.BIDS}</td><td>{dutch.BID}</td><td >{dutch.QUANTITY}</td><td>{dutch.FEES}</td><td {dutch.POFITLOSS_BGCOLOR}>{dutch.INCOME}</td><td>{dutch.ENDS}</td>
	</tr>
	<!-- END dutch -->
	<tr>
		<td align=right colspan=3><b>Totals</b></td><td>{OPEN_TOTAL_VIEWS}</td><td>{OPEN_TOTAL_BIDS}</td><td>&nbsp;</td><td>&nbsp;</td><td>{OPEN_TOTAL_FEES}</td><td>{OPEN_TOTAL_INCOME}</td><td>&nbsp;</td>
	</tr>
</table>
<!-- ENDIF -->
<br><br>
<h3>Closed Auctions</h3>
<h4 style='margin-top:10px;margin-bottom:1px;'>Standard Auctions</h4>
<table width=800>
<tr>
<th width=30%>Title</th><th width=9%>Status</th><th>Promoted</th><th>Views</th><th>Bids</th><th>Current Bid</th><th>Reserve</th><th>Fees</th><th>Profit/Loss</th><th>Ended</th>
</tr>
<!-- BEGIN closed -->
<tr {closed.BGCOLOUR}>
<td style="text-align:left;">{closed.TITLE}</td><td style="text-align:center;">{closed.STATUS}</td><td style="text-align:center;">{closed.PROMO}</td><td>{closed.VIEWS}</td><td>{closed.BIDS}</td><td>{closed.BID}</td><td {closed.RSRV_BGCOLOR}>{closed.RESERVE}</td><td>{closed.FEES}</td><td {closed.POFITLOSS_BGCOLOR}>{closed.INCOME}</td><td>{closed.ENDS}</td>
</tr>
<!-- END closed -->
</table>



<!-- IF bynowonly_c -->
<h4 style='margin-top:10px;margin-bottom:1px;'>Buy Now Only</h4>
<table width=800>
	<tr>
	<th width=30%>Title</th><th width=9%>Status</th><th>Promoted</th><th>Views</th><th>Buyers</th><th>Price</th><th>Quantity</th><th>Fees</th><th>Profit/Loss</th><th>Ended</th>
	</tr>
	<!-- BEGIN bynowonly_c -->
	<tr {bynowonly_c.BGCOLOUR}>
		<td style="text-align:left;">{bynowonly_c.TITLE}</td><td style="text-align:center;">{bynowonly_c.STATUS}</td><td style="text-align:center;">{bynowonly_c.PROMO}</td><td>{bynowonly_c.VIEWS}</td><td>{bynowonly_c.BUYERS}</td><td >{bynowonly_c.PRICE}</td><td>{bynowonly_c.QUANTITY}</td><td>{bynowonly_c.FEES}</td><td {bynowonly_c.POFITLOSS_BGCOLOR}>{bynowonly_c.INCOME}</td><td>{bynowonly_c.ENDS}</td>
	</tr>
	<!-- END bynowonly_c -->
</table>
<!-- ENDIF -->

<!-- IF dutch_c -->
<h4 style='margin-top:10px;margin-bottom:1px;'>Dutch Auctions</h4>
<table width=800>
	<tr>
	<th width=30%>Title</th><th width=9%>Status</th><th>Promoted</th><th>Views</th><th>Bids</th><th>Current Bid</th><th>Quantity</th><th>Fees</th><th>Profit/Loss</th><th>Ended</th>
	</tr>
	<!-- BEGIN dutch_c -->
	<tr {dutch_c.BGCOLOUR}>
		<td style="text-align:left;">{dutch_c.TITLE}</td><td  style="text-align:center;">{dutch_c.STATUS}</td><td style="text-align:center;">{dutch_c.PROMO}</td><td>{dutch_c.VIEWS}</td><td>{dutch_c.BIDS}</td><td>{dutch_c.BID}</td><td >{dutch_c.QUANTITY}</td><td>{dutch_c.FEES}</td><td {dutch_c.POFITLOSS_BGCOLOR}>{dutch_c.INCOME}</td><td>{dutch_c.ENDS}</td>
	</tr>
	<!-- END dutch_c -->
	<tr>
		<td align=right colspan=3><b>Totals</b></td><td>{CLOSED_TOTAL_VIEWS}</td><td>{CLOSED_TOTAL_BIDS}</td><td>&nbsp;</td><td>&nbsp;</td><td>{CLOSED_TOTAL_FEES}</td><td>{CLOSED_TOTAL_INCOME}</td><td>&nbsp;</td>
	</tr>
</table>
<!-- ENDIF -->
