 <div class="navbar-wrapper stemcells_nav">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/resources/images/logo.jpg" class="img-responsive" alt="logo"></a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/showPatientHomePage">Home</a></li>
                <%-- <li><a href='${pageContext.request.contextPath}/showViewPregnancyDate'>View Pregnanacy Caculator</a></li> --%>
               <%--  <li><a href='${pageContext.request.contextPath}/getBabyVacination'> View Vaccination</a></li>
                <li><a href='${pageContext.request.contextPath}/showBabyVaxination'>Show Vaccination</a></li> --%>
                <li><a href="#">About</a></li>
                <!--<li class="dropdown">
                  <a href="https://getbootstrap.com/docs/3.3/examples/carousel/#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="https://getbootstrap.com/docs/3.3/examples/carousel/#">Action</a></li>
                    <li><a href="https://getbootstrap.com/docs/3.3/examples/carousel/#">Another action</a></li>
                    <li><a href="https://getbootstrap.com/docs/3.3/examples/carousel/#">Something else here</a></li>
                    <li role="separator" class="divider"></li>
                    <li class="dropdown-header">Nav header</li>
                    <li><a href="https://getbootstrap.com/docs/3.3/examples/carousel/#">Separated link</a></li>
                    <li><a href="https://getbootstrap.com/docs/3.3/examples/carousel/#">One more separated link</a></li>
                  </ul>
                </li>-->
              </ul>
            </div>
          </div>
        </nav>

      </div>
    </div>
<!-- Carousel
================================================== -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<div class="carousel-inner inner_pg" role="listbox">
        <div class="item active">
          <img class="first-slide" src="${pageContext.request.contextPath}/resources/images/inn_bnr.jpg" alt="First slide">
        </div>
      </div>
    </div><!-- /.carousel -->