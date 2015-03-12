

Introduction
============

The PloneSocial suite is an integrated set of social business add-ons for Plone.

PloneSocial provides a full microblogging solution, 
including activity streams, user profiles and follow/unfollow functionality.


ploneintranet.suite
-----------------

This package is targeted at end-users and integrators.

This is the integration package for all the various ploneintranet.* packages
into a single consistent user experience that's easy to install.

Credits
-------

|Cosent|_

This package is maintained by Cosent_.

.. _Cosent: http://cosent.nl
.. |Cosent| image:: http://cosent.nl/images/logo-external.png 
                    :alt: Cosent
                    

Build status (harmless)
-----------------------

Robot tests for Plone Social and Plone Intranet
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. image:: https://secure.travis-ci.org/cosent/ploneintranet.suite.png
    :target: http://travis-ci.org/cosent/ploneintranet.suite
.. image:: http://jenkins.ploneintranet.net/buildStatus/icon?job=Plone%20Social%20Suite
   :target: http://jenkins.ploneintranet.net/job/Plone%20Social%20Suite%20Master/badge/

.. image:: http://jenkins.ploneintranet.net/buildStatus/icon?job=Plone%20Intranet%20Suite%20Master
   :target: http://jenkins.ploneintranet.net/job/Plone%20Intranet%20Suite%20Master/badge/


Installation
============

Add the ``ploneintranet.suite`` egg to your buildout::

    [instance]
    eggs = 
         Zope2
         PIL
         Plone
         ploneintranet.suite

Run the buildout.

Install "Plonesocial Suite" via the Quickinstaller.

Theme
-----

`ploneintranet.theme`_ provides a Bootstrap based Diazo theme which is activated by the default setup profile.

If you want the Plonesocial backend components, but not the theme, do not install ploneintranet.suite
but instead install the separate backend components. It's a pluggable system.

Demo
----

If you need some demo content to play with, you can run the
"Plonesocial Suite (demo)" profile from GenericSetup.   

The demo profile creates a number of fake users that interact on the site.
Demo users all have the same password for testing purposes.

Do *not* install the demo profile into a production site.

Features and Roadmap
--------------------

Ponesocial.suite provides:

* microblog status updates
* personal profile with follow/unfollow
  - and following/followers social graph views
* activitystream, with integrated:
  - status updates
  - content creation
  - discussion replies
  - hashtag support
  - filter by "following"
* multi-workspace support for microblogging and activitystreams
* (optional) a Bootstrap based Diazo theme.


The slideshow_ of the PloneSocial roadmap presentation at Plone Open Garden 2012 is available on Slideshare.

An extensive roadmap_ for the ploneintranet suite is available on github.


Plonesocial
===========

Plonesocial consists of:

`ploneintranet.suite`_
 An out-of-the-box social business experience integrating all of the ploneintranet.* packages.
 If you're an end user, this is what you're looking for.
 It installs and integrates all of the following components automatically.

`ploneintranet.microblog`_
 Status updates.

`ploneintranet.activitystream`_
 Lists content changes, discussion replies, and status updates.

`ploneintranet.network`_
 Follow/unfollow of users.

`ploneintranet.theme`_
 Bootstrap theme.

ploneintranet.like
 Favoriting of content. Planned.

`ploneintranet.buildout`_
 Developer buildout. Not a Python package. Intended for Plonesocial developers only.

.. _ploneintranet.suite: https://github.com/cosent/ploneintranet.suite
.. _ploneintranet.microblog: https://github.com/cosent/ploneintranet.microblog
.. _ploneintranet.activitystream: https://github.com/cosent/ploneintranet.activitystream
.. _ploneintranet.network: https://github.com/cosent/ploneintranet.network
.. _ploneintranet.theme: https://github.com/cosent/ploneintranet.theme
.. _ploneintranet.buildout: https://github.com/cosent/ploneintranet.buildout
.. _slideshow: http://www.slideshare.net/GuidoStevens/ploneintranet-roadmap
.. _roadmap: https://github.com/cosent/ploneintranet.suite/wiki
