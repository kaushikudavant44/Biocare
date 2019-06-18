<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script language="JavaScript">

function calculateBmi() {
var weight = document.bmiForm.weight.value
var height = document.bmiForm.height.value
if(weight > 0 && height > 0){	
var finalBmi = weight/(height/100*height/100)
document.bmiForm.bmi.value = finalBmi
if(finalBmi < 18.5){  
document.bmiForm.meaning.value = "That you are too thin."
}
if(finalBmi > 18.5 && finalBmi < 25){
document.bmiForm.meaning.value = "That you are healthy."
}
if(finalBmi > 25){
document.bmiForm.meaning.value = "That you have overweight."
}
}
else{
alert("Please Fill in everything correctly")
}
}

</script>
</head>

<body>
<form name="bmiForm">
<h2>BMI calculator</h2>
</br>
</br>Your Weight(kg): <input type="text" name="weight" size="10"><br /></br>

</br>Your Height(cm): <input type="text" name="height" size="10">

<input type="button" value="Calculate BMI" onClick="calculateBmi()"><br /></br></br></br>

Your BMI: <input type="text" name="bmi" size="10"><br /></br>

This Means: <input type="text" name="meaning" size="25"><br /></br>
<input type="reset" value="Reset" />
</form>

</body>
</html>