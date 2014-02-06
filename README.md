BekasMadoo
========

[BekasMadoo](https://github.com/FikriFadzil/Bekas-Madoo) is a solution to push data from multiple honeypots into one database server. In order to centralize the data, this solution consists of two applications.

You are invited to add new plugins in order to support more honeypots and do not hesitate to commit for bugs fix.

Supported Honeypots:
* Glastopf
* Kippo

Author
-------
* [Fikri Fadzil](mailto:fikri.fadzil@impact-alliance.org) ([GitHub](https://github.com/FikriFadzil/))
* [Muhamad Ammar](mailto:ammar.aboobakar@impact-alliance.org)

Installation
------------
* git clone https://github.com/FikriFadzil/Bekas-Madoo.git
* Settings - Central DB
  * Restore bekasmadoo.sql
  * Copy /server folder into the webserver
  * Configure /server/global.php
* Settings - Sensor
  * Copy /client folder to any location
  * Configure /client/configuration
  * run this - python bekasmadoo.py

Support
-----
* [International Multilateral Partnership Against Cyber Threats (IMPACT), Malaysia](http://www.impact-alliance.org/)
