function notify(tipo){

    var notify = document.querySelector('.notify');
    var content = document.getElementById("notifyType");

    if(tipo == "sucess"){
        notify.classList.toggle('.active');
        content.classList.toggle('.sucess');
    }

    if(tipo == "error"){

    }
}

/* $("#success").click(function () {
    $(".notify").toggleClass("active");
    $("#notifyType").toggleClass("success");
    
    setTimeout(function(){
      $(".notify").removeClass("active");
      $("#notifyType").removeClass("success");
    },2000);
  });
  
  $("#failure").click(function () {
    $(".notify").addClass("active");
    $("#notifyType").addClass("failure");
    
    setTimeout(function(){
      $(".notify").removeClass("active");
      $("#notifyType").removeClass("failure");
    },2000);
}); */