$(document).ready(function(){

	$('h3.director').click(function()  {
    	$('p.director').toggleClass('hide');
	}); 

	$('h3.actors').click(function()  {
    	$('ul.actors').toggleClass('hide');
	}); 

	$('h3.plot').click(function()  {
    	$('p.plot').toggleClass('hide');
	}); 

	$('h3.runtime').click(function()  {
    	$('p.runtime').toggleClass('hide');
	}); 

	$('h3.rating').click(function()  {
    	$('p.rating').toggleClass('hide');
	}); 

	$('h3.genre').click(function()  {
    	$('p.genre').toggleClass('hide');
	}); 

});