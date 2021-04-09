{{element_name}}
{{element_name_underline}}

``{{path}}{{element_name}}``

This is the reference page for the XML element ``{{element_name}}``. {% if see_also %}See also the relevant overview page{% if see_also|count > 1%}s{%endif%}: {% for page in see_also %}:doc:`{{page}}`{% if not loop.last %}, {% endif %} {% endfor %}{% endif %}

.. index::
  single: {{element_name}}

Definition
~~~~~~~~~~

{{schema_documentation}}

{% if has_rules %}
Rules
~~~~~
{% for extended_type in extended_types %}
The text in this element must be of type {{extended_type}}.
{% endfor %}

{% if element.get('type') and element.get('type').startswith('xsd:') %}The text in this element must be of type {{element.get('type')}}.
{% endif %}

{% if min_occurs > 0 %}
The schema states that this element must have at least {{min_occurs}} subelement{% if min_occurs > 1 %}s{% endif %}.
{% endif %}

{% if minOccurs and maxOccurs %}
{% if minOccurs=='1' and maxOccurs=='1' %}
This element must occur once and only once (within each parent element).
{% elif minOccurs=='0' and maxOccurs=='1' %}
This element must occur no more than once (within each parent element).
{% elif minOccurs=='0' and maxOccurs=='unbounded' %}
This element may occur any number of times.
{% elif minOccurs=='1' and maxOccurs=='unbounded' %}
This element must occur at least once (within each parent element).
{% else %}
This element must occur {{minOccurs}} to {{maxOccurs}} times.
{% endif %}
{% endif %}

{% set rtext = ruleset_text(path+element_name) %}
{% if rtext %}


{{'\n\n'.join(rtext)}}

{% endif %}
{% endif %}

{% if attributes %}
Attributes
~~~~~~~~~~

{% for attribute, attribute_type, text, required in attributes %}
.. _{{path_to_ref(path+element_name+'/@'+attribute)}}:

@{{attribute}}
  {{ textwrap.dedent(text).strip().replace('\n','\n  ') }}
{% if required %}
  This attribute is required.

{% endif %}{% set codelist_tuples = match_codelists(path+element_name+'/@'+attribute) %}{% if attribute_type %}

  This value must be of type {{attribute_type}}.

{% endif %}{% for codelist_tuple in codelist_tuples %}
  This value {% if codelist_tuple[0]|is_complete_codelist() %}must{% else %}should{% endif %} be on the :doc:`{{codelist_tuple[0]}} codelist </codelists/{{codelist_tuple[0]}}>`{% if codelist_tuple[1] %}, if the relevant vocabulary is used{% endif %}.

{% endfor %}

  {{ '\n\n  '.join(ruleset_text(path+element_name+'/@'+attribute)) }}

{% endfor %}

{% endif %}

{{extra_docs}}

Developer tools
~~~~~~~~~~~~~~~

Find the source of this documentation on github:

* `Schema <{{github_urls.schema}}>`_
* `Extra Documentation <{{github_urls.extra_documentation}}>`_

{% if childnames %}
Subelements
~~~~~~~~~~~

.. toctree::
   :titlesonly:
   :maxdepth: 1

{% for childname in childnames %}   {{element_name}}/{{childname}}
{%endfor%}
{% endif %}
