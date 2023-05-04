function onClickedEstimatePrice() {
    
    var governorate = document.getElementById("uigovernorate").value;

    var area = document.getElementById("uiarea").value;
  
    var room = document.getElementById("uiroom").value;
  
    var bathroom = document.getElementById("uibathroom").value;
  
    
    var garage = document.getElementById("uigarage").checked ? 1 : 0;
    var garden = document.getElementById("uigarden").checked ? 1 : 0;
    var pool = document.getElementById("uipool").checked ? 1 : 0;
    var furnished = document.getElementById("uifurnished").checked ? 1 : 0;
    var equipped_kitchen = document.getElementById("uiequipped_kitchen").checked ? 1 : 0;
    var central_heating = document.getElementById("uicentral_healting").checked ? 1 : 0;
    var air_conditioning = document.getElementById("uiair_conditioning").checked ? 1 : 0;

  
    // Afficher toutes les valeurs dans la console
    console.log(governorate);
    console.log(area);
    console.log(room);
    console.log(bathroom);
    console.log(garage);
    console.log(garden);
    console.log(pool);
    console.log(furnished);
    console.log(equipped_kitchen);
    console.log(central_heating);
    console.log(air_conditioning);

    var estPrice = document.getElementById("uiEstimatedPrice");
  
    var url = "http://127.0.0.1:5000/predict_home_price"; 
    // var url = "/api/predict_home_price"; // method with ngnix
  
    $.post(url, {
        area: parseFloat(area),
        room: room,
        bathroom: bathroom,
        governorate: governorate,
        garage : garage,
        garden : garden,
        pool: pool,
        furnished: furnished,
        equipped_kitchen:equipped_kitchen,
        central_heating: central_heating,
        air_conditioning: air_conditioning
    }, function(data, status) {
        console.log(data);
        if (data && data.estimated_price) {
            estPrice.innerHTML = "<h2>" + data.estimated_price.toString() + " TND</h2>";
        } else {
            estPrice.innerHTML = "<h2>Error: estimated price not available</h2>";
        }
        console.log(status);
    });
    
  }
  
  function onPageLoad() {
    console.log( "document loaded" );
    var url = "http://127.0.0.1:5000/get_governorate_names"; 
    // var url = "/api/get_governorate_names"; 
    $.get(url,function(data, status) {
        console.log("got response for get_governorate_names request");
        if(data) {
            var governorate = data.governorate;
            var uigovernorate = document.getElementById("uigovernorate");
            $('#uigovernorate').empty();
            for(var i in governorate) {
                var opt = new Option(governorate[i]);
                $('#uigovernorate').append(opt);
            }
        }
    });
  }
  
  window.onload = onPageLoad;