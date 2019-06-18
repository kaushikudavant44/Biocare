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
                <li><a href="#">Home</a></li>
                <li><a href='${pageContext.request.contextPath}/showStemCellBank'>Stem Cell</a></li>
                <li><a href='${pageContext.request.contextPath}/showPregnancyCalculator'>Pregnancy</a></li>
                 <li><a href='${pageContext.request.contextPath}/showViewStemcellDetails'>View-StemCellStorageDetails</a></li>
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
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class=""></li>
        <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="2" class=""></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <div class="item">
          <img class="first-slide" src="${pageContext.request.contextPath}/resources/images/slider-bg_1.jpg" alt="First slide">
          
        </div>
        <div class="item active">
          <img class="first-slide" src="${pageContext.request.contextPath}/resources/images/slider-bg_1.jpg" alt="First slide">
        </div>
        <div class="item">
           <img class="first-slide" src="${pageContext.request.contextPath}/resources/images/slider-bg_1.jpg" alt="First slide">
        </div>
      </div>
      <a class="left carousel-control" href="" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div><!-- /.carousel -->
	<section id="four-tab">
   	 <div class="container">
     	<!--<h4>WELCOME TO MEDIPULS HEALTH CARE</h4>-->
     	<h3>Pregnancy</h3>
		<div class="row">
        	<div class="col-md-4 col-sm-4  pad-zero">
            		<img src="${pageContext.request.contextPath}/resources/images/img-cap-1-1.jpg" class="img-responsive" id="validation-form" enctype="multipart/form-data">
            </div>
            <div class="col-md-4 col-sm-4 pad-zero">
            	<a href='${pageContext.request.contextPath}/showPregnancyCalculator' method="GET"><div class="stem-topic">
            	<h3>Pregnancy Calculator</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipis cing elit. Nullam id arcu tortor. Sed get sit ame egestasquis</p>
                </div></a>
            </div>
            <div class="col-md-4 col-sm-4 pad-zero">
            <img src="${pageContext.request.contextPath}/resources/images/img-cap-3.jpg" class="img-responsive">
            </div>
            
            <div class="col-md-4 col-sm-4  pad-zero">
            		<div class="stem-topic">
            	<h3>Consectetur adipis cing</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipis cing elit. Nullam id arcu tortor. Sed get sit ame egestasquis</p>
                </div>
            </div>
             <div class="col-md-4 col-sm-4 pad-zero">
            <img src="${pageContext.request.contextPath}/resources/images/img-cap-2.jpg" class="img-responsive">
            </div>
            <div class="col-md-4 col-sm-4 pad-zero">
            	<div class="stem-topic">
            	<h3>Consectetur adipis cing</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipis cing elit. Nullam id arcu tortor. Sed get sit ame egestasquis</p>
                </div>
            </div>
        </div>
      
		</div>
        </section>
        
        <section id="parallax">
        	<div class="container">
            
            <div class="row">
            <div class="col-sm-2"> </div>
            	<div class="col-sm-10">
                <h3>FAQ'S</h3>
                 <div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1"> What is Stem cell ?</a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse in">
        <div class="panel-body"><p>Stem cells are biological cells that can differentiate into other types of stem cells and can divide to produce more of the same type of stem cells. They are found in multicellular organisms.</p>

<p>In mammals, there are two broad types of stem cells: embryonic stem cells, which are isolated from the inner cell mass of blastocysts, and adult stem cells, which are found in various tissues. In adult organisms, stem cells and progenitor cells act as a repair system for the body, replenishing adult tissues. In a developing embryo, stem cells can differentiate into all the specialized cells—ectoderm, endoderm and mesoderm (see induced pluripotent stem cells)—but also maintain the normal turnover of regenerative organs, such as blood, skin, or intestinal tissues.</p>
<hr>
<strong>There are three known accessible sources of autologous adult stem cells in humans:</strong>
<ul class="list">
	<li>Bone marrow, which requires extraction by harvesting, that is, drilling into bone (typically the femur or iliac crest).</li>
	<li>Adipose tissue (fat cells), which requires extraction by liposuction.[citation needed]</li>
	<li>Blood, which requires extraction through apheresis, wherein blood is drawn from the donor (similar to a blood donation), and passed through a machine that extracts the stem cells and returns other portions of the blood to the donor.</li>
</ul>
<p>Stem cells can also be taken from umbilical cord blood just after birth. Of all stem cell types, autologous harvesting involves the least risk. By definition, autologous cells are obtained from one's own body, just as one may bank his or her own blood for elective surgical procedures.</p>
</div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Benefits of Stem Cell Therapy</a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body"><strong>1. Treats Orthopedic Injuries</strong> 
        <p>The type of stem cells being used in the most cutting-edge orthopedic practices are called Mesenchymal stem cells (MSCs). A growing body of research shows that MSCs have the capability of differentiating and forming new orthopedic tissues that make up muscle, bones, cartilage and tendons, ligaments and adipose tissue.</p>
        <hr>
        <strong>2. Can Be Used to Treat Cardiovascular Diseases</strong> 
        <p>Cardiovascular diseases can deprive heart tissue of oxygen and cause scar tissue to form which changes blood flow/blood pressure. Research suggests that stem cells taken from adult bone marrow have the ability to differentiate into those needed to repair the heart and blood vessels, thanks to the secretion of multiple growth factors.</p>
        <hr>
        <strong>3. Helps Heal Wounds and Incisions</strong> 
        <p>Studies have found that stem cell treatments can help improve the growth of healthy new skin tissue, improve collagen production, stimulate hair growth after loss or incisions, and help replace scar tissue with newly formed healthy tissue.</p>
        <hr>
        <strong>4. Treats Neurodegenerative Diseases</strong> 
        <p>Recent progress in the treatment of diseases like Parkinson’s, Huntington’s, Alzheimer’s and stroke recovery show that transplanted adult stem cells can be used to form new brain cells, neurons and synapses following cognitive degeneration or brain injuries..</p>
        </div>
      </div>
    </div>
    
  </div> 
                </div>
                
            </div>
            	
            </div>
        </section>
<section id="video">
     <div class="container">
                <h3>Pregnancy</h3>
                	<div class="row">
                    	<div class="col-md-7 col-sm-7">
                        	<div class="video-blk">
                            	<div class="embed-responsive embed-responsive-16by9">
  <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/zpOULjyy-n8?rel=0" allowfullscreen></iframe>
</div>
                            </div>
                        </div>
                        <div class="col-md-5 col-sm-5">
                        	<div class="colorfull-bg">
                            	<div class="text-center"><img src="${pageContext.request.contextPath}/resources/images/small-logo.png" class="img-center" alt=""></div>
                                <h3>We have the safe and the most trusted doctors around</h3>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas id est sed lacus volutpat lobortis. Lorem ipsum dolor sit amet.</p>
                            </div>
                        </div>
                    </div>
                	
                </div>
            </section>
            
        	
            <!--<section id="contact">
            	<div class="container">
                	<h3>Contact Us Now</h3>
                	<div class="row">
                    	<div class="col-md-4 col-sm-4">
                        	
                        	<div class="contact-blk min-height">
                            	<div class="circle-icon">
                                	<img src="img/phone.png" class="img-responsive" alt="contact">
                                </div>
                            	<h4>Call Now</h4>
                                <p>0123456789 / <br> 07894561230</p>
                            </div>
                           
                        </div>
                        
                        <div class="col-md-4 col-sm-4">
                       
                        	<div class="contact-blk min-height">
                            	<div class="circle-icon">
                                	<img src="img/visit.png" class="img-responsive" alt="contact">
                                </div>
                            
                            	<h4>Visit Our Clinic:</h4>
                                <p>10 Generic Str., South Chicago, IL 60606</p>
                            </div>
                           
                        </div>
                        
                        <div class="col-md-4 col-sm-4">
                        
                        	<div class="contact-blk min-height">
                            	<div class="circle-icon">
                                	<img src="img/send-a-message.png" class="img-responsive" alt="contact">
                                </div>
                            
                            	<h4>Send A Message</h4>
                                <p><a href="mailto:info@example.com">info@example.com</a></p>
                            </div>
                           
                        </div>
                    </div>
                </div>
            </section>-->
        
<footer> <div class="container footer_stem">
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>© 2016 Company, Inc. · <a href="#">Privacy</a> · <a href="#">Terms</a></p>
      </div>
</footer>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/holder.js"></script>
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  <script>
   $('.panel-default').on('show.bs.collapse', function () {
         $(this).addClass('active');
    });

    $('.panel-default').on('hide.bs.collapse', function () {
         $(this).removeClass('active');
    });
</script>

</body>
</html>