{% extends '_layout.swig' %}
{% import '_macro/post-collapse.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}{{ title }}{%- if theme.index_with_subtitle and subtitle %} - {{ subtitle }}{%- endif %}{% endblock %}
{#默认#}
{% block content %}
  <div id="posts" class="posts-expand">
    {%- for post in page.posts %}
      {{ partial('_macro/post.swig', {is_index: true}) }}
    {%- endfor %}
  </div>

  {% include '_partials/pagination.swig' %}
{% endblock %}

{#归档
{% block content %}
  <div class="post-block archive">
    <div id="posts" class="posts-collapse">

      {%- if theme.cheers %}
      <div class="collection-title">
        {%- set cheers %}
        {%- set posts_length = site.posts.length %}
        {%- if posts_length > 210 %} {%- set cheers = 'excellent' %}
          {% elif posts_length > 130 %} {%- set cheers = 'great' %}
          {% elif posts_length > 80 %} {%- set cheers = 'good' %}
          {% elif posts_length > 50 %} {%- set cheers = 'nice' %}
          {% elif posts_length > 30 %} {%- set cheers = 'ok' %}
        {% else %}
          {%- set cheers = 'um' %}
        {%- endif %}
        <span class="collection-header">{{ __('cheers.' + cheers) }}! {{ _p("counter.archive_posts", site.posts.length) }} {{ __('keep_on') }}</span>
      </div>
      {%- endif %}

      {{ post_template.render(page.posts) }}

    </div>
  </div>

  {% include '_partials/pagination.swig' %}

{% endblock %}
#}

{# 自定义
{% block content %}
  <div id="posts" class="posts-expand">
    
    <div class="post-block page">
      {% include '_partials/page/page-header.swig' %}

      <div class="post-body{%- if page.direction and page.direction.toLowerCase() === 'rtl' %} rtl{%- endif %}">
          <h2> Welcome to Yanjiu Lab ... </h2>
          
          <blockquote class="blockquote-center"> 
          <p>不闻不若闻之，闻之不若见之，见之不若知之，知之不若行之。
          学至于行之而止矣。行之，明也。<br>-- 荀子</p>
          </blockquote>
          <p><b>I hear and I forget.</b></p>
          <img src="/images/confucius_hear.png"  alt="hear" />
          <p><b>I see and I remember.</b></p>
          <img src="/images/confucius_see.png"  alt="see" />
          <p><b>I do and I understand.</b></p>
          <img src="/images/confucius_do.png"  alt="do" />
      </div>
    </div>
    {% include '_partials/page/breadcrumb.swig' %}
  </div>
{% endblock %}
#}


{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
