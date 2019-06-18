<!DOCTYPE html>
<!-- saved from url=(0052)https://getbootstrap.com/docs/3.3/examples/carousel/ -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
    <title>Pregnancy</title>
    
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <script src="./Carousel Template for Bootstrap_files/ie-emulation-modes-warning.js.download"></script>
    <link href="${pageContext.request.contextPath}/resources/css/carousel.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet">
    
    <script type="text/javascript">
function calc()
{
var day = document.first.len11.value;   
var mon = document.first.len12.value;
var year = document.first.len13.value;
var ylen = year.length;
var d = new Array("SUNDAY", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY");
var m = new Array("JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE", "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER",
"DECEMBER");
var curd = new Date(year,mon-1,day);
var res2 = curd.getMonth();
var res = new Date();
var diff =
Date.UTC(res.getFullYear(),res.getMonth()-1,res.getDay(),0,0,0)
- Date.UTC(curd.getFullYear(),curd.getMonth()-1,curd.getDay(),0,0,0);
var secleft = diff/1000/60;
var hrsleft = secleft/60;
var daysleft = hrsleft/24;
//if(res2 == (mon-1) && daysleft < 300 && year!="")
if (year!="" && ylen>3)
{
var fd1 = new Date(year, mon-1, parseInt(day)+10);
document.first.fd1.value = d[fd1.getDay()]+", "+m[fd1.getMonth()]+" "+fd1.getDate()+", "+fd1.getFullYear();
var fd2 = new Date(year, mon-1, parseInt(day)+20);
document.first.fd2.value = d[fd2.getDay()]+", "+m[fd2.getMonth()]+" "+fd2.getDate()+", "+fd2.getFullYear();
var cd = new Date(year, mon-1, parseInt(day)+14);
document.first.cd.value = d[cd.getDay()]+", "+m[cd.getMonth()]+" "+cd.getDate()+", "+cd.getFullYear();
var fte = new Date(year, mon-1, parseInt(day)+84);
document.first.fte.value = d[fte.getDay()]+", "+m[fte.getMonth()]+" "+fte.getDate()+", "+fte.getFullYear();
var ste = new Date(year, mon-1, parseInt(day)+189);
document.first.ste.value = d[ste.getDay()]+", "+m[ste.getMonth()]+" "+ste.getDate()+", "+ste.getFullYear();
var dd = new Date(year, mon-1, parseInt(day)+280);
document.first.dd.value = d[dd.getDay()]+", "+m[dd.getMonth()]+" "+dd.getDate()+", "+dd.getFullYear();
var patientName=document.getElementById("patientName").value;
}
else{
alert("Invalid Date");
}
}
function isNumber(evt) {evt = (evt) ? evt : window.event;var charCode = (evt.which) ? evt.which : evt.keyCode;if (charCode > 31 && (charCode < 48 || charCode > 57)) {return false;}return true;
}
/* function chk(){
var sds = document.getElementById('dum');
if(sds == null){alert("You are using a free package.\n You are not allowed to remove the tag.\n");
document.getElementById("kk").style.visibility="hidden";
}
var sdss = document.getElementById("dumdiv");
if(sdss == null){alert("You are using a free package.\n You are not allowed to remove the tag.\n");}
}
window.onload=chk; */
</script>
  </head>
<!-- NAVBAR 
================================================== -->
  <body>
   <jsp:include page="../include/stemcellHeader.jsp" /> 
   <div class="clearfix"></div>
<section id="four-tab">

<form method="POST" action='${pageContext.request.contextPath}/submitPregnancyCalculator' name=first class='frms' id="reset">

   <div class="container">
   <input type="hidden" id="patientId" name="patientId">
     	<h4 class="text-center">Pregnancy Calculator</h4>
        <hr>
		<div class="form-group">
		<div class="row">
			<div class="col-sm-12">
		<div align='left' class="margn-lft"><label>Date of Last Menstrual Period:</label></div>
		</div>
		</div>
          <div class="row">
          
            <div class="col-sm-8">
        	<div class="col-sm-4">
        	
            <label for="sel1">Date :</label>
             <select class="form-control" id="sel1" name="len11">
        <option name=1 value=1>1</option>
        <option name=2 value=2>2</option>
        <option name=3 value=3>3</option>
        <option name=4 value=4>4</option>
        <option name=5 value=5>5</option>
        <option name=6 value=6>6</option>
        <option name=7 value=7>7</option>
        <option name=8 value=8>8</option>
        <option name=9 value=9>9</option>
        <option name=10 value=10>10</option>
        <option name=11 value=11>11</option>
        <option name=12 value=12>12</option>
        <option name=13 value=13>13</option>
        <option name=14 value=14>14</option>
        <option name=15 value=15>15</option>
        <option name=16 value=16>16</option>
        <option name=17 value=17>17</option>
        <option name=18 value=18>18</option>
        <option name=19 value=19>19</option>
        <option name=20 value=20>20</option>
        <option name=21 value=21>21</option>
        <option name=22 value=22>22</option>
        <option name=23 value=23>23</option>
        <option name=24 value=24>24</option>
        <option name=25 value=25>25</option>
        <option name=26 value=25>26</option>
        <option name=27 value=27>27</option>
        <option name=28 value=28>28</option>
        <option name=29 value=29>29</option>
        <option name=30 value=30>30</option>
        <option name=31 value=31>31</option>
      </select>
            </div>
            <div class="col-sm-4">
            <label for="sel1">Month :</label>
             <select class="form-control" id="sel1" name="len12">
        <option  name=1 value=1>1</option>
        <option  name=2 value=2>2</option>
        <option  name=3 value=3>3</option>
        <option  name=4 value=4>4</option>
        <option  name=5 value=5>5</option>
        <option  name=6 value=6>6</option>
        <option  name=7 value=7>7</option>
        <option  name=8 value=8>8</option>
        <option  name=9 value=9>9</option>
        <option  name=10 value=10>10</option>
        <option  name=11 value=11>11</option>
        <option  name=12 value=12>12</option>
      </select>
            </div>
            <div class="col-sm-4">
            <label for="sel1" class="leftt">Year :</label>
            <input type="text" class="form-control" id="usr" placeholder="  year here" name=len13 type=text onkeypress="return isNumber(event)">
            </div>
            </div>
            <div class="col-sm-4">
            <button type="button" class="btn btn-info" onClick="calc()" name="cc" value="Calculate">Calculate</button>
            <button type="button" class="btn btn-info" onclick="resetFunction()" value="reset">Reset</button>
            </div> 
            <div class="clearfix"></div>
            <hr>
            <div class="col-sm-12">
        <div class="col-sm-3"> 
        <label for="sel1">Patient's Firtility Date :</label></div>
         <div class="col-sm-4"> 
         <input type="text" class="form-control" id="fd1" placeholder="from date" name="fd1"></div>
         <div class="col-sm-1 text-center">
          <label for="sel1">to</label></div>
         <div class="col-sm-4"> 
         <input type="text" class="form-control" id="fd2" placeholder="end date" name="fd2"></div>
         </div>
         
            <div class="col-sm-12">
        <div class="col-sm-3"> 
        <label for="sel1">Patient's Conception Date :</label></div>
         <div class="col-sm-9"> 
         <input type="text" class="form-control" id="usr" name="cd"></div>
         </div>
         
            <div class="col-sm-12">
        <div class="col-sm-3"> 
        <label for="sel1">First trimister Ends(12 Weeks) :</label></div>
         <div class="col-sm-9"> <input type="text" class="form-control" id="usr" name="fte"></div>
         </div>
         
            <div class="col-sm-12">
        <div class="col-sm-3"> 
        <label for="sel1">Second Trimister Ends(12 Weeks) :</label></div>
         <div class="col-sm-9"> <input type="text" class="form-control" id="usr" name="ste"></div>
         </div>
         
           <div class="col-sm-12">
        <div class="col-sm-3"> <label for="sel1">Patient's Due Date :</label></div>
         <div class="col-sm-4"> <input type="text" class="form-control" id="usr" name="dd"></div>
         </div>
         <div class="button"><a href="#"><button type="submit" class="btn btn-info">Submit</button></a></div>
  		  </div>
  		 </div>
</div>
	  		  </form> 
	
</section>
<!-- FOOTER -->
<jsp:include page="../include/stemcellFooter.jsp" /> 
<!-- Bootstrap core JavaScript
 ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery.min.js.download"></script>
<script src="js/bootstrap.min.js.download"></script>
<script src="js/holder.min.js.download"></script>
<script src="js/ie10-viewport-bug-workaround.js.download"></script>
<script>
function resetFunction() {
    document.getElementById("reset").reset();
}
</script>
</body>
</html>