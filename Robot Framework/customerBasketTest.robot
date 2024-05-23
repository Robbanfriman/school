*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     Collections
Resource    masterResourceFile.robot
Suite Setup    Open Chrome browser

*** Test Cases ***

Test - Navigate To Customer Basket
    [Documentation]     Test if the costumer basket shows when you click it
    Given that I Click the Customer Basket
    Then I Am At Customer Basket Page
