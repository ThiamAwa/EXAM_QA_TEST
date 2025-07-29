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





#                         CRUD PRODUCT     
Add Product
    [Arguments]    ${product_data}
    Evaluate    ${collProduct}.insert_one(${product_data})
    

Read Product by id
    [Arguments]    ${product_id}
    ${response}=    GET On Session    fakestore    /products/${product_id}
    Log    ${response.status_code}
    Log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}
    

Read All Product
    ${response}=    GET On Session       fakestore    /products
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}    

Update Product
    [Arguments]    ${product_id}    ${product}    
    ${response}=    PUT On Session    fakestore    /products/${product_id}    json=${product}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}
 
Delete Product
    [Arguments]    ${product_id}
    ${response}=    DELETE On Session    fakestore    /products/${product_id}
    Should Be Equal As Strings    ${response.status_code}    200
    RETURN    ${response.json()}
