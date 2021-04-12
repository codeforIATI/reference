value
=====

``iati-activities/iati-activity/transaction/value``

This is the reference page for the XML element ``value``. 

.. index::
  single: value

Definition
~~~~~~~~~~


The amount of the contribution.



Rules
~~~~~








This element must occur once and only once (within each parent element).








Attributes
~~~~~~~~~~


.. _iati-activities/iati-activity/transaction/value/.currency:

@currency
  A three letter ISO 4217 code for the original currency of the
  amount. This is required for all currency amounts unless
  the iati-organisation/\@default-currency attribute is
  specified.


  This value must be of type xsd:string.


  This value must be on the :doc:`Currency codelist </codelists/Currency>`.



  


.. _iati-activities/iati-activity/transaction/value/.value-date:

@value-date
  The date to be used for determining the exchange rate for
  currency conversions.

  This attribute is required.



  This value must be of type xsd:date.



  ``value/@value-date`` must not be in the future.





Example Usage
~~~~~~~~~~~~~
Example usage of ``value`` of a ``transaction`` in an ``iati-activity``.

| An example date is declared in the ``@value-date`` attribute.
| This example date format conform to the *xsd:date* standard - for most cases *YYYY-MM-DD* is sufficient.

| This example declares a *Currency* code *EUR*, using the ``@currency`` attribute.
| Note: A ``Currency`` code should only be declared if different to ``@default-currency`` in the ``iati-activity`` element.

.. literalinclude:: ../../../activity-standard-example-annotated.xml
	:language: xml
	:start-after: <!--transaction starts-->
	:end-before: <!--transaction ends-->

Changelog
~~~~~~~~~

1.03
^^^^
Values are now allowed to be declared as decimals instead of integers.


Developer tools
~~~~~~~~~~~~~~~

Find the source of this documentation on github:

* `Schema <https://github.com/IATI/IATI-Schemas/blob/version-2.03/iati-activities-schema.xsd#L1001>`_
* `Extra Documentation <https://github.com/IATI/IATI-Extra-Documentation/blob/version-2.03/en/activity-standard/iati-activities/iati-activity/transaction/value.rst>`_

