
*** Settings ***
Library    RequestsLibrary
Variables  ../pageobject/variables.py

*** Variables ***
${DB_HOST}    mongodb+srv://admin:passer123@clusterqatestexamen.ju7prft.mongodb.net/?retryWrites=true&w=majority&appName=ClusterQaTestExamen
${DB_NAME}    label1DB
${collProduct}    products
${collUsers}    users
${collCarts}    carts

*** Keywords ***
Connect To MongoDB
    ${client}=    Evaluate    __import__('pymongo').MongoClient("${DB_HOST}")    modules=pymongo
    Set Suite Variable    ${client}

    ${db}=    Evaluate    ${client}.get_database("${DB_NAME}")
    Set Suite Variable    ${db}

    ${collectionProduct}=    Evaluate    ${db}.get_collection("${collProduct}")
    ${collectionUsers}=     Evaluate    ${db}.get_collection("${collUsers}")
    ${collectionCart}=      Evaluate    ${db}.get_collection("${collCarts}")

    Set Suite Variable    ${collectionProduct}
    Set Suite Variable    ${collectionUsers}
    Set Suite Variable    ${collectionCart}


Add Cart
    [Arguments]    ${carts_data}
    ${response}=    POST On Session    fakestore    /carts    json=${carts_data}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}

Read Cart by id  
    [Arguments]    ${carts_id}
    ${response}=    GET On Session    fakestore    /carts/${carts_id}
     Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}

Read All Cart
    ${response}=    GET On Session       fakestore    /carts
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}   

Update Cart
    [Arguments]    ${carts_id}    ${carts}    
    ${response}=    PUT On Session    fakestore    /carts/${carts_id}    json=${carts}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}
 
Delete Cart
    [Arguments]    ${carts_id}
    ${response}=    DELETE On Session    fakestore    /carts/${carts_id}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}       