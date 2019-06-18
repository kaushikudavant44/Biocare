<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>

<head>
<title>DICOM Web Viewer</title>
<meta charset="UTF-8">
<meta name="description" content="Medical viewer using DWV (DICOM Web Viewer) and jQery Mobile.">
<meta name="keywords" content="DICOM,HTML5,JavaScript,medical,imaging,DWV">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<meta name="theme-color" content="#2F3BA2"/>
<link rel="manifest" href="resources/manifest.json">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/dcm/css/style.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/dcm/ext/jquery-mobile/jquery.mobile-1.4.5.min.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/dcm/node_modules/nprogress/nprogress.css" />
<style type="text/css" >
.ui-popup .ui-controlgroup { background-color: #252525; }
.colourLi > .ui-input-text { text-align: center; }
.colourLi > .ui-input-text input { min-height: 2em; width: 7em; display:inline-block }
.lwColourLi > .ui-input-text { text-align: center; }
.lwColourLi > .ui-input-text input { min-height: 2em; width: 7em; display:inline-block }
.ffColourLi > .ui-input-text { text-align: center; }
.ffColourLi > .ui-input-text input { min-height: 2em; width: 7em; display:inline-block }
/* jquery-mobile strip not visible enough */
.table-stripe tbody tr:nth-child(odd) td,
.table-stripe tbody tr:nth-child(odd) th {
  background-color: #eeeeee; /* non-RGBA fallback  */
  background-color: rgba(0,0,0,0.1);
}
</style>
<!-- mobile web app -->
<meta name="mobile-web-app-capable" content="yes" />
<link rel="shortcut icon" sizes="16x16" href="${pageContext.request.contextPath}/resources/dcm/resources/icons/dwv-16.png" />
<link rel="shortcut icon" sizes="32x32" href="${pageContext.request.contextPath}/resources/dcm/resources/icons/dwv-32.png" />
<link rel="shortcut icon" sizes="64x64" href="${pageContext.request.contextPath}/resources/dcm/resources/icons/dwv-64.png" />
<link rel="shortcut icon" sizes="128x128" href="${pageContext.request.contextPath}/resources/dcm/resources/icons/dwv-128.png" />
<link rel="shortcut icon" sizes="256x256" href="${pageContext.request.contextPath}/resources/dcm/resources/icons/dwv-256.png" />
<!-- apple specific -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<link rel="apple-touch-icon" sizes="16x16" href="${pageContext.request.contextPath}/resources/dcm/resources/icons/dwv-16.png" />
<link rel="apple-touch-icon" sizes="32x32" href="${pageContext.request.contextPath}/resources/dcm/resources/icons/dwv-32.png" />
<link rel="apple-touch-icon" sizes="64x64" href="${pageContext.request.contextPath}/resources/dcm/resources/icons/dwv-64.png" />
<link rel="apple-touch-icon" sizes="128x128" href="${pageContext.request.contextPath}/resources/dcm/resources/icons/dwv-128.png" />
<link rel="apple-touch-icon" sizes="256x256" href="${pageContext.request.contextPath}/resources/dcm/resources/icons/dwv-256.png" />
<!-- Third party (dwv) -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/node_modules/i18next/i18next.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/node_modules/i18next-xhr-backend/i18nextXHRBackend.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/node_modules/i18next-browser-languagedetector/i18nextBrowserLanguageDetector.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/node_modules/jszip/dist/jszip.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/node_modules/konva/konva.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/node_modules/magic-wand-js/js/magic-wand-min.js"></script>
<!-- Third party (viewer) -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/node_modules/jquery/dist/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/ext/jquery-mobile/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/node_modules/nprogress/nprogress.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/ext/flot/jquery.flot.min.js"></script>
<!-- decoders -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/node_modules/dwv/decoders/pdfjs/jpx.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/node_modules/dwv/decoders/pdfjs/util.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/node_modules/dwv/decoders/pdfjs/arithmetic_decoder.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/node_modules/dwv/decoders/pdfjs/jpg.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/node_modules/dwv/decoders/rii-mango/lossless-min.js"></script>
<!-- dwv -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/node_modules/dwv/dist/dwv.min.js"></script>

<!-- Google -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/ext/google-api-javascript-client/client.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/ext/google-api-javascript-client/api.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/src/google.js"></script>

<!-- Dropbox -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/ext/dropbox-dropins/dropins.js"
    id="dropboxjs" data-app-key="96u3396jtx3bwr8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/src/dropbox.js"></script>

<!-- Launch the app -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/src/register-sw.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/src/appgui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/dcm/src/applauncher.js"></script>
</head>

<body>

<!-- Main page -->
<div data-role="page" data-theme="b" id="main">

<!-- pageHeader #dwvversion -->
<div id="pageHeader" data-role="header" data-position="fixed">
<h1>DWV <span class="dwv-version"></span></h1>
<a href="#help_page" data-icon="carat-r" class="ui-btn-right"
  data-transition="slide" data-i18n="basics.help">Help</a>
</div><!-- /pageHeader -->

<!-- DWV -->
<div id="dwv">

<div id="pageMain" data-role="content" style="padding:2px;">

<!-- Toolbar -->
<div class="toolbar"></div>

<!-- Auth popup -->
<div data-role="popup" id="popupAuth">
<a href="#" data-rel="back" data-role="button" data-icon="delete"
  data-iconpos="notext" class="ui-btn-right" data-i18n="basics.close">Close</a>
<div style="padding:10px 20px;">
<h3 data-i18n="io.GoogleDrive.auth.title">Google Drive Authorization</h3>
<p data-i18n="io.GoogleDrive.auth.body">Please authorize DWV to access your Google Drive.
<br>This is only needed the first time you connect.</p>
<button id="gauth-button" class="ui-btn" data-i18n="io.GoogleDrive.auth.button">Authorize</button>
</div>
</div><!-- /popup -->

<!-- Open popup -->
<div data-role="popup" id="popupOpen">
<a href="#" data-rel="back" data-role="button" data-icon="delete"
  data-iconpos="notext" class="ui-btn-right" data-i18n="basics.close">Close</a>
<div style="padding:10px 20px;">
<h3 data-i18n="basics.open">Open</h3>
<div id="dwv-loaderlist"></div>
</div>
</div><!-- /popup -->

<!-- Layer Container -->
<div class="layerContainer">
<div class="dropBox"></div>
<canvas class="imageLayer">Only for HTML5 compatible browsers...</canvas>
<div class="drawDiv"></div>
<div class="infoLayer">
<div class="infotl info"></div>
<div class="infotc infoc"></div>
<div class="infotr info"></div>
<div class="infocl infoc"></div>
<div class="infocr infoc"></div>
<div class="infobl info"></div>
<div class="infobc infoc"></div>
<div class="infobr info"></div>
</div><!-- /infoLayer -->
</div><!-- /layerContainer -->

<!-- History -->
<div class="history" title="History" style="display:none;"></div>

</div><!-- /content -->

<div data-role="footer" data-position="fixed">
<div data-role="navbar" class="toolList">
</div><!-- /navbar -->
</div><!-- /footer -->

</div><!-- /page main -->

</div><!-- /dwv -->

<!-- Tags page -->
<div data-role="page" data-theme="b" id="tags_page">

<div data-role="header">
<a href="#main" data-icon="back" data-transition="slide"
  data-direction="reverse" data-i18n="basics.back">Back</a>
<h1 data-i18n="basics.dicomTags">DICOM Tags</h1>
</div><!-- /header -->

<div data-role="content">
<!-- Tags -->
<div id="dwv-tags" title="Tags"></div>
</div><!-- /content -->

</div><!-- /page tags_page-->

<!-- Draw list page -->
<div data-role="page" data-theme="b" id="drawList_page">

<div data-role="header">
<a href="#main" data-icon="back" data-transition="slide"
  data-direction="reverse" data-i18n="basics.back">Back</a>
<h1 data-i18n="basics.drawList">Draw list</h1>
</div><!-- /header -->

<div data-role="content">
<!-- DrawList -->
<div id="dwv-drawList" title="Draw list"></div>
</div><!-- /content -->

</div><!-- /page draw-list_page-->


<!-- Help page -->
<div data-role="page" data-theme="b" id="help_page">

<div data-role="header">
<a href="#main" data-icon="back" data-transition="slide"
  data-direction="reverse" data-i18n="basics.back">Back</a>
<h1 data-i18n="basics.help">Help</h1>
</div><!-- /header -->

<div data-role="content">
<!-- Help -->
<div id="dwv-help" title="Help"></div>
</div><!-- /content -->

</div><!-- /page help_page-->

</body>
</html>

