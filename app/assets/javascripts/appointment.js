var today = new Date().toISOString().split('T')[0];
$(document).ready(function(){
    $('.selectpicker').selectpicker();
    document.getElementsByName("schedule")[0].setAttribute('min', today);
  })
