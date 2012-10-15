.. image:: https://secure.travis-ci.org/cosent/plonesocial.suite.png
    :target: http://travis-ci.org/cosent/plonesocial.suite


Introduction
============

The PloneSocial suite is an integrated set of social business add-ons for Plone.

PloneSocial provides a full microblogging solution, 
including activity streams, user profiles and follow/unfollow functionality.


plonesocial.suite
-----------------

This package is targeted at end-users and integrators.

This is the integration package for all the various plonesocial.* packages
into a single consistent user experience that's easy to install.


Installation
============

Add the ``plonesocial.suite`` egg to your buildout::

    [instance]
    eggs = 
         Zope2
         PIL
         Plone
         plonesocial.suite

Run the buildout.

Install "Plonesocial Suite" via the Quickinstaller.

If you need some demo content to play with, you can run the
"Plonesocial Suite (demo)" profile from GenericSetup.   


Features and Roadmap
--------------------

The 0.4 release of plonesocial.suite provides:

* microblog status updates
* personal profile with follow/unfollow
  - and following/followers social graph views
* activitystream, with integrated:
  - status updates
  - content creation
  - discussion replies
  - hashtag support
  - filter by "following"

The slideshow_ of the PloneSocial presentation at PloneConf2012 is available on Slideshare.

An extensive roadmap_ for the plonesocial suite is available on github.


Plonesocial
===========

Plonesocial consists of:

`plonesocial.suite`_
 An out-of-the-box social business experience integrating all of the plonesocial.* packages.
 If you're an end user, this is what you're looking for.
 It installs and integrates all of the following components automatically.

`plonesocial.microblog`_
 Status updates.

`plonesocial.activitystream`_
 Lists content changes, discussion replies, and status updates.

`plonesocial.network`_
 Follow/unfollow of users.

plonesocial.like
 Favoriting of content. Planned.

`plonesocial.buildout`_
 Developer buildout. Not a Python package. Intended for Plonesocial developers only.

.. _plonesocial.suite: https://github.com/cosent/plonesocial.suite
.. _plonesocial.microblog: https://github.com/cosent/plonesocial.microblog
.. _plonesocial.activitystream: https://github.com/cosent/plonesocial.activitystream
.. _plonesocial.network: https://github.com/cosent/plonesocial.network
.. _plonesocial.buildout: https://github.com/cosent/plonesocial.buildout
.. _roadmap: https://github.com/cosent/plonesocial.suite/wiki
.. _slideshow: http://www.slideshare.net/GuidoStevens/plone-goes-social
