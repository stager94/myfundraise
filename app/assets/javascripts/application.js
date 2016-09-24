//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require tinymce-jquery
//= require icheck
//= require geocomplete

var icheck = function(){
  if($(".icheck-me").length > 0){
    $(".icheck-me").each(function(){
      var $el = $(this);
      var skin = ($el.attr('data-skin') !== undefined) ? "_" + $el.attr('data-skin') : "",
      color = ($el.attr('data-color') !== undefined) ? "-" + $el.attr('data-color') : "";
      var opt = {
        checkboxClass: 'icheckbox' + skin + color,
        radioClass: 'iradio' + skin + color,
      }
      $el.iCheck(opt);
    });
  }
}

var onPageLoad = function() {
  icheck();

  $("[data-autosubmit]").submit();
  $("#geocomplete").geocomplete();

  $("[data-toggle=tooltip]").tooltip();
}


$(function() {
  tinyMCE.init({
    selector: 'textarea.editor',
    menubar: false,
    statusbar: false
  });

  onPageLoad();
});

$(document).on('turbolinks:load', function() {
  onPageLoad();
});
