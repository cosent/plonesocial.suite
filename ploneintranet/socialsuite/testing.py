from plone.app.contenttypes.testing import PLONE_APP_CONTENTTYPES_FIXTURE
from plone.app.testing import PloneSandboxLayer
from plone.app.testing import IntegrationTesting
from plone.app.testing import FunctionalTesting
from plone.app.testing import applyProfile

from plone.testing import z2

from plone.app.robotframework.testing import AUTOLOGIN_LIBRARY_FIXTURE

from zope.configuration import xmlconfig


class PlonesocialSuite(PloneSandboxLayer):

    defaultBases = (PLONE_APP_CONTENTTYPES_FIXTURE, )

    def setUpZope(self, app, configurationContext):
        # Load ZCML for this package
        import plone.tiles
        import ploneintranet.socialsuite
        import ploneintranet.microblog
        import ploneintranet.activitystream
        import ploneintranet.network
        import ploneintranet.theme
        import ploneintranet.messaging
        import ploneintranet.core
        xmlconfig.file('meta.zcml',
                       plone.tiles,
                       context=configurationContext)
        xmlconfig.file('configure.zcml',
                       ploneintranet.socialsuite,
                       context=configurationContext)
        xmlconfig.file('configure.zcml',
                       ploneintranet.microblog,
                       context=configurationContext)
        xmlconfig.file('configure.zcml',
                       ploneintranet.activitystream,
                       context=configurationContext)
        xmlconfig.file('configure.zcml',
                       ploneintranet.network,
                       context=configurationContext)
        xmlconfig.file('configure.zcml',
                       ploneintranet.theme,
                       context=configurationContext)
        xmlconfig.file('configure.zcml',
                       ploneintranet.messaging,
                       context=configurationContext)
        xmlconfig.file('configure.zcml',
                       ploneintranet.core,
                       context=configurationContext)

    def setUpPloneSite(self, portal):
        # Installs all the Plone stuff. Workflows etc.
        applyProfile(portal, 'Products.CMFPlone:testfixture')

        # all test setup is done by setuphandlers.demo()
        applyProfile(portal, 'ploneintranet.socialsuite:demo')


PLONESOCIAL_SUITE_FIXTURE = PlonesocialSuite()

PLONESOCIAL_SUITE_INTEGRATION_TESTING = \
    IntegrationTesting(bases=(PLONESOCIAL_SUITE_FIXTURE, ),
                       name="PlonesocialSuite:Integration")

PLONESOCIAL_ROBOT_TESTING = FunctionalTesting(
    bases=(AUTOLOGIN_LIBRARY_FIXTURE, PLONESOCIAL_SUITE_FIXTURE, z2.ZSERVER),
    name="PloneSocial:Robot")


from Testing.ZopeTestCase.threadutils import setNumberOfThreads
from Testing.ZopeTestCase.threadutils import QuietThread, zserverRunner
import time


def startZServer(host='127.0.0.1', number_of_threads=1, log=None):
    '''Starts an HTTP ZServer thread.'''
    _Z2HOST = host
    _Z2PORT = 55555
    setNumberOfThreads(number_of_threads)
    t = QuietThread(target=zserverRunner, args=(_Z2HOST, _Z2PORT, log))
    t.setDaemon(1)
    t.start()
    time.sleep(0.1)  # Sandor Palfy
    return 'http://%s:%s/plone' % (_Z2HOST, _Z2PORT)
