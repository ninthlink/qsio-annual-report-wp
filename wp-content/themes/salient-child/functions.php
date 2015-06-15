<?php 

add_action( 'wp_enqueue_scripts', 'theme_enqueue_styles' );
function theme_enqueue_styles(){
	wp_enqueue_style( 'parent-style', get_template_directory_uri() . '/style.css' );
	wp_enqueue_style( 'child-style', 
		get_stylesheet_directory_uri() . '/style.css', array('parent_style')
	);
	wp_enqueue_style( 'qfont', get_stylesheet_directory_uri() . '/font/stylesheet.css');

	wp_enqueue_script( 'navdots', get_stylesheet_directory_uri() . '/js/navdots.js', array(), '1.0.0');
}

?>