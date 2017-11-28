var http;

	http = new XMLHttpRequest();	
        function sendRequest(action, responseHandler){
	http.open("POST", action);
	http.onreadystatechange = responseHandler;
	http.send(null);
}

function responseReceived(){
	if (http.readyState == 4){
		try {
			if (http.status == 200){
				var emailField = document.getElementById("email-group");
				var result = http.responseText;
				var spanTag = document.getElementById("email-glyph");
				if (result == "true"){
					emailField.className = "form-group has-success has-feedback";
					spanTag.className = "glyphicon glyphicon-ok form-control-feedback";
				}
				else{
					emailField.className = "form-group has-error has-feedback";
					spanTag.className = "glyphicon glyphicon-remove form-control-feedback";
				}
			}
			
		} catch (e) {
			alert(e);
		}
	}
}