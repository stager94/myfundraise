//= require jquery
//= require jquery_ujs
//= require jquery.jcrop
//= require bootstrap-sprockets
//= require tinymce-jquery
//= require tinymce/plugin.placeholder
//= require icheck
//= require geocomplete
//= require home
//= require selectize
//= require campaigns
//= require twitter/typeahead
//= require select2-full
//= require currency_selector
//= require campaigns_crop
//= require page
//= require Chart.bundle
//= require chartkick
//= require campaign_updates
//= require share

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
    statusbar: false,
    plugins: ['placeholder', 'uploadimage', 'textcolor'],
    toolbar: "forecolor,fontsizeselect,|,bold,italic,|,uploadimage,|,alignleft,aligncenter,alignright,alignjustify,|,bullist,numlist"
  });

  onPageLoad();
});

$(document).on('turbolinks:load', function() {
  onPageLoad();
});
