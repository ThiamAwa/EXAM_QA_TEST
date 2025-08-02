*** Settings ***
Variables  ../../pageobject/variables.py
Library    SeleniumLibrary
Library    RequestsLibrary

*** Keywords ***

Ouverture Navigateur
    Open Browser    ${URL2}    ${BROWSER}
    Sleep    3
Navigate to home page adresse
    Page Should Contain    Fast
    Sleep    3

Navigate to LOGIN page adresse
    Page Should Contain    Remember me
    Sleep    3

Click "Login" Link
    Click Link    Sign In
    Sleep    3

Type Valid login credentials
    [Arguments]    ${email}    ${password}
    Input Text    id=email-id    ${email}
    Input Password    id=password    ${password}
    Click Element    id=submit-id
     Sleep    3

Click "New Customer button"
    Click Element    id=new-customer
    Sleep    3


Type customer attributs
    Input Text    id=EmailAddress    test@gmail.com
    Input Text    id=FirstName    test
    Input Text    id=LastName    test
    Input Text    id=City    testCity
    Select From List By Value    StateOrRegion    CO
    Page Should Contain Radio Button    gender    Female
    Select Radio Button    gender    female
    Select Checkbox    name=promos-name    
    Sleep    5
    Click Element     xpath=//*[@id="loginform"]/div/div/div/div/form/button
    Sleep    5

logout
    Click Link    Sign Out
    Sleep    3

Examine customers grid for multiple records
    Wait Until Element Is Visible    id=customers    timeout=5
    ${row_count} =    Get Element Count    xpath=//*[@id="customers"]/tbody/tr
    Log To Console    Nombre de lignes : ${row_count}
    Sleep    3

Select Remenber option
    # Wait Until Element Is Visible    id=remember    timeout=5
    Select Checkbox    xpath=//*[@id='remember']
    Sleep    5

Close web browser
    Close Browser 
    Sleep    3

Click "Cancel" button
    Click Link    Cancel
    Sleep    3


