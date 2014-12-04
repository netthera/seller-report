

<!-- IF B_SHOW_HEADER -->
<!-- INCLUDE user_menu_header.tpl -->
<!-- ENDIF -->
<style>
	td {
    text-align: right;
}
</style>
<table style="text-align:center;margin:auto"  width=100%  >
	<tr><td colspan=11 style="text-align:left;"> <h3 style='margin-top:10px;margin-bottom:1px;'>Running Auctions</h3></td></tr>
	<tr><td colspan=11 style="text-align:left;"> <h4 style='margin-top:10px;margin-bottom:1px;'>Standard Auctions</h4></td></tr>
	<tr>
	<th width=27% >Title</th><th width=9%>Status</th><th>Promoted</th><th>Views</th><th>Bids</th><th>Current&nbsp;Bid</th><th colspan=2>Reserve</th><th>Fees</th><th>Profit/Loss</th><th width=17% >Ends</th>
	</tr>
	<!-- BEGIN open -->
	<tr {open.BGCOLOUR}>
		<td style="text-align:left;">{open.TITLE}</td><td style="text-align:center;">{open.STATUS}</td><td style="text-align:center;">{open.PROMO}</td><td align=right>{open.VIEWS}</td><td>{open.BIDS}</td><td>{open.BID}</td><td colspan=2 {open.RSRV_BGCOLOR}>{open.RESERVE}</td><td>{open.FEES}</td><td {open.POFITLOSS_BGCOLOR}>{open.INCOME}</td><td>{open.ENDS}</td>
	</tr>
	<!-- END open -->

<!-- IF B_HAS_BUY_NOW_ONLY -->
<tr><td colspan=11 style="text-align:left;"> <h4 style='margin-top:10px;margin-bottom:1px;'>Buy Now Only</h4></td></tr>


	<tr>
	<th width=27% >Title</th><th width=9%>Status</th><th>Promoted</th><th>Views</th><th>Buyers</th><th>Price</th><th colspan=2>Quantity</th><th>Fees</th><th>Profit/Loss</th><th>Ends</th>
	</tr>
	<!-- BEGIN buynowonly -->
	<tr {buynowonly.BGCOLOUR}>
		<td style="text-align:left;">{buynowonly.TITLE}</td><td style="text-align:center;">{buynowonly.STATUS}</td><td style="text-align:center;">{buynowonly.PROMO}</td><td>{buynowonly.VIEWS}</td><td>{buynowonly.BUYERS}</td><td >{buynowonly.PRICE}</td><td bgcolor=lightgreen>{buynowonly.QUANTITY}</td><td bgcolor=lightblue>{buynowonly.QNT_NOT_SOLD}</td><td>{buynowonly.FEES}</td><td {buynowonly.POFITLOSS_BGCOLOR}>{buynowonly.INCOME}</td><td>{buynowonly.ENDS}</td>
	</tr>
	<!-- END buynowonly -->

<!-- ENDIF -->

<!-- IF B_HAS_DUTCH -->
<tr><td colspan=11 style="text-align:left;"> <h4 style='margin-top:10px;margin-bottom:1px;'>Dutch Auctions</h4></td></tr>
	<tr>
	<th width=27% >Title</th><th width=9% >Status</th><th>Promoted</th><th>Views</th><th>Bids</th><th>Current Bid</th><th colspan=2>Quantity</th><th>Fees</th><th>Profit/Loss</th><th >Ends</th>
	</tr>
	<!-- BEGIN dutch -->
	<tr {dutch.BGCOLOUR}>
		<td style="text-align:left;">{dutch.TITLE}</td><td style="text-align:center;">{dutch.STATUS}</td><td style="text-align:center;">{dutch.PROMO}</td><td>{dutch.VIEWS}</td><td>{dutch.BIDS}</td><td>{dutch.BID}</td><td bgcolor=lightgreen>{dutch.QUANTITY}</td><td bgcolor=lightblue>{dutch.QNT_NOT_SOLD}</td><td>{dutch.FEES}</td><td {dutch.POFITLOSS_BGCOLOR}>{dutch.INCOME}</td><td>{dutch.ENDS}</td>
	</tr>
	<!-- END dutch -->
<!-- ENDIF -->
	<tr><td style='border-bottom:solid lightgray 1px;' colspan=11>&nbsp;</td></tr>
	<tr>
		<td align=right colspan=3><b>Totals</b></td><td>{OPEN_TOTAL_VIEWS}</td><td>{OPEN_TOTAL_BIDS}</td><td>&nbsp;</td><td colspan=2>&nbsp;</td><td>{OPEN_TOTAL_FEES}</td><td>{OPEN_TOTAL_INCOME}</td><td>&nbsp;</td>
	</tr>

<tr><td colspan=11 style="text-align:left;"> <h3 style='margin-top:10px;margin-bottom:1px;'>Closed Auctions</h3></td></tr>
<tr><td colspan=11 style="text-align:left;"> <h4 style='margin-top:10px;margin-bottom:1px;'>Standard Auctions</h4></td></tr>

<tr>
<th width=27% >Title</th><th width=9%>Status</th><th>Promoted</th><th>Views</th><th>Bids</th><th>Current Bid</th><th  colspan=2 >Reserve</th><th>Fees</th><th>Profit/Loss</th><th>Ended</th>
</tr>
<!-- BEGIN closed -->
<tr {closed.BGCOLOUR}>
<td style="text-align:left;">{closed.TITLE}</td><td style="text-align:center;">{closed.STATUS}</td><td style="text-align:center;">{closed.PROMO}</td><td>{closed.VIEWS}</td><td>{closed.BIDS}</td><td>{closed.BID}</td><td  colspan=2  {closed.RSRV_BGCOLOR}>{closed.RESERVE}</td><td>{closed.FEES}</td><td {closed.POFITLOSS_BGCOLOR}>{closed.INCOME}</td><td>{closed.ENDS}</td>
</tr>
<!-- END closed -->




<!-- IF B_HAS_BUY_NOW_ONLY_C -->

<tr><td colspan=11 style="text-align:left;"> <h4 style='margin-top:10px;margin-bottom:1px;'>Buy Now Only</h4></td></tr>

	<tr>
	<th width=27% >Title</th><th width=9%>Status</th><th>Promoted</th><th>Views</th><th>Buyers</th><th>Price</th><th  colspan=2 >Quantity</th><th>Fees</th><th>Profit/Loss</th><th>Ended</th>
	</tr>
	<!-- BEGIN buynowonly_c -->
	<tr {buynowonly_c.BGCOLOUR}>
		<td style="text-align:left;">{buynowonly_c.TITLE}</td><td style="text-align:center;">{buynowonly_c.STATUS}</td><td style="text-align:center;">{buynowonly_c.PROMO}</td><td>{buynowonly_c.VIEWS}</td><td>{buynowonly_c.BUYERS}</td><td >{buynowonly_c.PRICE}</td><td bgcolor=lightgreen>{buynowonly_c.QUANTITY}</td><td bgcolor=lightblue>{buynowonly_c.QNT_NOT_SOLD}</td><td>{buynowonly_c.FEES}</td><td {buynowonly_c.POFITLOSS_BGCOLOR}>{buynowonly_c.INCOME}</td><td>{buynowonly_c.ENDS}</td>
	</tr>
	<!-- END buynowonly_c -->

<!-- ENDIF -->

<!-- IF B_HAS_DUTCH_C -->

<tr><td colspan=11 style="text-align:left;"> <h4 style='margin-top:10px;margin-bottom:1px;'>Dutch Auctions</h4></td></tr>

	<tr>
	<th width=27% >Title</th><th width=9%>Status</th><th>Promoted</th><th>Views</th><th>Bids</th><th>Current Bid</th><th colspan=2 >Quantity</th><th>Fees</th><th>Profit/Loss</th><th>Ended</th>
	</tr>
	<!-- BEGIN dutch_c -->
	<tr {dutch_c.BGCOLOUR}>
		<td style="text-align:left;">{dutch_c.TITLE}</td><td  style="text-align:center;">{dutch_c.STATUS}</td><td style="text-align:center;">{dutch_c.PROMO}</td><td>{dutch_c.VIEWS}</td><td>{dutch_c.BIDS}</td><td>{dutch_c.BID}</td><td bgcolor=lightgreen>{dutch_c.QUANTITY}</td><td bgcolor=lightblue>{dutch_c.QNT_NOT_SOLD}</td><td>{dutch_c.FEES}</td><td {dutch_c.POFITLOSS_BGCOLOR}>{dutch_c.INCOME}</td><td>{dutch_c.ENDS}</td>
	</tr>
	<!-- END dutch_c -->
	<!-- ENDIF -->
	<tr><td style='border-bottom:solid lightgray 1px;' colspan=11 >&nbsp;</td></tr>
	<tr >
		<td align=right colspan=3><b>Totals</b></td><td>{CLOSED_TOTAL_VIEWS}</td><td>{CLOSED_TOTAL_BIDS}</td><td>&nbsp;</td><td colspan=2>&nbsp;</td><td>{CLOSED_TOTAL_FEES}</td><td>{CLOSED_TOTAL_INCOME}</td><td>&nbsp;</td>
	</tr>
</table>

<div style='margin:auto; padding:10px;'>
<table style="text-align:center;text-align:center;margin:auto;border:solid lightgray 1px;" width=70%>
	<tr><td colspan=11 style="text-align:left;"> <h5 style='margin-top:2px;margin-bottom:1px;border-bottom:solid lightgray 1px;padding-left:3px;padding-top:5px;font-weight:bold'>Color legend</h5></td></tr>

	<tr><th width=27% >In Profit/Loss</th>
	<td bgcolor=lightgreen style="text-align:left;">Profit (final, fees deducted)</td>
	<td bgcolor=lightblue style="text-align:left;">Profit (not final, fees not deducted)</td>
	<td bgcolor=#F55 style="text-align:left;" width=21% >Loss</td></tr>
	
	<tr><th>In Quantity</th>
	<td bgcolor=lightgreen style="text-align:left;" width=21% >Quantity Sold</td>
	<td bgcolor=lightblue style="text-align:left;">Quantity Remaining</td>
	</tr>
	<tr><th>In Reserve</th>
	<td bgcolor=lightgreen style="text-align:left;" width=21% >Reserve met</td><td>&nbsp;</td>
	<td bgcolor=#F55 style="text-align:left;">Reserve not met</td></tr>
</table>
</div>
