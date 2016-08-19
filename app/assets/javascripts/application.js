// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require bootstrap-datepicker
//= require bootstrap-datepicker/locales/bootstrap-datepicker.es.js
//= require_tree .

$(document).ready(function(){
    //Ready for calendar
    $('[data-behaviour~=datepicker]').datepicker({ language: "es" });

});

/*This function is for add options to a select*/
$.fn.addOption = function(optText, optValue){
    var option = new Option(optText, optValue);
    return this.prepend(option);
};

/*For validations*/
function validarText(input,div,p) {
  txt = $(input).val();
  if (txt.length < 3){
    $('#'+div).addClass('field_with_errors');
    $('#'+p).html('*Este campo es requerido y debe ser mayor a dos caracteres');
    $("input[name=commit]").prop( "disabled", true );
  } else if (txt.length > 30){
    $('#'+div).addClass('field_with_errors');
    $('#'+p).html('*Este campo debe ser menor a 30 caracteres');
    $("input[name=commit]").prop( "disabled", true );
  } else {
    if($('#'+div).hasClass('field_with_errors')){
      $('#'+div).removeClass('field_with_errors');
      $('#'+p).html('');
      $("input[name=commit]").prop( "disabled", false );
    }
  }
}

/*For check empty fields in .js files*/
function isEmpty(str){ 
  return !str.replace(/^\s+/g, '').length; // boolean (`true` if field is empty) 
}


