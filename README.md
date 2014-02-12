pbis-auth
=========

This cookbook provides authentication against a Microsoft Active Directory domain on Linux systems. Written for an tested against Centos, but script has been kept simple enough that there is no reason it would not work against RedHat or Ubuntu, assuming you have a pbis-open package available from your package manager.

REQUIREMENTS
------------

* Centos 5/6
* sudo cookbook
* Likewise-open 7.5 from the Powerbroker Open site


ATTRIBUTES
----------

* ad_network: This is the Active Directory domain you want the system to join.  This is used to fetch a databag of the same name containing authentication details. If this is not set, a databag matching the Environment name will be fecthed (so you can have a bag for dev, test, prod etc with appropiate details).


USAGE
-----

Start by extracting the Likewise-open RPM from the shell script installer.
* Download the installer from http://www.beyondtrust.com/Products/PowerBroker-Identity-Services-Open-Edition/Evaluation/
* Run the installer to start the extraction process and then terminate the process
* Extract the .deb or .rpm file from the temporary directory and place this in a local repository