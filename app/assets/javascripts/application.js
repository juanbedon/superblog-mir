// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require tether
//= require rails-ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

document.addEventListener("turbolinks:load", function() {
	tinymce.remove();
	tinymce.init({
		height: '400',
		selector: 'textarea#post_body',
		plugins: 'codesample image media link code textpattern',
		textpattern_patterns: [
    	{start: '*', end: '*', format: 'italic'},
     	{start: '**', end: '**', format: 'bold'},
     	{start: '#', format: 'h1'},
	    {start: '##', format: 'h2'},
      {start: '###', format: 'h3'},
      {start: '####', format: 'h4'},
      {start: '#####', format: 'h5'},
      {start: '######', format: 'h6'},
      {start: '1. ', cmd: 'InsertOrderedList'},
      {start: '* ', cmd: 'InsertUnorderedList'},
      {start: '- ', cmd: 'InsertUnorderedList'}
    ],
		toolbar: 'undo redo | styleselect | bold italic link | codesample image media | code'
	});
});