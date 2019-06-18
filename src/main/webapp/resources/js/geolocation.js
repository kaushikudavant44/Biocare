 var geocoder;
 var city;
var region;
var country;
 navigator.geolocation=false;
    
  function initialize123() {
	
    geocoder = new google.maps.Geocoder();
    
}
  
  
  if (navigator.geolocation) {
		
	    navigator.geolocation.getCurrentPosition(successFunction, errorFunction);
	} 
	//Get the latitude and the longitude;
	function successFunction(position) {
		geocoder = new google.maps.Geocoder();
	    var lat = position.coords.latitude;
	    var lng = position.coords.longitude;
	    codeLatLng(lat, lng)
	}   

	function errorFunction(){
	 //  alert("Geocoder failed");
	}

  function codeLatLng(lat, lng) {

    var latlng = new google.maps.LatLng(lat, lng);
   
    geocoder.geocode({'latLng': latlng}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
     
	
        if (results[1]) {
        var indice=0;
        for (var j=0; j<results.length; j++)
        {
            if (results[j].types[0]=='locality')
                {
                    indice=j;
                    break;
                }
            }
        
        console.log(results[j]);
        for (var i=0; i<results[j].address_components.length; i++)
            {
                if (results[j].address_components[i].types[0] == "locality") {
                        //this is the object you are looking for City
                        city = results[j].address_components[i];
                    }
                if (results[j].address_components[i].types[0] == "administrative_area_level_1") {
                        //this is the object you are looking for State
                        region = results[j].address_components[i];
                    }
                if (results[j].address_components[i].types[0] == "country") {
                        //this is the object you are looking for
                        country = results[j].address_components[i];
                    }
            }

        document.getElementById("locationCity").value=city.long_name+","+region.long_name+","+country.short_name;
      //  document.getElementById("location").value=city.long_name+","+region.long_name+","+country.short_name;
        } else {
              alert("No results found");
            }
        //}
      } else {
        alert("Geocoder failed due to: " + status);
      }
    });
  }
  
  function getDoctorListPageLocation(){
	  document.getElementById("location").value=city.long_name+","+region.long_name+","+country.short_name;
  }
 function getHomePageLocation(){
	 document.getElementById("locationCity").value=city.long_name+","+region.long_name+","+country.short_name;
 }
  
  