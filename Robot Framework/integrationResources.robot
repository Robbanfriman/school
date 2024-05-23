*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     Collections
Resource    masterResourceFile.robot    


*** Keywords ***

I am at the Home Page
    [Documentation]    Navigates to the homepage and waits until landing page title is visible
    [Tags]
    Sleep    1
    Wait Until Page Contains Element    ${Home}
    Click Element    ${Home}
    Wait Until Page Contains Element    ${NavBarLogotype}    #${EventLinkButton}

I press the logotype in the top left corner
    [Documentation]
    [Tags]
    Wait Until Element Is Visible    ${NavBarLogotype}
    Click Element    ${NavBarLogotype}

I will be redirected to the home page
    [Documentation]
    [Tags]
    Wait Until Page Contains Element    ${NavBarLogotype}        #${EventLinkButton}

I click LogInTab
    [Documentation]
    [Tags]
    Wait Until Element Is Visible    ${LogInTab}
    Click Element    ${LogInTab}

The login page should be shown
    [Documentation]
    [Tags]
    Wait Until Page Contains Element    ${LoginEmailField}


I click on the Event tab
    [Documentation]    clicks on the event tab
    [Tags]
    Click Element    ${eventTab}
    Wait Until Page Contains     ${eventTitleText}

I am redirected to the event overview
    [Documentation]    Verifies that the event overview is visible
    [Tags]
    Wait Until Page Contains     ${eventTitleText}  

I can see active events
    [Documentation]    Verifies that the active events are visible
    [Tags]
    
    Wait Until Page Contains     ${eventTitleText}  #use list method here instead

When I click the Store
    [Documentation]
    [Tags]
    Sleep    1
    Wait Until Page Contains Element    ${storeTab}
    Click Element    ${storeTab}

Then I am at the product overview 
    [Documentation]
    [Tags]
    Sleep    1
    Wait Until Page Contains Element    ${gameOne}
    Page Should Contain Element    ${gameOne}
    Sleep    1
    
When I click the Faq
    [Documentation]
    [Tags]
    Sleep    1
    Scroll Element Into View    ${faq}
    Wait Until Page Contains Element    ${faq}
    Click Element    ${faq}
Then I Am Redirected to The Faq
    [Documentation]
    [Tags]
    Sleep    1
    Scroll Element Into View    ${faqPage}
    Wait Until Page Contains Element    ${faqPage}
    Page Should Contain Element    ${faqPage}

Given That I Am at The Faq
    [Documentation]
    [Tags]
    I am at the Home Page
    When I click the Faq

When I Click A Question
    [Documentation]
    [Tags]
    Sleep    1
    Scroll Element Into View    ${question}
    Wait Until Page Contains Element    ${question}
    Click Element    ${question}

I See The Question
    [Documentation]
    [Tags]
    Page Should Contain    Gå till vår "Events"-sida, välj det event du är intresserad av och klicka på "Köp nu". Följ instruktionerna för att genomföra ett köp. När du har betalat är du bokad på eventet.

When I Ask A Question
    [Documentation]
    [Tags]
    Sleep    1
    Scroll Element Into View    ${questionNameForm}
    Wait Until Page Contains Element    ${questionNameForm}
    Input Text    ${questionNameForm}    ${questionName}
    Input Text    ${questionMailForm}   ${questionMail}
    Input Text    ${userQuestionForm}    ${userQuestion}
    Click Element    ${sendQuestionButton}

When I Click The Facebook Link
    [Documentation]
    [Tags]
    Sleep    1
    Scroll Element Into View    ${facebook}

#    Wait Until Page Contains Element    ${facebook}
    Click Element    ${facebook}

Then I Should Be At Facebook
    [Documentation]
    [Tags]
    ${handles} =    Get Window Handles
    Switch Window    ${handles}[1]
    Sleep    7
    ${NewTabURL}=    Get Location
    Should Contain    ${NewTabURL}    facebook


    #Wait Until Page Contains Element    //*[@id="facebook"]/body/div[3]/div[2]/div/div/div/div/div[3]/div[2]/div/div[2]/div[1]/div/div[1]/div/span/span
    #Click Element    //*[@id="facebook"]/body/div[3]/div[2]/div/div/div/div/div[3]/div[2]/div/div[2]/div[1]/div/div[1]/div/span/span
    #Page Should Contain    Facebook hjälper dig att hålla kontakten med vänner och familj.
    Switch Window    ${handles}[0]

Given That I Am At the Sign in Page
    [Documentation]
    [Tags]
    Wait Until Page Contains Element    ${LogInTab}
    Click Element    ${LogInTab}
    Page Should Contain Element    ${LogInSubmitButton}

When I Sign up As New Customer I should become a registered user
    [Documentation]
    [Tags]
    Wait Until Page Contains Element    ${registerAccountButton}
    Click Element    ${registerAccountButton}
    Sleep    1
    Input Text    ${registerMailForm}    ${registerMail}
    Input Password    ${registerPasswordForm}    ${registerPassword}
    Input Password    ${registerPasswordConfirmForm}    ${registerPassword}

    Page Should Contain Checkbox    //*[@id="flexCheckDefault"]
    Scroll Element Into View    ${registerButton}
    Click Button    ${registerButton}   
    ${alert}=    Run Keyword And Return Status    Alert is visible
    Run Keyword If    '${alert}' == 'True'    Return to Login Page    ELSE    Confirm Email

Confirm Email
    Sleep    1
    Element Should Be Visible    ${emailConfirmLink}
    Click Element    ${emailConfirmLink}
    Wait Until Page Contains    Din email är bekräftad.    timeout=10

Alert is visible
    Page Should Contain    ${alreadyRegisteredAlert}

Return to Login Page
    Click Element    ${LogInTab}


Given That I Am At Manage Account page
    Log in    ${registerMail}    ${registerPassword}
    Sleep    1
    Click Element    ${dropDownMenu}
    Click Element    ${ManageAccountOption}
    Wait Until Element Is Visible    ${personalData}

I Remove The Account
    Sleep    1
    Click Element    ${personalData}
    Sleep    1
    Click Element    ${deleteAccountButton}
    Sleep    1
    Input Password    ${PasswordFormDeleteAccount}    ${registerPassword}
    Click Button    ${ConfirmDeleteAccountButton}

Then User Is Removed
    Page Should Contain    Logga in
