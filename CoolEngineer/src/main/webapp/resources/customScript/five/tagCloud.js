window.onload = function() {
	try {
		/*TagCanvas.Start('myCanvas','tags',{
			textColour: '#ff0000',
			outlineColour: '#ff00ff',
			reverse: true,
			depth: 0.5,
			maxSpeed: 0.08
		});*/
		TagCanvas.Start('myCanvas','tags', {
			 textFont: 'Impact,"Arial Black",sans-serif',
			 textColour: null,
			 textHeight: 30,
			 reverse: true,
			 depth: 0.5,
			 maxSpeed: 0.08
			});
	} catch(e) {
		// something went wrong, hide the canvas container
		document.getElementById('myCanvasContainer').style.display = 'none';
	}
};

//date picker
$(function(){
    //Spinner
    $(".spinner_default").spinner()
    $(".spinner_decimal").spinner({step: 0.01, numberFormat: "n"});                
    //End spinner
    
    //Datepicker
    $('#dp-2').datepicker();
    $('#dp-3').datepicker({startView: 2});
    $('#dp-4').datepicker({startView: 1});                
    //End Datepicker
});

