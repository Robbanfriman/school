*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     Collections
Resource    masterResourceFile.robot
Suite Setup    SetUp with Admin Login



*** Test Cases ***

# ***Event Overview Page***


Test - Adding an event to website
    [Documentation]     Test if a signed in adming can add an event and verify that the event is added. Commented code is needed for the test to pass individually

    Set Selenium Speed    0.5
    Given I am at the event manager
    When I add a new event
    Sleep    2
    Then The event is visible on event overview    ${eventName}

    #I am at the event manager
    #I remove an event
    #Log out 


Test - change an event
    [Documentation]     Test if a signed in admin can change an event and verify the event has been changed. Commented code is needed for the test to pass individually
    Set Selenium Speed      0.3

#    I am at the event manager
#    I add a new event
#    The event is visible on event overview    ${eventName}

    Given I am at the event manager
    When I change an existing event
    Sleep    2
    Then The event is visible on event overview    ${changedEventName}

#    Given I am at the event manager
#    When I remove an event
#    Then The event is no longer visible on event overview    ${changedEventName}


Test - Remove an event
    [Documentation]     Test if an admin can remove an event and verify that the event has been removed. Commented code is needed for the test to pass individually
    Set Selenium Speed      0.3
    #Wait Until Element Is Visible    ${LogInTab}
    #I assure I am Logged In    ${ADMIN}    ${ADMINPASSWORD}
    #I am at the event manager
    #I add a new event
    #The new event is visible on event overview
    Given I am at the event manager
    When I remove an event
    Sleep    2
    Then The event is no longer visible on event overview    ${changedEventName}

#    Log out



#Test - How many events are shown
#    [Documentation]
#    Set Selenium Speed    0.3
#    Wait Until Element Is Visible    ${NavBarLogotype}
#    I assure I am Logged In    ${ADMIN}    ${ADMINPASSWORD}
#    Given I am at the event overview
#    When I count the events
#    Log out
#    #Then every active event from the DB should be visible




Test - event information page redirection
    [Documentation]     Test redirection from event overview to the events page, verify that you are at an event
    Set Selenium Speed    0.3
    Wait Until Element Is Visible    ${NavBarLogotype}
    Given I am at the event overview
    When I click on an event
    Then I am redirected to the event information page


Test - verify date and location
    [Documentation]     Test if the date and locatio  displays in the event overview
    Set Selenium Speed    0.3
    Wait Until Element Is Visible    ${NavBarLogotype}
    Given I am at the event overview
    Then Date,Time and Location should be visible on event overview
    
 

False Test - Enter wrong date in form
    [Documentation]     Test if the form allows you to put in wrong date
    Set Selenium Speed    1
    Wait Until Element Is Visible    ${NavBarLogotype}
    Given I am at the event manager
    When I enter an invalid date
    Then Error message should be shown

# ***Event Page***









