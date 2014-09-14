#encoding: utf-8

require 'erb'

require_relative 'generator_input'

template = 
%Q{<?xml version="1.0" encoding="UTF-8" ?>
<Module>

<ModulePrefs title="Hangout Starter">
  <Require feature="rpc" />
</ModulePrefs>

<Content type="html"><![CDATA[

<html>

<head>
<link href="//ruby-dev-intro.herokuapp.com/slideshow.css" rel="stylesheet" media="screen"/>
<style>
<%= STYLE %>
#attendee_name {
  display: none;
}
</style>   
</head>

<body>

<script src="//plus.google.com/hangouts/_/api/v1/hangout.js"></script>

<div class="presentation">

<% SLIDES.each do |slide| %>
<div class="slide">
  <% if slide[:Subtitle] then %><h1><%= TITLE %></h1><% end %>
  <% if slide[:Subtitle] then %><h2><%= slide[:Subtitle] %></h2><% end %>
  <section style="font-size:2em;">
    <% slide[:Section].each do |text| %>	    
    <%= text %>
    <% end %>
  </section>		    
</div>
<% end %>

<!--   #####  LAST SLIDE : CODING SLIDE   ##### -->

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

<div class="code_author"><span id="last_send_attendee_name">+</span><span id="author_name">#</span></div>

<input type="button" id="execute" value="RUN (ALT-R)" disabled>
<input type="button" id="send_code" value="RUN & SEND (ALT-S)" disabled>
<input type="button" id="get_code" value="GET & RUN (ALT-G)" disabled>

<textarea class="code_result" id="code_output" readonly></textarea>

</section>

</div>  

</div> <!--presentation-->

<script src="//ruby-dev-intro.herokuapp.com/common.js"></script>
<script src="//ruby-dev-intro.herokuapp.com/slides.js"></script>
<script src="//ruby-dev-intro.herokuapp.com/slideshow.js"></script>

<script src="//ruby-dev-intro.herokuapp.com/ace-builds/src-min-noconflict/ace.js" type="text/javascript" charset="utf-8"></script>
<%= EDITOR_CONFIG %>

<%= PREVENT_DEFAULT_KEYS %>

<script>
SERVER_PATH = '//ruby-dev-intro.herokuapp.com'
code_editor.setReadOnly(true);
</script>

<script src="//ruby-dev-intro.herokuapp.com/slideshow-blackboard.js"></script>



</body>
</html>

]]>
</Content>
</Module>

}

puts ERB.new(template).result()
