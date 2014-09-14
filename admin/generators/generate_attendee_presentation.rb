#encoding: utf-8

require 'erb'

require_relative 'generator_input'

template = 
%Q{<html>
<head>
<link href="slideshow.css" rel="stylesheet" media="screen"/>
<style>
<%= STYLE %>
</style>   
</head>
<body>

<div class="presentation">

<div class="slide" id="coding">

<section>

<div class="code" id="code_input"></div>

<% SLIDES.each do |slide| %>
<div class="code_helper">
<% if slide[:Subtitle] then %><h2><center><%= slide[:Subtitle] %></center></h2><% end %>
<% slide_text = slide[:Helper] || slide[:Section] %>
<% slide_text.each do |text| %>
<%= text %>	
<% end %>

</div>
<%end %>

<div class="code_author"><span id="author_name">#</span></div>

<input type="button" id="execute" value="RUN (ALT-R)">
<input type="button" id="send_code" value="RUN & SEND (ALT-S)">
<input type="button" id="get_code" value="GET & RUN (ALT-G)">

<textarea class="code_result" id="code_output" readonly></textarea>

</section>

</div>  

</div> <!--presentation-->


<script src="common.js"></script>
<script src="slides.js"></script>
<script src="slideshow.js"></script>

<script src="ace-builds/src-min-noconflict/ace.js" type="text/javascript" charset="utf-8"></script>
<%= EDITOR_CONFIG %>

<%= PREVENT_DEFAULT_KEYS %>

<script src="slideshow-attendee.js"></script>



</body>
</html>
}

puts ERB.new(template).result()
