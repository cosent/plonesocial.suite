*** Settings ***
Resource  plone/app/robotframework/selenium.robot
Resource  plone/app/robotframework/saucelabs.robot
#Library   Dialogs
Library   Remote  ${PLONE_URL}/RobotRemote

Test Setup     Open SauceLabs test browser
Test Teardown  Run keywords  Report test status  Close all browsers

*** Test Cases ***

Home view
    [Tags]  member  home
    Log in as Clare
    Go to  ${PLONE_URL}
    Page should contain   The "Explore" section shows all updates of all people.

Submit microblog update on homepage
    [Tags]  member  home  submit  memberhomesubmit
    Log in as Clare
    Go to  ${PLONE_URL}
    Element should be visible  id=microblog
    Element should be visible  css=div.post.status
    Element should not be visible  name=form.buttons.statusupdate
### FIXME this breaks because patternslib is not loaded right
#    Click Element  css=textarea.pat-comment-box
### FIXME this breaks because the js animations don't work
#    Wait until element is visible  name=form.buttons.statusupdate
#    Input Text  css=textarea  This is a microblog status update. With a #demo hashtag.
#    Click Button  name=form.buttons.statusupdate
#    Page should contain link  \#demo

Tag view
    [Tags]  member  tag
    Log in as Clare
    Go to  ${PLONE_URL}/@@stream/tag/demo
    Element Should Contain  css=h2  Updates tagged #demo
    Page Should Contain Image  ${PLONE_URL}/portal_memberdata/portraits/kurt_silvio
    Page should not contain  clare
    Page should not contain   The "Explore" section shows all updates of all people.


Profile
    [Tags]  member  profile
    Log in as Clare
    Go to  ${PLONE_URL}/@@author
    Page should contain  Followers
    Page should contain  Following
    Element Should Contain  css=div.description  Status updates by Clare Presler:
    Page Should Not Contain Image  ${PLONE_URL}/portal_memberdata/portraits/kurt_silvio

My Network Empty
    [Tags]  member  mynetwork
    Log in as Clare
    Go to  ${PLONE_URL}/@@stream/network
    Page Should Not Contain Image  ${PLONE_URL}/portal_memberdata/portraits/kurt_silvio

Explore
    [Tags]  member  explore
    Log in as Clare
    Go to  ${PLONE_URL}/@@stream
    Page Should Contain Image  ${PLONE_URL}/portal_memberdata/portraits/kurt_silvio
    Page should contain   The "Explore" section shows all updates of all people.

FollowUnfollow
    [Tags]  member  follow
    Log in as Clare
    Go to  ${PLONE_URL}/@@following/kurt_silvio
    Page Should Contain Image  ${PLONE_URL}/portal_memberdata/portraits/clare_presler
    Go to  ${PLONE_URL}/@@followers/kurt_silvio
    Page Should Not Contain Image  ${PLONE_URL}/portal_memberdata/portraits/clare_presler
    Click Button  name=subunsub_follow
    Page Should Contain Image  ${PLONE_URL}/portal_memberdata/portraits/clare_presler
    Click Button  name=subunsub_unfollow
    Page Should Not Contain Image  ${PLONE_URL}/portal_memberdata/portraits/clare_presler


*** Keywords ***
Log in as Clare
    Enable autologin as  Member
    Set autologin username  clare_presler



