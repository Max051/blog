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
//= require_tree .
document.addEventListener('DOMContentLoaded', function(){

 let posts_editables =  document.getElementsByClassName("well")
 console.log(posts_editables.length)
    for(var i =0; i<posts_editables.length ;i++){
        console.log('a')
         posts_editables[i].addEventListener("mouseover", function(){
            this.firstChild.nextSibling.classList.remove('none_visable')
        })
          posts_editables[i].addEventListener("mouseleave", function(){
           this.firstChild.nextSibling.classList.add('none_visable')
        })
    }

}, false);

