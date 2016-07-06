function faronAjaxReturn(data){
	if( data === "0" ){ var output ="Rejected"; var divid = "fail"}       //end of 0
	if( data === "1" ){ var output ="Malfunction detected"; var divid = "warning" } //end of 1
	if( data === "2" ){ var output ="Success"; var divid = "pass" } //end of 2*/
//	if( data === "ok" ){ var output ="Success"; var divid = "pass" } //end of 2*/
	if( data['result'] === "ok" ) {  var output="Processed"; var divid = "warning" }
	if( data['result'] === "no" ) {  var output="Attention required"; var divid = "fail" }
	if( data['result'] === "fuck" ) {  var output="Halted"; var divid = "fail" }
	//var output = data['result']; var divid = "pass";
	//var output = data['result']['input1']; var divid = "warning";
	$('#'+divid).html("<p>"+output +"</p>");
}


