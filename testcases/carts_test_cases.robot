*** Settings ***
Library    SeleniumLibrary
Resource    ../ressources/carts_keywords.robot
Library    Collections


Suite Setup    Connect To MongoDB

*** Test Cases *** 

CAS_TEST_1 Add Cart Pass
    [Tags]    cartsC
    ${data}=    Create Dictionary
    ...    userId=2
    ...    date=2023-07-28
    ...    products=${{ [{"productId": 1, "quantity": 2},{"productId": 2, "quantity": 5}] }}

    ${cart}=    Add Cart    ${data}
    Log To Console    ${cart}
    Dictionary Should Contain Key    ${cart}    id

CAS_TEST_2 Read Cart by id pass
    [Tags]    cartsRI
    ${carts}=    Read Cart by id    6
    Log To Console    ${carts}

CAS_TEST_3 Read All Cart
    [Tags]    cartsR
    ${carts}=    Read All Cart
    Log To Console    ${carts}  

CAS_TEST_4 Update Cart by id pass
    [Tags]    cartsU
    ${updated_data}=   Create Dictionary
    ...    userId=2
    ...    date=2024-07-28
    ...    products=${{ [{"productId": 1, "quantity": 5},{"productId": 2, "quantity": 15}] }}
    ${cart}=    Update Cart    11    ${updated_data}
    Log To Console    ${cart}
  
CAS_TEST_5 Delete Cart
    [Tags]    cartsD
    ${reponse}=    Delete Cart    11
    Log To Console    Cart delete

#                         CRUD Cart ERROR
CAS_TEST_1 Add Cart Error
    [Tags]    cartsCError

    ${empty_list}=    Create List
    ${data}=    Create Dictionary    userId=2    date=2023-07-28    products=${empty_list}

    ${cart}=    Add Cart    ${data}
    Log To Console    ${cart}

    # Ce test doit échouer si un ID est présent malgré une mauvaise requête
    Fail    L’API ne devrait pas retourner un ID pour un panier vide
