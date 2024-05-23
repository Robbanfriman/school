
*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     Collections
Resource    masterResourceFile.robot

Suite Setup    Open Chrome browser



*** Test Cases ***

Test - Clicking logotype redirects you to start page
    [Documentation]     When you click the logo in the left corner you should be directed to the start page.
    Set Selenium Speed    0.3
    Given I am at the event overview
    When I press the logotype in the top left corner
    Then I will be redirected to the Home page
    

Test - Login tab takes you to login page
    [Documentation]     When you click the login tab, you should be redirected to the login page
    Set Selenium Speed    0.3
    Given I am at the Home Page
    When I click LogInTab
    Then the login page should be shown
    

Test - redirecting to event
    [Documentation]     When you click the event tab in the navbar it should redirect you to the event overview
    Set Selenium Speed    0.3
    Given I am at the Home Page
    When I click on the Event tab
    Then I am redirected to the event overview
    And I can see active events
    

Test - redirecting to store
    [Documentation]     When you click the store tab in the navbar it should redirect you to the store page
    Set Selenium Speed    0.3
    Given I am at the Home Page
    When I click the Store
    Then I am at the product overview

Test - Redirect To Faq
    [Documentation]     When you click the faq tab in the footer it should redirect you to the faq page
    Set Selenium Speed    0.3
    Given I am at the Home Page
    When I click the Faq
    Then I Am Redirected to The Faq

Test - Quetions In Faq
    [Documentation]    When You click a question in the faq the answer should drop down
    Set Selenium Speed    0.3
    Given That I Am at The Faq
    When I Click A Question
    Then I See The Question

#Test - Ask A Question In Faq
#    [Documentation]    When you fill in the question form the question should be sent, commented out because Angela gets mail everytime the test runs.
#    Set Selenium Speed    0.3
#    Given That I Am at The Faq
#    When I Ask A Question

Test - Clicking Facebook Link
    [Documentation]     When you click the facebook tab it should redirect you to facebook
    I am at the Home Page
    When I Click The Facebook Link
    Then I Should Be At Facebook

Test - Creating A customer Account
    [Documentation]     Creating an account and confirming that the account is created
    Given That I Am At the Sign in Page
    When I Sign up As New Customer I should become a registered user

Test - Removing An Account
    [Documentation]     Removing the created account and confirming that it is removed
    Given That I Am At Manage Account page
    When I Remove The Account
    Then I am at the Home Page
    Then User Is Removed








