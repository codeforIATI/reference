period-end
==========

``iati-activities/iati-activity/budget/period-end``

This is the reference page for the XML element ``period-end``. 

.. index::
  single: period-end

Definition
~~~~~~~~~~


The end of the period (which must not be greater than one year)



Rules
~~~~~








This element must occur once and only once (within each parent element).








Attributes
~~~~~~~~~~


.. _iati-activities/iati-activity/budget/period-end/.iso-date:

@iso-date
  

  This attribute is required.



  This value must be of type xsd:date.



  ``period-start/@iso-date`` must be before or the same as ``period-end/@iso-date``

  The time between ``period-start/@iso-date`` and ``period-end/@iso-date`` must not be over a year





Example Usage
~~~~~~~~~~~~~
Example usage of ``period-end`` of ``budget`` for an ``iati-activity``.

| An example date is declared in the ``@iso-date`` attribute.
| This example date format conform to the *xsd:date* standard - for most cases *YYYY-MM-DD* is sufficient.

.. literalinclude:: ../../../activity-standard-example-annotated.xml
	:language: xml
	:start-after: <!--budget starts-->
	:end-before: <!--budget ends-->



Developer tools
~~~~~~~~~~~~~~~

Find the source of this documentation on github:

* `Schema <https://github.com/IATI/IATI-Schemas/blob/version-2.03/iati-activities-schema.xsd#L2022>`_
* `Extra Documentation <https://github.com/IATI/IATI-Extra-Documentation/blob/version-2.03/en/activity-standard/iati-activities/iati-activity/budget/period-end.rst>`_

