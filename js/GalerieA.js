function changerClass(id, affichage)
{
	document.getElementById('tri1').classList.remove('border');
	document.getElementById('tri2').classList.remove('border');
	document.getElementById('tri3').classList.remove('border');
	
	document.getElementById('affichage1').classList.add('hidden');
	document.getElementById('affichage2').classList.add('hidden');
	document.getElementById('affichage3').classList.add('hidden');

	document.getElementById(id).classList.add('border');

	document.getElementById(affichage).classList.remove('hidden');
}
