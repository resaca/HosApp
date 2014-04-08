var showDoctor = function(id) {
	$.get( "/hospital/show/"+id, function( data ) {
		$( "#modal-content" ).html( data );
		$( "#modal" ).show( "fast", function() {
    	
  	});
	});
}

var hideDoctor = function(id) {
	$( "#modal" ).hide( "fast", function() {
    $( "#modal-content" ).html( "" );
  });
}

