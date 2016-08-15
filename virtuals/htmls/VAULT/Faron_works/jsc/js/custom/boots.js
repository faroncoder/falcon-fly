function boot_well(){/* $("<h3>").addClass("well").html("<p>well</p>");*/$("<div>").addClass("well").html("<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed diam eget risus varius blandit sit amet non magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Aenean lacinia bibendum nulla sed consectetur.</p>").appendTo("#bootbody")} function boot_panel_default(){$("<div>").addClass("col-md-3 panel panel-default").append($("<div>").addClass("panel-heading").append($("<h3>").addClass("panel-title").html("<p>Panel Default</p>")).append($("<div>").addClass("panel-body").html("<p>Panel
content</p>"))).appendTo("#bootbody")}function boot_panel_warning(){$("<div>").addClass("col-md-3 panel panel-warning").append($("<div>").addClass("panel-heading").append($("<h3>").addClass("panel-title").html("<p>Panel Warning</p>")).append($("<div>").addClass("panel-body").html("<p>Panel content</p>"))).appendTo("#bootbody")}function boot_panel_primary(){$("<div>").addClass("col-md-3 panel panel-primary").append($("<div>").addClass("panel-heading").append($("<h3>").addClass("panel-title").html("<p>Panel Primary</p>")).append($("<div>").addClass("panel-body").css('color','black').html("<p>Panel content</p>"))).appendTo("#bootbody")}function boot_panel_success(){$("<div>").addClass("col-md-3 panel panel-success").append($("<div>").addClass("panel-heading").append($("<h3>").addClass("panel-title").html("<p>Panel
Success</p>")).append($("<div>").addClass("panel-body").html("<p>Panel
content</p>"))).appendTo("#bootbody")}function boot_panel_info(){$("<div>").addClass("col-md-3 panel panel-info").append($("<div>").addClass("panel-heading").append($("<h3>").addClass("panel-title").html("<p>Panel Info</p>")).append($("<div>").addClass("panel-body").html("<p>Panel content</p>"))).appendTo("#bootbody")}function boot_panel_danger(){$("<div>").addClass("col-md-3 panel panel-danger").append($("<div>").addClass("panel-heading").append($("<h3>").addClass("panel-title").html("<p>Panel Danger</p>")).append($("<div>").addClass("panel-body").html("<p>Panel content</p>"))).appendTo("#bootbody")}

function boot_jambo(){$("<div>").addClass("jumbotron").append($("<h1>").html("Hello, world!")).append($("<p>").html("This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique. <a href=\"#\" class=\"btn btn-primary btn-lg \" role=\"button\">Learn more >> </a>")).appendTo("#bootbody")}

function boot_build() {$('<div>').prepend($("<div>").attr("id","bootfoot").addClass("footer")).prepend($("<div>").attr("id","bootextra").addClass("extra")).prepend($("<div>").attr("id","bootbody").addClass("main")).prepend($("<div>").attr("id","boothead").addClass('navbar navbar-default navbar-fixed-top').attr("role","navigation")).prependTo(document.body)} 
function boot_nav(){$("<div>").append($("<div>").attr("id","navbar-header").addClass("navbar-header").append($("<button>").attr("type","button").addClass("navbar-toggle").attr("data-toggle","collapse").attr("data-target",".navbar-collapse").append($("<span>").addClass("sr-only").text("Toggle navigation")).append($("<span>").addClass("icon-bar")).append($("<span>").addClass("icon-bar")).append($("<span>").addClass("icon-bar"))).append($("<a>").attr("id","sitename").addClass("navbar-brand").attr("href","#").text("Project name"))).append($("<div>").addClass("collapse navbar-collapse").append($("<ul>").addClass("nav navbar-nav").attr("id","bootmenu").append($("<li>").append($("<a>").attr("id","navlink_home").attr("href","#").text("Home"))).append($("<li>").append($("<a>").attr("id","navlink_info").attr("href","#").text("Info"))).append($("<li>").append($("<a>").attr("id","navlink_contact").attr("href"
,"#").text("Contact"))))).appendTo('#boothead')}


function boot_navactive(){
	$(".navbar-nav")
		.find("li")
		.first()
		.addClass("active")
	 $("#bootmenu li a")
	 		.on("click",function(){
	 			$("ul li.active")
	 				.removeClass("active")}
	 			)
	 $(this).closest("li").addClass("active")
}





function boot_contentrow(t,c,n){ 
	$("<div>")
		.addClass("container")
		.append(
			$("<div>")
				.addClass("row")
					.append(
						$("<div>")
							.addClass("page-header")
							.append(
								$("<h1>")
									.html(t)
									.append(
										$("<p>")
											.addClass("lead")
											.html(c)
											)))).appendTo("#"+n+"")} var t=""; var c=""; var n="";

////////////////////////////////////////////////////////////////
//////////REPAIR BELOW
////////////////////////////////////////////////////////////////


var m=""; var n=""; var o="";




/* boot_footend(, 'bootfoot'); */

////////////////////////////////////////////////////////////////
//////////REPAIR ABOVE
////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////
////////// UNTESTED BELOW
////////////////////////////////////////////////////////////////
function boot_tag(cx,xx){ 
$("<div>").addClass("container ").append($("<div>").addClass("row").append(cx)).appendTo("#"+xx+"")} var cx=""; var xx="";
////////////////////////////////////////////////////////////////
////////// UNTESTED ABOVE 
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////// CALLBACK BELOW (working) 
////////////////////////////////////////////////////////////////

boot_build(); // builds templates

boot_nav(); // builds nav bar

boot_navactive(); // builds nav bar active links

var ttop = '&copy; 2012-13 Jumpstart UI.'; 
var tbtm = 'Theme by <a href="http://jumpstartui.com" target="_blank">Jumpstart UI</a>';
boot_extras(ttop, tbtm,'footer'); // builds set of footer

// templating new row with customized feeds

var gf ="New Faron Title"; 
var gc ="Very interesting thing has happend....blah....blah...";
boot_contentrow(gf,gc,'bootbody');

////////////////////////////////////////////////////////////////
////////// CALLBACK ABOVE (working) 
////////////////////////////////////////////////////////////////

boot_jambo();
boot_well();
boot_panel_default();
boot_panel_warning();
boot_panel_success();
boot_panel_info();
boot_panel_primary();
boot_panel_danger();
