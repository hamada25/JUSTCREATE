function changerClass(id, affichage)
{
	$("#tri1").removeClass('border');
	$("#tri2").removeClass('border');
	$("#tri3").removeClass('border');

	$("#affichage1").addClass('hidden');
	$("#affichage2").addClass('hidden');
	$("#affichage3").addClass('hidden');

	$('#'+id).addClass("border");

	$('#'+affichage).removeClass("hidden");
}
