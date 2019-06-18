<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="initial-scale=1, maximum-scale=1">

		<script src="${pageContext.request.contextPath}/resources/js/signpad/signature.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/signpad/sign.css" rel="stylesheet" type="text/css">


	</head>



	<body>
		<div id="wrapper">
			<p>Signature Pad</p>
			<div id="canvas">
				Canvas is not supported.
			</div>

			<script>
				zkSignature.capture();
			</script>

			<button type="button" onclick="zkSignature.clear()">
				Clear Signature
			</button>
			<br /> 
			<img id="saveSignature" alt="Saved image png"/>

			<form>

				<button type="button" onclick="zkSignature.send()">Save	</button>
				 
				  <img src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAAUA
AAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO
    9TXL0Y4OHwAAAABJRU5ErkJggg=="  />
				
			</form>
		</div>
	</body>
</html>
