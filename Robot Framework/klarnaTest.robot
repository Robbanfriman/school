*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     Collections
Resource    masterResourceFile.robot
Suite Setup    Open Chrome browser

*** Test Cases ***

Test - If i can Buy With Klarna
   [Documentation]      Test the klarna button, if it leads to klarna checkout
   Given I Chose To Pay With Klarna
   Then Klarna Is Showing

