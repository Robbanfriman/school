*** Settings ***
Library     SeleniumLibrary
Library     DateTime

Resource    eventResources.robot   
Resource    landingPageResources.robot    
Resource    adminPageResources.robot    
Resource    integrationResources.robot
Resource    VariableLibrary.robot
Resource    storeResources.robot
Resource    CustomerBasketResources.robot
Resource    KlarnaResource.robot

*** Keywords ***
Open Chrome browser
    [Documentation]
    [Tags]
    Open Browser    ${URL}    ${Browser}    #${BROWSER_OPTIONS}
    Maximize Browser Window
    Set Selenium Speed    1

SetUp with Admin Login
    [Documentation]    suite setup for admin log in 

    Open Chrome browser
    I assure I am Logged In    ${ADMIN}    ${ADMINPASSWORD}

Set Event Date Format
    [Documentation]    Check date format and if it doesnt match change the format to work in the enviroment

    ${dateFormat}=    Get Value    ${eventDateForm}
    Log    ${dateFormat}

    FOR    ${Attempt}    IN RANGE    1    6

        IF    "${dateFormat}" != "${CorrectDateFormat}"

            IF    "${dateFormat}" != "${CorrectDateFormat}"
                Input Text    ${eventDateForm}    ${EventDateFormat1}
                ${dateFormat}=    Get Value    ${eventDateForm}
                Log    ${dateFormat}

            ELSE IF    "${dateFormat}" == "${CorrectDateFormat}" 
                BREAK
                
            ELSE
                Input Text    ${eventDateForm}    ${EventDateFormat2}
                ${dateFormat}=    Get Value    ${eventDateForm}
                Log    ${dateFormat}                
            END

        ELSE
            BREAK
        END
    END
    


Log in 
    [Documentation]     Test to sign in, uses arguments so it can be used for both admin and costumers
    [Tags]
    [Arguments]    ${username}    ${password}
    Sleep    1
    Wait Until Page Contains Element    ${LogInTab}
    Scroll Element Into View    ${LogInTab}
    Click Element    ${LogInTab}
    Wait Until Page Contains Element    ${LoginEmailField}    timeout=10s
    Input Text          ${LoginEmailField}    ${username}
    Input Password    ${LoginPasswordField}    ${password}
    Scroll Element Into View    ${LogInSubmitButton}
    Click button    ${LogInSubmitButton}

Log out    #se över när jespers ändringar kommer in
    [Documentation]    Test to sign out
    [Tags]
        Sleep   1
        Scroll Element Into View    ${dropDownMenu}
        Sleep    1
        Wait Until Element Is Visible    ${dropDownMenu}
        Click Element    ${dropDownMenu}
        Sleep    1
        Wait Until Element Is Visible    ${LogOutOption}
        Click Element    ${LogOutOption}
        



Verify logged in status
    [Documentation]     Checks if user is logged in
    [Tags]      VerifyLoggedIn  
    ${LoggedIn}=    Set Variable If    Element should be visible    ${dropDownMenu},    False    
    RETURN    ${LoggedIn}

    

I assure I am Logged In
    [Documentation]     Log in if user is not already
    [Tags]      VerifyLoggedIn
    [Arguments]    ${UserName}    ${Password}
    ${LoginStatus}=     Run Keyword And Return Status     Verify logged in status
    Run Keyword If      ${LoginStatus} == ${LoggedOut}    Log in    ${UserName}    ${Password}

I Assure I Am Logged Out
    [Documentation]     Makes sure I am logged out
    [Tags]      Logout    
    ${LoginStatus}=     Run Keyword And Return Status    Verify logged in status
    Run Keyword If      ${LoginStatus} == ${LoggedOut}    Log Out
         
Verify that I am now logged out
    [Documentation]     Makes sure I am logged out
    [Tags]      Logout   
    Wait Until Element Is Visible    ${LogInTab}    timeout=10s
    Wait Until Page Contains Element    ${LogInTab}    timeout=10s
    Element Should Be Visible    ${LogInTab}


