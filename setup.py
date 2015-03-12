from setuptools import setup, find_packages

version = '0.7.0dev'

long_description = (
    open('README.rst').read()
    + '\n' +
    'Contributors\n'
    '============\n'
    + '\n' +
    open('CONTRIBUTORS.txt').read()
    + '\n' +
    open('CHANGES.txt').read()
    + '\n')

setup(
    name='ploneintranet.suite',
    version=version,
    description="Pre-integrated social business suite for Plone",
    long_description=long_description,
    # Get more strings from
    # http://pypi.python.org/pypi?%3Aaction=list_classifiers
    classifiers=[
        "Programming Language :: Python",
    ],
    keywords='plone socbiz social microblogging',
    author='Guido Stevens',
    author_email='guido.stevens@cosent.net',
    url='http://github.com/cosent/ploneintranet.suite',
    license='gpl',
    packages=find_packages(),
    namespace_packages=['ploneintranet', ],
    include_package_data=True,
    zip_safe=False,
    install_requires=[
        'setuptools',
        'Plone',
        'ploneintranet.microblog',
        'ploneintranet.activitystream',
        'ploneintranet.network',
        'ploneintranet.messaging',
        'ploneintranet.core',
        'ploneintranet.theme',
        'loremipsum',
        'plone.api',
        # -*- Extra requirements: -*-
    ],
    extras_require={'test': ['plone.app.testing',
                             'plone.app.robotframework'], },
    entry_points="""
      # -*- Entry points: -*-
          [z3c.autoinclude.plugin]
          target = plone
      """,)
