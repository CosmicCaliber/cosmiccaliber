{# This template is the base for all other templates, meaning that all other templates will be adding to the blocks
in this template, before they're used to create HTML files. #}
{{ autogenerate_warning|safe }}
<!DOCTYPE html>
<html lang="en" prefix="og: http://ogp.me/ns#">
<head>
    {%- if google_analytics_id %}
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id={{ google_analytics_id }}"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', '{{ google_analytics_id }}');
</script>
{%- endif %}
{%- block head %}
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
{% block body %}
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<div id="banner" class="banner-container">
    <a id="banner-img-link" href="{{ base_dir }}/">
        <img id="banner-img" alt="banner" src="{{ banner_image }}">
    </a>
</div>

<!-- Hamburger Menu for Mobile -->
<div id="hamburger-menu" class="hamburger">
    Menu
</div>

<div id="links-bar" class="desktop-nav">
    {%- for link in links %}
    <a class="link-bar-link" href="{{ link.url }}">{{ link.name }}</a>
    {% if not loop.last %}<span class="link-bar-separator">|</span>{% endif %}
    {%- endfor %}
</div>

<div id="container">
    {% block content %}{% endblock %}
</div>

<div id="powered-by">
    <p style="text-align:center">
        <a href="https://www.patreon.com/BadAspen" target="_blank"><img alt="Patreon Logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Patreon_logo.svg/800px-Patreon_logo.svg.png" style="height:35px; width:35px" /></a>&nbsp;&nbsp;
        <a href="https://twitter.com/BadAspen" target="_blank"><img alt="Twitter Logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Logo_of_Twitter.svg/292px-Logo_of_Twitter.svg.png" style="height:33px; width:40px" /></a>&nbsp;&nbsp;
        <a href="https://discord.gg/Bh3uxTak5A"><img alt="Discord Logo" src="https://assets-global.website-files.com/6257adef93867e50d84d30e2/636e0a6a49cf127bf92de1e2_icon_clyde_blurple_RGB.png" style="height:30px; width:40px" /></a>
    </p>
    Cosmic Caliber is Powered by <a id="powered-by-link" href="https://ryanvilbrandt.github.io/comic_git">comic_git</a> v{{ version }} © BadAspen | LunarFarms 2022 - Present.
</div>

{% endblock %}
<script src="{{ base_dir }}/your_content/themes/{{ theme }}/js/script.js"></script>
{% block script %}{% endblock %}
</body>
</html>
