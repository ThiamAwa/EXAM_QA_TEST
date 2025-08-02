*** Settings ***
Library           RequestsLibrary
Variables         ../pageobject/variables.py
Library           Collections



*** Variables ***
${DB_HOST}    mongodb+srv://admin:passer123@clusterqatestexamen.ju7prft.mongodb.net/?retryWrites=true&w=majority&appName=ClusterQaTestExamen 
${DB_NAME}    label1DB
${collProduct}    products
${collUsers}    users
${collCarts}    carts

*** Keywords ***
Obtenir Token
    Create Session    fakeapi    ${BASE_URL}
    ${payload}=    Create Dictionary    username=${USERNAME}    password=${PASSWORD}
    ${response}=    POST On Session    fakeapi    ${LOGIN_ENDPOINT}    json=${payload}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    # ${json}=    ${response.json()}

    # ${json}=    Evaluate
