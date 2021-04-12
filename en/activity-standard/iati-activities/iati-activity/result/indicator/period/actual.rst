actual
======

``iati-activities/iati-activity/result/indicator/period/actual``

This is the reference page for the XML element ``actual``. 

.. index::
  single: actual

Definition
~~~~~~~~~~


A record of the achieved result for this period.



Rules
~~~~~








This element may occur any number of times.








Attributes
~~~~~~~~~~


.. _iati-activities/iati-activity/result/indicator/period/actual/.value:

@value
  The actual measure.
  
  The @value should be omitted for qualitative measures.
  
  The @value must be included for non-qualitative measures.
  
  The @value should be a valid number for all non-qualitative measures.


  This value must be of type xsd:string.



  





Example Usage
~~~~~~~~~~~~~
Example usage of ``actual`` within ``period``, in context of an ``indicator`` in a ``result`` element.

| The ``@value`` attribute declares an example value of *11*

.. literalinclude:: ../../../../../activity-standard-example-annotated.xml
	:language: xml
	:start-after: <!--result-period starts-->
	:end-before: <!--result-period ends-->

Changelog
~~~~~~~~~

2.03

The ``actual`` element of a ``period`` in an ``indicator`` in a ``result`` element can be reported multiple times `added <https://discuss.iatistandard.org/t/results-allow-disaggregations-of-results-data-included-2-03/871>`__.

The attribute ``@value`` was made optional and rules for its use `added <https://discuss.iatistandard.org/t/results-represent-more-than-quantitative-data-included-2-03/872>`__.


Developer tools
~~~~~~~~~~~~~~~

Find the source of this documentation on github:

* `Schema <https://github.com/IATI/IATI-Schemas/blob/version-2.03/iati-activities-schema.xsd#L1878>`_
* `Extra Documentation <https://github.com/IATI/IATI-Extra-Documentation/blob/version-2.03/en/activity-standard/iati-activities/iati-activity/result/indicator/period/actual.rst>`_


Subelements
~~~~~~~~~~~

.. toctree::
   :titlesonly:
   :maxdepth: 1

   actual/location
   actual/dimension
   actual/comment
   actual/document-link

