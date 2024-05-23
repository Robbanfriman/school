*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     Collections
Resource    masterResourceFile.robot
Suite Setup    Open Chrome browser


*** Test Cases ***

Test - signing in as Admin
    [Documentation]     Test if you can sign as an admin, verify that you are signed in as admin
    Set Selenium Speed    0.3
    I assure I am Logged In    ${ADMIN}    ${ADMINPASSWORD}
    Verify I am logged in as Admin
    Log out
   

Test - signing out 
    [Documentation]     Test if you can sign out, verify that you are signed out
    Set Selenium Speed    0.3 
    I assure I am Logged In    ${CustomerEmail}    ${CustomerPassword}
    I Assure I Am Logged Out
    Verify that I am now logged out
    I assure I am Logged In    ${ADMIN}    ${ADMINPASSWORD}
    I Assure I Am Logged Out
    Verify that I am now logged out

#Test - As A Logged In Admin I have a manage website option
#    [Documentation]     Test if a signed in admin can reach the manage event page
#    Set Selenium Speed    0.3
#    I assure I am Logged In    ${ADMIN}    ${ADMINPASSWORD}
#    Wait Until Element Is Visible    ${dropDownMenu}
#    Click Element    ${dropDownMenu}
#    Element Should Be Visible    ${ManageWebsiteTab}




Test - As A Logged In Admin I Can Add Game Genre
    [Documentation]     Test if a signed in admin can add a new game genre
    [Tags]  sprint 3
    Set Selenium Speed    0.3
    Given I Am At The Genre Manage page
    When I add A Genre
    Then Genre Is Added
    Log out

Test - As a logged in Admin I Can Change Game Genre
    [Documentation]     Test if a signed in admin can change game genre
    [Tags]  sprint 3
    Set Selenium Speed    0.3
    Given I Am At The Genre Manage page
    When I change A Genre
    Then Genre Is Changed
    Log out

Test - As a logged in Admin I Can Remove Game Genre
    [Documentation]     Test if a signed in admin can remove game genre
    [Tags]  sprint 3
    Set Selenium Speed    0.3
    Given I Am At The Genre Manage page
    When I Remove A Genre
    Then Genre Is Removed
    Log out

Test - As A Logged In Admin I Can Add Event Type
    [Documentation]     Test if a signed in admin can add Event type
    [Tags]  sprint 3
    Set Selenium Speed    0.3
    Given I Am At The Event Type Manage page
    When I Add An Event Type
    Then The Event Type Is Added
    Log Out


Test - As A Logged In Admin I Can Change An Event Type
    [Documentation]     Test if a signed in admin can change an Event type
    [Tags]  sprint 3
    Set Selenium Speed    0.3
    Given I Am At The Event Type Manage page
    When I Change An Event Type
    Then The Event Is Changed
    Log out

Test - As A Logged In Admin I Can Remove An Event Type
    [Documentation]     Test if a signed in admin can add Event type
    [Tags]  sprint 3
    Set Selenium Speed    0.3
    Given I Am At The Event Type Manage page
    When I Remove An Event Type
    Then The Event Type Is Removed
    Log Out
    