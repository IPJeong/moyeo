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