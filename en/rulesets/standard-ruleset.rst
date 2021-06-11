Standard Ruleset
================
The Standard Ruleset is a collection of rules that cover some of the basic requirements of the IATI Standard and that a computer could, in principle, test. Typically, these are rules about the data that cannot be enforced by the schema alone. It covers for example, the ordering of dates, and checks on the format of an iati-identifier.

There are some things given in definitions of elements that really only a human can interpret, such as "Is a title meaningful?". The Standard Ruleset does not even try to deal with cases such as this.

We have created a generic framework that allows us to express many of these rules in a way that both humans and machines can understand.
We call rules in this generic format our "Machine Readable" rules.

We have already written some code to interpret these rules, and hope that they will be useful, for example, for someone that wanted to build a web application that tested people's data against these rules. They should be easy to implement.

Some rules do not fit into this format, we call them "Non-Machine Readable Rules". It should be possible to write bespoke computer code to test each rule, but it requires a bit more work, both in terms of understanding what the rule means and the effort required to check.

Using the Standard Ruleset
^^^^^^^^^^^^^^^^^^^^^^^^^^

The current Standard Ruleset is a collection of rules that can be used to test the data in a single ``iati-activity`` or ``iati-organisation`` record.
IATI data is often found as large files containing collections of (for example) activities, so to test a file of IATI data against the Standard Ruleset means running the tests on each ``iati-activity`` or ``iati-organisation`` record in that file.

Every ``iati-activity`` or ``iati-organisation`` record has the option to use different elements of the IATI Standard, and to also repeat certain elements, so in defining a Standard Ruleset it is necessary to include rules that may or may not need to apply for each individual ``iati-activity`` or ``iati-organisation`` record.

If we take a ``transaction`` from an ``iati-activity`` record as an example, we can see that this element does not have to be reported. However, it may also be reported many times. There are rules in the Standard Ruleset to check that some of the data reported in transactions makes sense, so these tests could either be run many times, or not at all on a single ``iati-activity`` record. 

Hence, the minimum and maximum number of tests undertaken on an ``iati-activity`` or ``iati-organisation`` can fluctuate according to the content.

Non-Machine Readable Rules
^^^^^^^^^^^^^^^^^^^^^^^^^^

reporting-org/\@ref
-------------------

* The agency prefix MUST be a valid code in the IATI code list
* The identifier MUST be the same as that recorded by the publisher on the IATI Registry

participating-org/\@ref
-----------------------

* When using this attribute, it must be a valid organisation identifier.

transaction/provider-org/\@ref
------------------------------

* When using this attribute, it must be a valid organisation identifier.

transaction/receiver-org/\@ref
------------------------------

* When using this attribute, it must be a valid organisation identifier.

iati-identifier
---------------

* It MUST be globally unique among all activities published through the IATI Registry
* Once an activity has been reported to IATI its identifier MUST NOT be changed in subsequent updates
* It MUST be prefixed with EITHER the organisation identifier found in ``reporting-org/@ref`` OR a previous ``reporting-org identifier`` reported in ``other-identifier``

budget
------

* The budget element should be repeated for each year of the activity's duration
* Each budget should cover a period no longer than 1 year

sector
------

* Sector MUST be reported at either activity level or transaction level but not both
* At transaction level, only one sector per vocabulary should be reported

recipient-country and recipient-region
--------------------------------------

* Either recipient-country or recipient-region MUST be reported at activity level or transaction level but not both.


Machine Readable Rules
^^^^^^^^^^^^^^^^^^^^^^

These rules are defined in a `JSON file <https://github.com/IATI/IATI-Rulesets/blob/version-2.01/rulesets/standard.json>` as part of our :doc:`Single Source of Truth </developer/ssot/>` that can be consumed programatically. The list below has been generated from that source.




//iati-activity
---------------


* ``activity-date[@type='1' or @type='2']`` must be present.

* Either ``sector`` or ``transaction/sector`` must be present.

* ``@xml:lang`` must exist, otherwise all ``lang`` must exist.

* ``sector`` must exist, otherwise all ``sector`` must exist.

* ``@default-currency`` must exist, otherwise all ``currency`` must exist.

* ``transaction/recipient-country`` must not be present alongisde ``recipient-region`` and ``recipient-country``.

* ``transaction/recipient-region`` must not be present alongisde ``recipient-region`` and ``recipient-country``.

* ``@last-updated-datetime`` must not be more recent than the current date

* ``activity-date[@type='1']/@iso-date`` must be before or the same as ``activity-date[@type='3']/@iso-date``

* ``activity-date[@type='2']/@iso-date`` must be before or the same as ``activity-date[@type='4']/@iso-date``

* ``activity-date[@type='2']/@iso-date`` must not be in the future.

* ``activity-date[@type='4']/@iso-date`` must not be in the future.

* ``reporting-org/@ref`` should match the regex ``[^\/\&\|\?]+``

* ``iati-identifier`` should match the regex ``[^\/\&\|\?]+``

* ``participating-org/@ref`` should match the regex ``[^\/\&\|\?]+``

* ``transaction/provider-org/@ref`` should match the regex ``[^\/\&\|\?]+``

* ``transaction/receiver-org/@ref`` should match the regex ``[^\/\&\|\?]+``

* The sum of values matched at ``recipient-country/@percentage`` and ``recipient-region/@percentage`` must be ``100``.

* The sum of values matched at ``sector[@vocabulary = '1' or not(@vocabulary)]/@percentage`` must be ``100``.

* The value of each of the elements described by ``recipient-country/@percentage`` must be at least ``0.0`` no more than ``100.0`` (inclusive).

* The value of each of the elements described by ``recipient-region/@percentage`` must be at least ``0.0`` no more than ``100.0`` (inclusive).

* The value of each of the elements described by ``sector/@percentage`` must be at least ``0.0`` no more than ``100.0`` (inclusive).

* The value of each of the elements described by ``capital-spend/@percentage`` must be at least ``0.0`` no more than ``100.0`` (inclusive).

* The value of each of the elements described by ``country-budget-items/budget-item/@percentage`` must be at least ``0.0`` no more than ``100.0`` (inclusive).

* If ``count(sector[@vocabulary=98 or @vocabulary=99]) > 0`` evaluates to true, then ``count(sector[@vocabulary=98 or @vocabulary=99]/narrative) >= count(sector[@vocabulary=98 or @vocabulary=99])`` must evaluate to true.




//iati-activity/other-identifier/owner-org
------------------------------------------


* Either ``@ref`` or ``narrative`` must be present.




//iati-activity/transaction/provider-org
----------------------------------------


* Either ``@ref`` or ``narrative`` must be present.




//iati-activity/transaction/receiver-org
----------------------------------------


* Either ``@ref`` or ``narrative`` must be present.




//policy-marker
---------------


* ``@significance`` must be present if @vocabulary='1' or not(@vocabulary)

* ``narrative`` must be present if @vocabulary='99'




//iati-organisation
-------------------


* ``reporting-org/@ref`` should match the regex ``[^\/\&\|\?]+``

* ``organisation-identifier`` should match the regex ``[^\/\&\|\?]+``

* ``@last-updated-datetime`` must not be more recent than the current date

* ``@xml:lang`` must exist, otherwise all ``lang`` must exist.

* ``@default-currency`` must exist, otherwise all ``currency`` must exist.




//participating-org
-------------------


* Either ``@ref`` or ``narrative`` must be present.




//transaction
-------------


* ``transaction-date/@iso-date`` must not be in the future.

* ``value/@value-date`` must not be in the future.




//planned-disbursement
----------------------


* ``period-start/@iso-date`` must be before or the same as ``period-end/@iso-date``




//budget
--------


* ``period-start/@iso-date`` must be before or the same as ``period-end/@iso-date``

* The time between ``period-start/@iso-date`` and ``period-end/@iso-date`` must not be over a year




//total-budget
--------------


* ``period-start/@iso-date`` must be before or the same as ``period-end/@iso-date``

* The time between ``period-start/@iso-date`` and ``period-end/@iso-date`` must not be over a year




//recipient-country-budget
--------------------------


* ``period-start/@iso-date`` must be before or the same as ``period-end/@iso-date``

* The ``budget-line/value/@value-date`` must be between the ``period-start/@iso-date`` and ``period-end/@iso-date`` dates.

* The time between ``period-start/@iso-date`` and ``period-end/@iso-date`` must not be over a year




//recipient-org-budget
----------------------


* ``period-start/@iso-date`` must be before or the same as ``period-end/@iso-date``

* The time between ``period-start/@iso-date`` and ``period-end/@iso-date`` must not be over a year




//recipient-region-budget
-------------------------


* ``period-start/@iso-date`` must be before or the same as ``period-end/@iso-date``

* The time between ``period-start/@iso-date`` and ``period-end/@iso-date`` must not be over a year




//result/indicator
------------------


* There must be no more than one element or attribute matched at ``reference[1]`` or ``../reference[1]``.

* There must be no more than one element or attribute matched at ``../reference[1]`` or ``reference[1]``.




//result/indicator/period
-------------------------


* ``period-start/@iso-date`` must be before or the same as ``period-end/@iso-date``




//total-expenditure
-------------------


* The time between ``period-start/@iso-date`` and ``period-end/@iso-date`` must not be over a year

* ``period-start/@iso-date`` must be before or the same as ``period-end/@iso-date``




//result/indicator[@measure='1' or @measure='2' or @measure='3' or @measure='4']/baseline
-----------------------------------------------------------------------------------------


* ``@value`` must be present.




//result/indicator[@measure='1' or @measure='2' or @measure='3' or @measure='4']/period/target
----------------------------------------------------------------------------------------------


* ``@value`` must be present.




//result/indicator[@measure='1' or @measure='2' or @measure='3' or @measure='4']/period/actual
----------------------------------------------------------------------------------------------


* ``@value`` must be present.


