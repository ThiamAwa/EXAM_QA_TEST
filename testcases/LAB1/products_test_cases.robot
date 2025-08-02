*** Settings ***
Library    SeleniumLibrary
Resource    ../../ressources/Lab1/products_keywords.robot
Library    Collections



# Suite Setup    Connect To MongoDB


*** Test Cases ***

#                         CRUD PRODUCT PASS 

CAS_TEST_1 Add Product pass
    ${rate}=    Evaluate    4.2
    ${count}=    Evaluate    10

    ${rating}=    Create Dictionary
    ...    rate=${rate}
    ...    count=${count}

    ${id}=    Evaluate    4
    ${price}=    Evaluate    750.9

    ${data}=    Create Dictionary
    ...    id=${id}
    ...    title=lait
    ...    price=${price}
    ...    description=lait
    ...    image=https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg
    ...    category=alimentaire
    ...    rating=${rating}

    Add Product    ${data}
    Log To Console    ${data}
    
CAS_TEST_2 Read Product by id pass
    Read Product by id    4

CAS_TEST_3 Read All Product
    Read All Product
       

CAS_TEST_4 Update Product by id pass
    ${rate}=    Evaluate    4.2
    ${count}=    Evaluate    10

    ${rating}=    Create Dictionary
    ...    rate=${rate}
    ...    count=${count}

    ${id}=    Evaluate    4
    ${ObjectId}=    Set Variable    688980e6f19d5444bd341e35
    ${id_obj}=    Evaluate    __import__('bson').ObjectId("${ObjectId}")
    ${price}=    Evaluate    750.9

    ${updated_data}=    Create Dictionary
    ...    id=${id}
    ...    title=lait en poudre
    ...    price=${price}
    ...    description=lait en poudre
    ...    image=https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg
    ...    category=alimentaire et agro
    ...    rating=${rating}

    ${product}=    Update Product    ${id_obj}    ${updated_data}
    Log To Console    ${product}
  
CAS_TEST_5 Delete Product
    ${id}=    Set Variable    68897faa18361570b35b46bd
    ${id_obj}=    Evaluate    __import__('bson').ObjectId("${id}")
    ${reponse}=    Delete Product    ${id_obj}

    Log To Console    Product delete 

#                         CRUD PRODUCT Not Pass
CAS_TEST_1 Avec attribut manquant Add Product Error
    ${rate}=    Evaluate    4.2
    ${count}=    Evaluate    10

    ${rating}=    Create Dictionary
    ...    rate=${rate}
    ...    count=${count}

    ${id}=    Evaluate    4
    ${price}=    Evaluate    750.9

    ${data}=    Create Dictionary
    ...    id=${id}
    ...    price=${price}
    ...    description=lait
    ...    image=https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg
    ...    category=alimentaire
    ...    rating=${rating}

    Add Product    ${data}
    Log To Console    ${data}


CAS_TEST_1 Avec price en string add Product Error
    ${rate}=    Evaluate    4.2
    ${count}=    Evaluate    10

    ${rating}=    Create Dictionary
    ...    rate=${rate}
    ...    count=${count}

    ${id}=    Evaluate    4


    ${data}=    Create Dictionary
    ...    id=${id}
    ...    title=lait
    ...    price=700.9
    ...    description=lait
    ...    image=https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg
    ...    category=alimentaire
    ...    rating=${rating}

    Add Product    ${data}
    Log To Console    ${data}    

CAS_TEST_4_NP Update Product avec un champ manquant Error
    ${rate}=    Evaluate    4.2
    ${count}=    Evaluate    10

    ${rating}=    Create Dictionary
    ...    rate=${rate}
    ...    count=${count}

    ${id}=    Evaluate    4
    ${ObjectId}=    Set Variable    688980e6f19d5444bd341e35
    ${id_obj}=    Evaluate    __import__('bson').ObjectId("${ObjectId}")

    ${updated_data}=    Create Dictionary
    ...    id=${id}
    ...    title=lait modifié
    ...    description=nouveau lait
    ...    image=https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg
    ...    category=alimentaire
    ...    rating=${rating}

    ${product}=    Update Product    ${id_obj}    ${updated_data}
    Log To Console    ${product}

CAS_TEST_4_NP Update Product avec un type incorrect Error
    ${rate}=    Evaluate    4.2
    ${count}=    Evaluate    10

    ${rating}=    Create Dictionary
    ...    rate=${rate}
    ...    count=${count}

    ${id}=    Evaluate    4
    ${ObjectId}=    Set Variable    688980e6f19d5444bd341e35
    ${id_obj}=    Evaluate    __import__('bson').ObjectId("${ObjectId}")

    ${updated_data}=    Create Dictionary
    ...    id=${id}
    ...    title=lait modifié
    ...    description=nouveau lait
    ...    price=750.9
    ...    image=https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg
    ...    category=alimentaire
    ...    rating=${rating}

    ${product}=    Update Product    ${id_obj}    ${updated_data}
    Log To Console    ${product}

CAS_TEST_5_NP Delete Product With Invalid Id

    ${invalid_id}=    Set Variable    000000000000000000000000
    ${id_obj}=    Evaluate    __import__('bson').ObjectId("${invalid_id}")
    ${reponse}=    Delete Product    ${id_obj}
    Log To Console    ${reponse}

CAS_TEST_2_NP Read Product by Invalid Id
 
    ${invalid_id}=    Set Variable    000000000000000000000000
    ${id_obj}=    Evaluate    __import__('bson').ObjectId("${invalid_id}")
    ${reponse}=    Read Product by id    ${id_obj}
    Log To Console    ${reponse}


CAS_TEST_3_NP Read All Products On Empty Collection
    ${reponse}=    Read All Product
    Log To Console    ${reponse}
    Length Should Be    ${reponse}    0
