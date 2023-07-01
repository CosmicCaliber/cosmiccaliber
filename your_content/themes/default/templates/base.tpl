{# This template is the base for all other templates, meaning that all other templates will be adding to the blocks
   in this template, before they're used to create HTML files. #}
{{ autogenerate_warning|safe }}
<!DOCTYPE html>
<html lang="en" prefix="og: http://ogp.me/ns#">
<head>
    {# If blocks let you check the value of a variable and then generate different HTML depending on that variable.
       The if block below will check if the `google_analytics_id` variable is defined (set in the Python script by
       the "Tracking ID" value of the "Google Analytics" section in the comic_info.ini file). If so, it then
       includes all the text between the `{% if ... %}` and `{% endif %}` blocks. #}
    {%- if google_analytics_id %}
    <!-- Global site tag (gtag.js) - Google Analytics -->
    {# When text is surrounded by {{ these double curly braces }}, it's representing a variable that's passed in by
       the Python script that generates the HTML file. That value is dropped into the existing HTML with no changes.
       For example, if the value passed in to `google_analytics_id` is `UA-123456789-0`, then
       `id={{ google_analytics_id }}` becomes `id=UA-123456789-0` #}
    <script async src="https://www.googletagmanager.com/gtag/js?id={{ google_analytics_id }}"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', '{{ google_analytics_id }}');
    </script>
    {%- endif %}
    {# Naming the blocks like this lets other templates either replace or add onto this block by referencing it by
       name. #}
    {%- block head %}
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="{{ base_dir }}/src/css/advanced_stylesheet.css">
    <link rel="stylesheet" type="text/css" href="{{ base_dir }}/your_content/themes/{{ theme }}/css/stylesheet.css">
    <link rel="icon" href="{{ base_dir }}/favicon.ico" type="image/x-icon" />
    <meta property="og:title" content="{{ comic_title }}" />
    <meta property="og:description" content="{{ comic_description }}" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="{{ comic_url }}/" />
    <meta property="og:image" content="{{ comic_url + '/your_content/images/preview_image.png' }}" />
    <meta property="og:image:width" content="100px" />
    <meta property="og:image:height" content="100px" />
    <title>{{ page_title }} - {{ comic_title }}</title>
    {%- endblock %}
</head>
<body>
{# This is the start of the `body` block. This is where all the visible parts of the website show up. #}
{% block body %}

	<div id="banner" class="banner-container">
		<a id="banner-img-link" href="{{ base_dir }}/">
        <img id="banner-img" alt="banner" src="{{ banner_image }}">
    </a>
	</div>

	<div id="mobile-nav">
	  <input type="checkbox" id="mobile-nav-toggle">
	  <label for="mobile-nav-toggle">&#9776;
	  </label>
	  <div id="mobile-nav-menu">
			{# For loops let you take a list of a values and do something for each of those values. In this case,
			it runs through the list of all the links provided by the [Links Bar] section of your comic_info.ini file,
			and it generates a link for each of them. #}
			{%- for link in links %}
			<a class="link-bar-link" href="{{ link.url }}">{{ link.name }}</a>
			{% if not loop.last %}<span class="link-bar-separator">|</span>{% endif %}
			{%- endfor %}
		</div>
	</div>

    <div id="links-bar" class="desktop-nav">
        {# For loops let you take a list of a values and do something for each of those values. In this case,
        it runs through the list of all the links provided by the [Links Bar] section of your comic_info.ini file,
        and it generates a link for each of them. #}
        {%- for link in links %}
        <a class="link-bar-link" href="{{ link.url }}">{{ link.name }}</a>
        {% if not loop.last %}<span class="link-bar-separator">|</span>{% endif %}
        {%- endfor %}
    </div>
	
	</div id="container">
    {# This is the start of the `content` block. Nothing is here now because other templates are expected to fill it
       in on their own. It will contain everything on a webpage after the links bar and before the
       "Powered by comic_git" footer. #}
    {% block content %}{% endblock %}

    <div id="powered-by">
		<p style="text-align:center"><a href="https://www.patreon.com/BadAspen" target="_blank"><img alt="Patreon Logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Patreon_logo.svg/800px-Patreon_logo.svg.png" style="height:35px; width:35px" /></a>&nbsp;&nbsp;<a href="https://twitter.com/BadAspen" target="_blank"><img alt="Twitter Logo " src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Logo_of_Twitter.svg/292px-Logo_of_Twitter.svg.png" style="height:33px; width:40px" /></a>&nbsp;&nbsp;<a href="https://discord.gg/Bh3uxTak5A"><img alt="Discord Logo" src="https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0a6a49cf127bf92de1e2_icon_clyde_blurple_RGB.png" style="height:30px; width:40px" /></a></p>
        Cosmic Caliber is Powered by <a id="powered-by-link" href="https://ryanvilbrandt.github.io/comic_git">comic_git</a> v{{ version }} © BadAspen | LunarFarms 2022 - Present.</p>
    </div>
</div>
{% endblock %}
</body>
{# This is the start of the `script` block. Most pages don't need any javascript, so by default it's blank, but some
   pages like infinite_scroll.tpl will fill this in with a <script> tag. #}
{% block script %}{% endblock %}
</html>
