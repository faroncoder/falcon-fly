$(function(data, textStatus) {
    $.getScript("./jsc/js/bootstrap.min.js", function(data, textStatus) {
        console.log("bootstrap.min.js loaded", textStatus);
    });
    $.getScript("./jsc/js/appengine.js", function(data, textStatus) {
        console.log("appengine loaded", textStatus);
    });
}); //end function