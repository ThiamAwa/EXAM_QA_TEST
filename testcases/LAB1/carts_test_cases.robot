*** Settings ***
Library    SeleniumLibrary
Resource    ../ressources/carts_keywords.robot
Library    Collections


*** Test Cases *** 

CAS_TEST_1 Add Cart Pass
    [Tags]    cartsC
    ${userID}=    Evaluate    1
    ${iD}=    Evaluate    1
    ${date}=    Set Variable    2023-07-28
    ${data}=    Create Dictionary
    ...    id=${iD}
    ...    userId=${userID}
    ...    date=${date}
    ...    products=${{ [{"productId": 1, "quantity": 5},{"productId": 2, "quantity": 15}] }}
    ${cart}=    Add Cart    ${data}
    Log To Console    ${cart}

CAS_TEST_2 Read Cart by id pass
    [Tags]    cartsI
    ${cart}=    Read Cart by id    1
    Log To Console    ${cart}

CAS_TEST_3 Read All Cart
    [Tags]    cartsRA
    ${carts}=    Read All Cart
    Log To Console    ${carts} 

CAS_TEST_4 Update Cart by id pass
    [Tags]    cartsUI
    ${userID}=    Evaluate    1
    ${iD}=    Set Variable    6888c504ec81f36752eec4a9
    ${id_obj}=    Evaluate    __import__('bson').ObjectId("${iD}")
   ${datetime}=    Evaluate    __import__('datetime').datetime.strptime('2025-07-28', '%Y-%m-%d')

    ${data}=    Create Dictionary
    ...    userId=${userID}
    ...    date=${datetime}
    ...    products=${{ [{"productId": 1, "quantity": 8},{"productId": 2, "quantity": 15}] }}
    ${cart}=    Update Cart    ${id_obj}    ${data}
    Log To Console    ${cart}


CAS_TEST_5 Delete Cart
    [Tags]    cartsD
    ${cart_id}=    Set Variable    688a3b75370a85edf2f8fe47
    ${obj_id}=    Evaluate    __import__('bson').ObjectId("${cart_id}")
    ${result}=    Delete Cart    ${obj_id}

#                         CRUD Cart ERROR
CAS_TEST_6 Add Cart with empty userId
    [Tags]    cartsCR1
    ${data}=    Create Dictionary
    ...    userId=
    ...    date=2023-07-28
    ...    products=${{ [{"productId": 1, "quantity": 5},{"productId": 2, "quantity": 15}] }}
    ${response}=    Add Cart    ${data}
    Log To Console    ${response}

CAS_TEST_7 Read Cart by id with non-existing id
    [Tags]    cartsRII
    ${cart}=    Read Cart by id    99999
    Run Keyword If    '${cart}' == 'None'    Fail    Log To Console    Réponse vide (None) pour cart inexistant
    ...    ELSE    Length Should Be    ${cart}    0
CAS_TEST_8 Read Cart by id with invalid id
    [Tags]    cartsR2
    ${response}=    Read Cart by id    abc
    Should Be Equal As Integers    ${response.status_code}    400
    ${body}=    Set Variable    ${response.text}
    Log To Console    Réponse erreur : ${body}       

CAS_TEST_9 Update Cart with non-existing id
    [Tags]    cartsU
    ${data}=    Create Dictionary
    ...    userId=1
    ...    date=2023-07-28
    ...    products=${{ [{"productId": 1, "quantity": 5},{"productId": 2, "quantity": 15}] }}
    ${response}=    Update Cart    99999    ${data}
    Log To Console    ${response}    
CAS_TEST_10 Update Cart with empty data
    [Tags]    cartsU2
    ${response}=    Update Cart    1    {}
    Log To Console    ${response}

CAS_TEST_11 Delete Cart with non-existing id
    [Tags]    cartsD3
    ${response}=    Delete Cart    99999
    Log To Console    ${response}

CAS_TEST_12 Delete Cart with invalid id
    [Tags]    cartsD2
    ${response}=    Delete Cart    abc
    Should Be Equal As Integers    ${response.status_code}    400
    ${body}=    Set Variable    ${response.text}
    Log To Console    Réponse erreur : ${body}



CAS_TEST_13 Add Cart with invalid data
    [Tags]    cartsC2
    ${data}=    Create Dictionary
    ...    userId=1
    ...    date=2023-07-28
    ...    products=${{ [{"productId": "invalid", "quantity": 5},{"productId": 2, "quantity": 15}] }}
    ${response}=    Add Cart    ${data}
    Log To Console    ${response}    