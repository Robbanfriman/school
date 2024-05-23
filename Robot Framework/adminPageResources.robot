*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     Collections
Resource    masterResourceFile.robot


*** Keywords ***
Verify I am logged in as Admin
    Wait until element is visible    ${dropDownMenu}
    Click Element    ${dropDownMenu}
    Click Element    ${ManageWebsiteTab}
    Wait Until Page Contains Element    ${ManageEventOption}
    Element Should Be Visible    ${ManageEventOption}

Given I Am At The Genre Manage page
    I assure I am Logged In    ${ADMIN}    ${ADMINPASSWORD}
    Wait Until Element Is Visible    ${dropDownMenu}
    Click Element    ${dropDownMenu}
    click element   ${ManageWebsiteTab}
    Wait Until Page Contains Element    ${ManageGenresOption}
    Click Element    ${ManageGenresOption}
    
When I add A Genre
    Wait Until Page Contains Element    ${genreNameForm}    timeout=10s
    Input Text    ${genreNameForm}    ${genreName}
    Click Element    ${genreUpdateAddButton}

Then Genre Is Added
    Reload Page
    Sleep    2
    Wait Until Page Contains Element    ${genreDropdown}
    Click Element    ${genreDropdown}
    Page Should Contain    ${genreName}

When I change A Genre
    Sleep    2
    Select From List by Label    ${genreDropdown}    ${genreName}
    Input Text    ${genreNameForm}    ${genreChangedName}
    Click Element    ${genreUpdateAddButton}

Then Genre Is Changed
    Reload Page
    Sleep    2
    Wait Until Page Contains Element    ${genreDropdown}
    Click Element    ${genreDropdown}
    Page Should Contain    ${genreChangedName}

When I Remove A Genre
    Reload Page
    Sleep    2
    Select From List by Label    ${genreDropdown}    ${genreChangedName}
    Click Element    ${genreRemoveButton}

Then Genre Is Removed
    Reload Page
    Sleep    2
    Wait Until Page Contains Element    ${genreDropdown}
    Click Element    ${genreDropdown}
    Page Should Not Contain    ${genreChangedName}

Given I Am At The Event Type Manage page
    I assure I am Logged In    ${ADMIN}    ${ADMINPASSWORD}
    Wait Until Element Is Visible    ${dropDownMenu}
    Click Element    ${dropDownMenu}
    click element   ${ManageWebsiteTab}
    Wait Until Page Contains Element    ${ManageEventTypeOption}
    Click Element    ${ManageEventTypeOption}

When I Add An Event Type
    Input Text    ${eventTypeNewNameForm}    ${eventTypeNewName}
    Click Element    ${eventTypeUpdateAddButton}

Then The Event Type Is Added
    Reload Page
    Sleep    2
    Wait Until Page Contains Element    ${eventTypeDropDown}
    Click Element    ${eventTypeDropDown}
    Page Should Contain    ${eventTypeNewName}

When I Change An Event Type
    Select From List by Label    ${eventTypeDropDown}    ${eventTypeNewName}
    Input Text   ${eventTypeNewNameForm}    ${eventTypeChangedName}
    Click Element    ${eventTypeUpdateAddButton}

Then The Event Is Changed
    Reload Page
    Sleep    2
    Wait Until Page Contains Element    ${eventTypeDropDown}
    Click Element    ${eventTypeDropDown}
    Page Should Contain    ${eventTypeChangedName}

When I Remove An Event Type
    Select From List by Label    ${eventTypeDropDown}    ${eventTypeChangedName}
    Wait Until Page Contains Element    ${EventTypeRemoveButton}
    Click Element    ${EventTypeRemoveButton}

Then The Event Type Is Removed
    Reload Page
    Sleep    2
    Wait Until Page Contains Element    ${eventTypeDropDown}
    Click Element    ${eventTypeDropDown}
    Page Should Not Contain    ${eventTypeChangedName}


