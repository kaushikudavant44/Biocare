<!DOCTYPE html>
<!-- saved from url=(0052)https://getbootstrap.com/docs/3.3/examples/carousel/ -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />
    <title>STEM CELL</title>
    
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <script src="./Carousel Template for Bootstrap_files/ie-emulation-modes-warning.js.download"></script>
    <link href="${pageContext.request.contextPath}/resources/css/carousel.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet">
    
  
  </head>  
<!-- NAVBAR 
================================================== -->
  <body>
      <jsp:include page="../include/stemcellHeader.jsp" /> 
<section id="four-tab">

<form action="${pageContext.request.contextPath}/showViewPregnancyDate" method="POST">

   <div class="container">
   <input type="hidden" id="patientId" name="patientId">
     	<h4 class="text-center"> View Pregnancy Dates</h4>
        <hr>
		<div class="form-group">
		
		</div>
          <div class="row">
          
            <!-- <div class="col-sm-8">
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
            <button type="button" class="btn btn-info" value="reset">Reset</button>
            </div> 
          -->   <div class="clearfix"></div>
            <hr>
            <div class="col-sm-12">
        <div class="col-sm-3"> 
        <label for="sel1">Patient's Firtility Date :</label></div>
         <div class="col-sm-4"> 
         <input type="text" class="form-control" id="fd1" placeholder="from date" name="fd1" value="${pregnancyCalculator.firtilityDate}"></div>
         <div class="col-sm-1 text-center">
          <label for="sel1">to</label></div>
         <div class="col-sm-4"> 
         <input type="text" class="form-control" id="fd2" placeholder="end date" name="fd2" value="${pregnancyCalculator.toFirtilityDate}"></div>
         </div>
         
            <div class="col-sm-12">
        <div class="col-sm-3"> 
        <label for="sel1">Patient's Conception Date :</label></div>
         <div class="col-sm-9"> 
         <input type="text" class="form-control" id="usr" name="cd" value="${pregnancyCalculator.conceptionDate}"></div>
         </div>
         
            <div class="col-sm-12">
        <div class="col-sm-3"> 
        <label for="sel1">First trimister Ends(12 Weeks) :</label></div>
         <div class="col-sm-9"> <input type="text" class="form-control" id="usr" name="fte" value="${pregnancyCalculator.firstTrimisterDate}"></div>
         </div>
         
            <div class="col-sm-12">
        <div class="col-sm-3"> 
        <label for="sel1">Second Trimister Ends(12 Weeks) :</label></div>
         <div class="col-sm-9"> <input type="text" class="form-control" id="usr" name="ste" value="${pregnancyCalculator.secondTrimisterDate}"></div>
         </div>
         
           <div class="col-sm-12">
        <div class="col-sm-3"> <label for="sel1">Patient's Due Date :</label></div>
         <div class="col-sm-4"> <input type="text" class="form-control" id="usr" name="dd" value="${pregnancyCalculator.dueDate}"></div>
        
  		 </div>
  		   <div class="col-sm-12">
        <div class="col-sm-3"> <label for="sel1">Calculated Current date :</label></div>
         <div class="col-sm-4"> <input type="text" class="form-control" id="usr" name="dd" value="${pregnancyCalculator.date}"></div>
        
  		 </div>
  		   <div class="col-sm-12">
        <div class="col-sm-3"> <label for="sel1">Calculated Current time :</label></div>
         <div class="col-sm-4"> <input type="text" class="form-control" id="usr" name="dd" value="${pregnancyCalculator.time}"></div>
        
  		 </div>
  		 </form> 
</div>
	  		  
	
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

</body>
</html>