function showDiv() {
	if($('#divSeConnecter').is(":hidden")){
		$('#divSeConnecter').show();
		$('#divOther').hide();
	}else{
		$('#divSeConnecter').hide();
		$('#divOther').show();
	}
}

function cancelConnection() {
	$('#pseudo').val('');
	$('#pwd'). val('');
	showDiv();
}