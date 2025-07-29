*** Settings ***
Library           RequestsLibrary
Variables         ../pageobject/variables.py
Library           Collections



*** Variables ***
${BASE_URL}             https://fakestoreapi.com
${LOGIN_ENDPOINT}       /auth/login
${USERNAME}             mor_2314
${PASSWORD}             83r5^_

*** Keywords ***
Obtenir Token
    Create Session    fakeapi    ${BASE_URL}
    ${payload}=    Create Dictionary    username=${USERNAME}    password=${PASSWORD}
    ${response}=    POST On Session    fakeapi    ${LOGIN_ENDPOINT}    json=${payload}
    Should Be Equal As Numbers    ${response.status_code}    200
    # ${json}=    ${response.json()}
    # ${json}=    Evaluate
