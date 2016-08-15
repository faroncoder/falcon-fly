//file for link active via mouse clicking//

function boot_navactive(){
$('.navbar-nav')
	.find('li')
	.first()
	.addClass('active');

$('#bootmenu li a')
	.on('click', function() { 
			$('ul li.active')
				.removeClass('active');
    		$(this).closest('li')
    			.addClass('active');
});
}

boot_navactive();
//TODO: implment the function for link active indicator//