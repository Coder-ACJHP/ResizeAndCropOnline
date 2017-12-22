window.onload = $(function() {
	$('#target').Jcrop({
		onSelect : updateCoords
	});
});
function updateCoords(c) {
	jQuery('#x').val(c.x);
	jQuery('#y').val(c.y);
	jQuery('#w').val(c.w);
	jQuery('#h').val(c.h);
};
function checkCoords() {
	if (parseInt(jQuery('#w').val()) > 0)
		return true;
	alert('Please select a crop region then press submit.');
	return false;
};