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
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
    $(".button").click(function(e){
        $.ajax({
            url: "posts.json",
            type: "POST",
            data: {colID: e.target.id}, //this sends the user-id to php as a post variable, in php it can be accessed as $_POST['uid']
            success: function(data){
                data = JSON.parse(data);
                //update some fields with the updated data
                //you can access the data like 'data["driver"]'
            }
        });
    });
});
