function getBathValue() {
    var uibathroom = document.getElementsByName("uibathroom");
    for(var i in uibathroom) {
      if(uibathroom[i].checked) {
          return parseInt(i)+1;
      }
    }
    return -1; // Invalid Value
  }

  
  
  function getroomValue() {
    var uiroom = document.getElementsByName("uiroom");
    for(var i in uiroom) {
      if(uiroom[i].checked) {
          return parseInt(i)+1;
      }
    }
    return -1; // Invalid Value
  }
  


  function getgarageValue(){
    var uigarage = document.getElementsByName("uigarage");
    for(var i in uigarage) {
        if(uigarage[i].checked) {
            return parseInt(i)+1;
        }
    }

  }

  function getgardenValue(){
    var uigarden = document.getElementsByName("uigarden");
    for(var i in uigarden) {
        if(uigarden[i].checked) {
            return parseInt(i)+1;
        }
    }

  }

  function getpoolValue(){
    var uipool = document.getElementsByName("uipool");
    for(var i in uipool) {
        if(uipool[i].checked) {
            return parseInt(i)+1;
        }
    }

  }

  function getfurnishedValue(){
    var uifurnished = document.getElementsByName("uifurnished");
    for(var i in uifurnished) {
        if(uifurnished[i].checked) {
            return parseInt(i)+1;
        }
    }

  }

  function getequippedkitchenValue(){
    var uiuiequipped_kitchen = document.getElementsByName("uiuiequipped_kitchen");
    for(var i in uiuiequipped_kitchen) {
        if(uiuiequipped_kitchen[i].checked) {
            return parseInt(i)+1;
        }
    }

  }

  function getCentralHeatingValue(){
    var uicentral_healting = document.getElementsByName("uicentral_healting");
    for(var i in uicentral_healting) {
        if(uicentral_healting[i].checked) {
            return parseInt(i)+1;
        }
    }

  }

  function getAirConditioningValue(){
    var uiair_conditioning = document.getElementsByName("uiair_conditioning");
    for(var i in uiair_conditioning) {
        if(uiair_conditioning[i].checked) {
            return parseInt(i)+1;
        }
    }

  }



  function onClickedEstimatePrice() {
    console.log("Estimate price button clicked");
    var area = document.getElementById("uiarea");
    var room = getroomValue();
    var bathroom = getBathValue();
    var governorate = document.getElementById("uigovernorate");
    var garge = getgarageValue();
    var garden = getgardenValue();
    var pool = getpoolValue();
    var furnished = getfurnishedValue();
    var equipped_kitchen = getequippedkitchenValue();
    var central_heating = getCentralHeatingValue();
    var air_conditioning = getAirConditioningValue();