var extra1 = 
$('<div>')
	.addClass('col-xs-6 col-sm-6 col-md-3')
	.append(
		$('<h4>').html("<h4>About</h4>"))
	.append(
		$("<ul>")
			.append(
				$("<li>")
				.html("<a href='#'>About Us</a>"))
			.append(
				$("<li>")
				.html("<a href='#'>Tweeter</a>"))
			.append(
				$("<li>")
				.html("<a href='#'>Facebook</a>"))
			.append(
				$("<li>")
				.html("<a href='#'>Google+</a>"))
	);


var extra2 = 
$('<div>')
	.addClass('col-xs-6 col-sm-6 col-md-3')
	.append(
		$('<h4>').html("<h4>Support</h4>"))
	.append(
		$("<ul>")
			.append(
				$("<li>")
				.html("<a href='#'>FAQ</a>"))
			.append(
				$("<li>")
				.html("<a href='#'>Video Tutorial</a>"))
			.append(
				$("<li>")
				.html("<a href='#'>Feedback</a>"))
			.append(
				$("<li>")
				.html("<a href='#'>Inquiries</a>"))
	);

var extra3 = 
$('<div>')
	.addClass('col-xs-6 col-sm-6 col-md-3')
	.append(
		$('<h4>').html("<h4>Legal</h4>"))
	.append(
		$("<ul>")
			.append(
				$("<li>")
				.html("<a href='#'>License</a></li>"))
			.append(
				$("<li>")
				.html("<a href='#'>Privacy</a>"))
			.append(
				$("<li>")
				.html("<a href='#'>Terms of Use</a>"))
			.append(
				$("<li>")
				.html("<a href='#'>Condition of Service</a>"))
	);
	
var extra4 = 
$('<div>')
	.addClass('col-xs-6 col-sm-6 col-md-3')
	.append(
		$('<h4>').html("<h4>Setting</h4>"))
	.append(
		$("<ul>")
			.append(
				$("<li>")
				.html("<a href='#'>Consectetur</a></li>"))
			.append(
				$("<li>")
				.html("<a href='#'>Eiusmod</a>"))
			.append(
				$("<li>")
				.html("<a href='#'>Fugiat</a>"))
			.append(
				$("<li>")
				.html("<a href='#'>Officia</a>"))
	);

function boot_extras(m,n,nx){ 
$("<div>")
	.addClass("container ")
	.append(
		$("<div>")
				.addClass("row")
					.append(
						$("<div>")
							.append(extra1)
							.append(extra2)
							.append(extra3)
							.append(extra4)
					)
					.append(
						$("<div>")
						.addClass("footer")
						.append(
							$("<div>")
								.attr("id","copyright")
								.addClass("col-xs-12 col-sm-6 col-md-3")
								.html(m)
						)
						.append(
							$("<div>")
								.attr("id","footer-terms")
								.addClass("col-xs-12 col-sm-6 col-md-3")
								.html(n)
						)
					)
	)
	.appendTo("#"+nx+"")} var nx=""; var m=""; var n="";

var ttop = '&copy; 2014 ~ Faron.'; 
var tbtm = 'Site engineered by Faron';
boot_extras(ttop, tbtm,'footer'); // builds set of footer