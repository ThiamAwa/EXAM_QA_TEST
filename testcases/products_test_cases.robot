*** Settings ***
Library    SeleniumLibrary
Resource    ../ressources/products_keywords.robot
Library    Collections


Suite Setup    Connect To MongoDB

*** Test Cases ***

#                         CRUD PRODUCT PASS 

CAS_TEST_1 Add Product pass
    [Tags]    smoke
    ${data}=    Create Dictionary
    ...    id=2
    ...    title= sucre 
    ...    price=750
    ...    description=sucre
    ...    image=https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg
    ...    category=alimentaire
    Add Product    ${data}
    Log To Console    ${data}
    
CAS_TEST_2 Read Product by id pass
    [Tags]    smoke1
    ${products}=    Read Product by id    20
    Log To Console    ${products}

CAS_TEST_3 Read All Product
    [Tags]    smoke2
    ${products}=    Read All Product
    Log To Console    ${products}    

CAS_TEST_4 Update Product by id pass
    [Tags]    smoke3
    ${updated_data}=    Create Dictionary
    ...    title= lait en poudre
    ...    price=5999
    ...    description=lait
    ...    image=https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg
    ...    category=food

    ${product}=    Update Product    21    ${updated_data}
    Log To Console    ${product}
  
CAS_TEST_5 Delete Product
    [Tags]    smoke4
    ${reponse}=    Delete Product    20
    Log To Console    Product delete 